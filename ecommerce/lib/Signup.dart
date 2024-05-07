import 'package:ecommerce/Services/UserOperations.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/model/UserClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  UserOpeartions operate=UserOpeartions();
  UserClass u=UserClass();
  final emailController=TextEditingController(); 
  final passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true,title: Text('SIGN UP',style: TextStyle(fontWeight: FontWeight.w500),),backgroundColor: Color.fromRGBO(155, 6, 6, 1),foregroundColor: Color.fromARGB(255, 255, 255, 255),),
        body: SingleChildScrollView(
          child: Container(
            height: 790,
            decoration: BoxDecoration(color: Color.fromARGB(234, 1, 1, 1)),
            padding: EdgeInsets.all(12),
            child: Column(children: [
              SizedBox(height: 35,),
              // Row(children: [
              //   Flexible(
              //     child: TextField(
              //       cursorColor: const Color.fromARGB(255, 255, 255, 255),
              //       style: TextStyle(
              //         color: Colors.white
              //       ),
              //       decoration: InputDecoration(labelText: 'Enter First Name',
              //       )),
              //   ),
              //   SizedBox(width: 25,),
              //   Flexible(
              //     child: TextField(decoration: InputDecoration(labelText: 'Enter Last Name')),flex:1,
              //   ),
              // ],),
              TextField(
                controller: emailController, 
                style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  labelText: 'Email',
                  hintText: 'abc@domain.com',
                  hintStyle: TextStyle(color: Color.fromARGB(156, 156, 151, 151))
                  ),
                  ),
              TextField(
                style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                controller: passController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,),
              // TextField(decoration: InputDecoration(labelText: 'Confirm Password'),obscureText: true,),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  u.email=emailController.text.trim();
                  u.password=passController.text.trim();
                  operate.add(u);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp()));},
                child:Text('Register'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    backgroundColor:Color.fromARGB(255, 174, 15, 28),
                    foregroundColor:  Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              
              SizedBox(height: 25,),
              Text('OR',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
              SizedBox(height: 20,),
              Row(children: [
                Flexible(child: 
                  ElevatedButton(onPressed: ()=>(), child: Container(
                
                child: Row(children:[SizedBox(width: 60,),Text("       Continue with Google",style: TextStyle(fontWeight: FontWeight.w600),)],),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    backgroundColor:Color.fromARGB(255, 172, 7, 7),
                    foregroundColor:  Color.fromRGBO(255, 255, 255, 1),
                    minimumSize: Size(20, 47)
                ),
              )
                ),
                
              ],),
              
              

            ],),
          ),
        ),
        
        ),
    );
  }
}