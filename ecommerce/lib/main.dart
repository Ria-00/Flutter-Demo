import 'package:ecommerce/Signup.dart';
import 'package:ecommerce/cart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyApp(),
    
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
