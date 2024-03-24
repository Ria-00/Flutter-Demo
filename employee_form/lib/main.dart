import 'package:employee_form/model/Employee.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Employee emp=Employee();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 380,
          backgroundColor:  Color.fromARGB(238, 39, 20, 72),
          title:Center(child: Text('Basic Information',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 20),),)
            
          ),
      
        body: SingleChildScrollView(
          child: Container(
            height: 790,
            decoration: BoxDecoration(color: Color.fromARGB(255, 212, 195, 216) ),
            padding: EdgeInsets.all(10),
            child: Column(children: [
            SizedBox(height: 40,),
            TextField(
              cursorColor: Color.fromARGB(255, 74, 72, 72),
              style: TextStyle(
                color: const Color.fromARGB(255, 197, 192, 192)
              ),
              decoration: InputDecoration(
                
                hintText: 'Enter name',
                hintStyle: TextStyle(color: Color.fromARGB(224, 71, 69, 69)),
                labelText:'Name',labelStyle: TextStyle(color:  Color.fromARGB(224, 71, 69, 69),),
                filled: true,
                fillColor: Color.fromARGB(191, 238, 240, 241),
                border: OutlineInputBorder(
                borderSide: BorderSide.none,),
                ),),
            SizedBox(height: 8,),
            TextField(
                cursorColor: Color.fromARGB(255, 74, 72, 72),
              style: TextStyle(
                color: const Color.fromARGB(255, 197, 192, 192)
              ),
              decoration: InputDecoration(
                hintText: 'Enter age',
                hintStyle: TextStyle(color: Color.fromARGB(224, 71, 69, 69)),
                labelText:'Age',labelStyle: TextStyle(color:  Color.fromARGB(224, 71, 69, 69),),
                filled: true,
                fillColor: Color.fromARGB(191, 238, 240, 241),
                border: OutlineInputBorder(
                borderSide: BorderSide.none,),
                ),obscureText: true,),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()=>{}, child: Text('Submit'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              backgroundColor: Color.fromARGB(255, 49, 21, 75),
              foregroundColor: Color.fromARGB(255, 255, 255, 255)
            ),
            )
          ],),

          ),        ),
      ),
      
       );
  }
}


