import 'package:ecommerce/Signup.dart';
import 'package:ecommerce/cart.dart';
import 'package:ecommerce/model/cartProvider.dart';
import 'package:ecommerce/showCart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();    // ensure that all the widgets be available with firebase integration
  await Firebase.initializeApp();   //initialzes an instance and returns the appbefore actual building[initializes the connection bw firebase before widget tree building starts]

  // Thus called before runApp (await to wait for connection first)

  runApp(
    ChangeNotifierProvider(
      create: (context) => cartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      home:MyApp(),
      routes: {
        '/catlog':(context) => Cart(),
        '/cart':(context) => ShowCart()
      },
    
    )
  ));
}

class MyApp extends StatefulWidget{

  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState(); 
  
}

class MyAppState extends State<MyApp>{

  bool see=false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true,title: Text('LOGIN',style: TextStyle(fontWeight: FontWeight.w500),),backgroundColor: Color.fromRGBO(155, 6, 6, 1),foregroundColor: Color.fromARGB(255, 255, 255, 255),),
        body: SingleChildScrollView(child: Container(
          height: 790,
          width: double.infinity,
          decoration: BoxDecoration(color: Color.fromARGB(239, 0, 0, 0)),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 100,),
              // Image.asset('assets/images/imbc1.png',height: 100,),
              SizedBox(height: 50,),
              TextField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),
              style: TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                hintText: 'Enter Username',
                hintStyle: TextStyle(color: Color.fromARGB(90, 252, 252, 252)),
                labelText:'Username',labelStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                filled: true,
                fillColor: Color.fromARGB(160, 91, 93, 95),
                border: OutlineInputBorder(
                borderSide: BorderSide.none,),
                ),
              ),
              SizedBox(height: 15,),
              Stack(
                children: [
                  Positioned(child: IconButton(icon: Icon(see ? Icons.visibility : Icons.visibility_off,color: Color.fromARGB(168, 135, 135, 135),size: 33,),
                                  onPressed: () {
                                    
                                    if (see==false) {
                                      see=true;
                                    } else {
                                      see=false;
                                    }
                                  },
                                  ),
                      top: 10, 
                      left: 300,           
                  ),
                  TextField(
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
              style: TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                hintText: 'Enter Password',
                hintStyle: TextStyle(color: Color.fromARGB(90, 252, 252, 252)),
                labelText:'Password',labelStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),),
                filled: true,
                fillColor: Color.fromARGB(160, 91, 93, 95),
                border: OutlineInputBorder(
                borderSide: BorderSide.none,),
                ),obscureText: true,),
                
                ],
              ),
              
                SizedBox(height: 30,),
                ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Cart()),
            );
          },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                minimumSize:const Size(380, 50),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
                backgroundColor:Color.fromRGBO(155, 6, 6, 1),
                foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                
                ),),
                SizedBox(height: 12,),
                Row(children: [
                  Container(
                    width: 17.0,
                    height: 17.0, 
                    decoration: BoxDecoration(
                      color: Color.fromARGB(110, 255, 255, 255),
                      border: Border.all(color: Colors.black, width: 2.0),
                      shape: BoxShape.rectangle,
                    ),
                  )
                  ,Text('  Remember Me                                              Need Help?',style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),)],),
                SizedBox(height:50,),
                Row(
                  children: [
                      Text(' New here?',style: TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1),fontWeight: FontWeight.w300),),
                GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Signup()),
            );
          },
          child: Text(
            '  Sign up now',
            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700,color: const Color.fromARGB(255, 255, 255, 255)),
          )),  ],
                ),
                
                SizedBox(height: 12,),
                
             ],
          ),
        ),),
      ),
    );
  }
}

