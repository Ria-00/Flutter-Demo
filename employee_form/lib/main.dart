
import 'package:employee_form/ShowDetails.dart';
import 'package:employee_form/model/Employee.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  var formKey = GlobalKey<FormState>();
  Employee emp=Employee();
  bool emailPer=false;
  String? gen;
  
  @override
  Widget build(BuildContext context) {
    emp.issues = {
      'The information provided about movies accurate and complete.': false,
      'Easy to create an account and manage your preferences': false,
      'Need to work on the UI/UX': false,
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
                leadingWidth: 380,
              
                backgroundColor:  Color.fromARGB(237, 97, 10, 10),
                title:Center(child: Text('Basic Information',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),),)
              ),
      
        body: 
        Form(
          key: formKey,
          child:  SingleChildScrollView(
          child: Container(
          height: 2000,
          decoration: BoxDecoration(color: Color.fromARGB(234, 1, 1, 1)),
          padding: EdgeInsets.all(12),
          child: Column(children: [
            SizedBox(height: 25,),
            Row(children: [
                Flexible(
                  child: TextFormField(
                    onChanged: (value) => 
                    setState(() {
                      emp.firstname=value;
                    }),
                    autovalidateMode: AutovalidateMode.onUserInteraction,  
                    validator: (value){if (value==null||value.isEmpty) {
                      return 'Required';
                    }
                    else{
                      return null;
                    }}
                    ,
                    cursorColor: Color.fromARGB(218, 255, 255, 255),
                    style: TextStyle(
                      color: Color.fromARGB(109, 255, 255, 255)
                    ),
                    decoration: InputDecoration(hintText: 'Enter FirstName',
                hintStyle: TextStyle(color: Color.fromARGB(90, 252, 252, 252)),
                labelText:'FirstName',labelStyle: TextStyle(color: Color.fromARGB(176, 255, 255, 255)),
                filled: true,
                fillColor: Color.fromARGB(160, 91, 93, 95),
                border: OutlineInputBorder(
                borderSide: BorderSide.none,),
                    )),
                ),
                SizedBox(width: 25,),
                Flexible(
                
                child: 
                TextFormField(
                  onChanged: (value) => 
                    setState(() {
                      emp.lastName=value;
                    }),
                validator: (value) {
                  if (value==null||value.isEmpty) {
                    return 'Required';
                  } else {
                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,  
                style: TextStyle(
                      color: Color.fromARGB(109, 255, 255, 255)
                    ),
                    decoration: InputDecoration(hintText: 'Enter LastName',
                hintStyle: TextStyle(color: Color.fromARGB(90, 252, 252, 252)),
                labelText:'LastName',labelStyle: TextStyle(color: Color.fromARGB(176, 255, 255, 255)),
                filled: true,
                fillColor: Color.fromARGB(160, 91, 93, 95),
                border: OutlineInputBorder(
                borderSide: BorderSide.none,),
                    )),
                ),
              ],),
              SizedBox(height: 18,),
              Row(
                children: [
                  Text('Gender',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255),fontSize: 17,fontWeight: FontWeight.w600),),
                  SizedBox(width: 10,),
                  Radio(value: "M", groupValue: gen, onChanged: (value) {
                    setState(() {
                      gen=value;
                      emp.gender=value;
                    });
                  },
                  
                  fillColor: MaterialStateProperty.all(Color.fromARGB(255, 112, 18, 19))
                  ),Text('Male',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)),),
                  Radio(value: "F", groupValue: gen, onChanged: (value) {
                    setState(() {
                      gen=value;
                      emp.gender=value;
                    });
                  },
                  fillColor: MaterialStateProperty.all(Color.fromARGB(255, 112, 18, 19))
                  ),Text('Female',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)),),
                  Radio(value: "O", groupValue: gen, onChanged: (value) {
                    setState(() {
                      gen=value;
                      emp.gender=value;
                    });
                  },
                  fillColor: MaterialStateProperty.all(Color.fromARGB(255, 112, 18, 19))
                  ),Text('Other',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)),)
                ],
              ),
              
              SizedBox(height: 15,),
              Theme(
                data: Theme.of(context).copyWith(
                canvasColor: Color.fromARGB(242, 88, 85, 85)),
              child:DropdownButtonFormField<String>(
                items: [
                DropdownMenuItem<String>(
                  value: '15-17 Years',
                  child: Text('15-17',style: TextStyle(color: Color.fromARGB(214, 255, 255, 255)),)),

                DropdownMenuItem<String>(
                  value: '18-35 Years',
                  child: Text('18-35',style: TextStyle(color: Color.fromARGB(214, 255, 255, 255)),)),
                  DropdownMenuItem<String>(
                  value: '36-60 Years',
                  child: Text('36-60',style:TextStyle(color: Color.fromARGB(214, 255, 255, 255)))),
                DropdownMenuItem<String>(
                  value: '60+ Years',
                  child: Text('60+',style:TextStyle(color: Color.fromARGB(214, 255, 255, 255)))),
                  
              ], 
              decoration: InputDecoration(
                hintText: 'Select your age',
                hintStyle: TextStyle(color: Color.fromARGB(184, 119, 113, 113)),
              enabledBorder: UnderlineInputBorder(      
                borderSide: BorderSide(color:        
                    const Color.fromARGB(255, 126, 16, 16)),),  
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: 
                    Color.fromARGB(255, 120, 15, 15)),),  
                        ),
              elevation: 2,
              style: TextStyle(color: Colors.white, 
                    fontSize: 16),
              onChanged: (value){setState(() {
                emp.age=value;
              });},
              iconSize: 30.0,
              iconEnabledColor: Colors.white,
              validator: (value) {
                if (value==null) {
                  return 'Required';
                } else {
                  return null;
                }
              },
              ),),
              SizedBox(height: 35,),
              Align(
              alignment: Alignment.centerLeft,
              child:Text('Issues:',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255),fontSize: 17,fontWeight: FontWeight.w600),),
               
               ),
               SizedBox(height: 20,),
              Column(children: [

                StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                  return Column(
                    children: [
                      Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Color.fromARGB(255, 39, 36, 36),
                  ),
                  child:Column(children: [
                        CheckboxListTile(
                        activeColor:Color.fromARGB(255, 88, 14, 14) ,
                  title: Text('Accurate Info',style: TextStyle(color: Color.fromARGB(205, 255, 255, 255)),),
                  value: emp.issues["The information provided about movies accurate and complete."]  , onChanged: (nvalue){
                  setState(() {
                    emp.issues["The information provided about movies accurate and complete."]=nvalue!;
                    print(emp.issues['The information provided about movies accurate and complete.']);
                  });
                }),
                CheckboxListTile(
                        activeColor:Color.fromARGB(255, 88, 14, 14) ,
                  title: Text('Need to work on UI/UX',style: TextStyle(color: Color.fromARGB(205, 255, 255, 255)),),
                  value: emp.issues["Need to work on the UI/UX"]  , onChanged: (nvalue){
                  setState(() {
                    emp.issues["Need to work on the UI/UX"]=nvalue!;
                    print(emp.issues['Need to work on the UI/UX']);
                  });
                }),
                CheckboxListTile(
                        activeColor:Color.fromARGB(255, 88, 14, 14) ,
                  title: Text('Easy to manage preferences',style: TextStyle(color: Color.fromARGB(205, 255, 255, 255)),),
                  value: emp.issues["Easy to create an account and manage your preferences"]  , onChanged: (nvalue){
                  setState(() {
                    emp.issues["Easy to create an account and manage your preferences"]=nvalue!;
                    print(emp.issues['Easy to create an account and manage your preferences']);
                  });
                }),
                  ],),
                      
                   ) ],
                  );
                } ),
                SizedBox(height: 25,),
              
              ],),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () { 
                if (formKey.currentState!.validate()) {
                 Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>ShowDetails(emp1:emp)),);
                }
                else{
                 print("Error");
                  }
              },
              child: Text('Login',style: TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),),
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                minimumSize:const Size(380, 50),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
                backgroundColor:Color.fromRGBO(155, 6, 6, 1),
                foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                
                ),),
                SizedBox(height: 6,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SwitchListTile(
          activeColor: Color.fromARGB(205, 117, 25, 25),
                title: Text('Share email?',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255),fontSize: 17,fontWeight: FontWeight.w600,),textAlign: TextAlign.left,),
                value: emailPer, onChanged: (value) {
                setState(() {
                  emailPer=value;
                });
              },),
                )
         
          ],),
        ),
          )
        ),
      ),
    );
  }
}

