import 'package:age_validator/eligibilityBloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  final ageController=TextEditingController();
  eligibilityBloc elig=eligibilityBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Age Validator',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),)),backgroundColor: Color.fromARGB(255, 130, 119, 252),foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Color.fromARGB(129, 231, 231, 231)),
            padding: EdgeInsets.all(12),
            height: 1200,
            child: Column(children: [
              SizedBox(height: 200,),
              StreamBuilder(
                stream: elig.mainStream,
                builder: (context, snapshot) {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: () {
                          if (snapshot.data==true) {
                            return Color.fromARGB(255, 7, 150, 50);
                          } else {
                            return Color.fromARGB(255, 190, 4, 4);
                          }
                        }(),
                    ),
                  );
                }
              ),
              SizedBox(height: 25,),
              TextField(
                onChanged: (value){
                  elig.eventSink.add(int.parse(value));
                },
                controller: ageController,
                decoration: InputDecoration(hintText: 'Enter age',
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                labelText:'Age',labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                filled: true,
                fillColor: Color.fromARGB(94, 117, 116, 130),
                border: OutlineInputBorder(
                borderSide: BorderSide.none,),
                    )
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                elig.eventSink.add(int.parse(ageController.text.trim()));
              },
              child: Text('Check',style: TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),),
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                minimumSize:const Size(120, 50),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
                backgroundColor:Color.fromARGB(255, 130, 119, 252),
                foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                
                ),),
            ]
            ,),
          ),
        ),
        ),
        
    );
  }
}

