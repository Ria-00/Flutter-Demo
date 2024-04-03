import 'package:employee_form/model/Employee.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowDetails extends StatelessWidget {
  Employee emp1=Employee();

  ShowDetails({super.key, required this.emp1});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 790,
            width:double.infinity,
            child: Column( children: [
              SizedBox(height: 100,),
              Text('${emp1.firstname}')
            ],),
          ),
        ),
      ),
    );
  }
}