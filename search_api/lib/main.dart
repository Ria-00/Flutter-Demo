import 'package:flutter/material.dart';
import 'package:search_api/ShowMovie.dart';
import 'package:search_api/api/helper.dart';
import 'package:search_api/model/Search.dart';
import 'package:search_api/model/movie.dart';

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


Search s=Search();
Movie m=Movie();

class _MyAppState extends State<MyApp> {

  var formKey = GlobalKey<FormState>();
  String? gen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
                leadingWidth: 380,
                leading:Row(children: [SizedBox(width: 125,),Icon(Icons.search,size: 30,color: const Color.fromARGB(255, 255, 255, 255),),Text('Search',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),)],),
                backgroundColor:  Color.fromARGB(237, 97, 10, 10),
                
              ),
      
        body: 
        Form(
          key: formKey,
          child:  SingleChildScrollView(
          child: Container(
          height: 820,
          decoration: BoxDecoration(color: Color.fromARGB(234, 1, 1, 1)),
          padding: EdgeInsets.all(12),
          child: Column(children: [
            SizedBox(height: 25,),
             TextFormField(
                    onChanged: (value){
                      setState(() {
                        s.title=value;
                      });
                    },
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
                    decoration: InputDecoration(hintText: 'Enter title',
                hintStyle: TextStyle(color: Color.fromARGB(90, 252, 252, 252)),
                labelText:'Movie Title',labelStyle: TextStyle(color: Color.fromARGB(176, 255, 255, 255)),
                filled: true,
                fillColor: Color.fromARGB(160, 91, 93, 95),
                border: OutlineInputBorder(
                borderSide: BorderSide.none,),
                    )),
              SizedBox(height: 18,),
              Row(
                children: [
                  Text('Country',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255),fontSize: 17,fontWeight: FontWeight.w600),),
                  SizedBox(width: 10,),
                  Radio(value: "us", groupValue: gen, onChanged: (value) {
                    setState(() {
                      gen=value;
                      s.country=value!;
                    });
                  },
                  
                  fillColor: MaterialStateProperty.all(Color.fromARGB(255, 112, 18, 19))
                  ),Text('US',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)),),
                  Radio(value: "gb", groupValue: gen, onChanged: (value) {
                    setState(() {
                      gen=value;
                      s.country=value!;
                    });
                  },
                  fillColor: MaterialStateProperty.all(Color.fromARGB(255, 112, 18, 19))
                  ),Text('UK',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)),),
                  Radio(value: "in", groupValue: gen, onChanged: (value) {
                    setState(() {
                      gen=value;
                      s.country=value!;
                    });
                  },
                  fillColor: MaterialStateProperty.all(Color.fromARGB(255, 112, 18, 19))
                  ),Text('India',style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)),)
                ],
              ),
              
              SizedBox(height: 15,),
              Theme(
                data: Theme.of(context).copyWith(
                canvasColor: Color.fromARGB(242, 88, 85, 85)),
              child:DropdownButtonFormField<String>(
                items: [
                DropdownMenuItem<String>(
                  value: 'en',
                  child: Text('English',style: TextStyle(color: Color.fromARGB(214, 255, 255, 255)),)),

                DropdownMenuItem<String>(
                  value: 'es',
                  child: Text('Espanol',style: TextStyle(color: Color.fromARGB(214, 255, 255, 255)),)),
                  DropdownMenuItem<String>(
                  value: 'fr',
                  child: Text('French',style:TextStyle(color: Color.fromARGB(214, 255, 255, 255)))),
              ], 
              decoration: InputDecoration(
                hintText: 'Select your language',
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
              onChanged: (value){
                setState(() {
                  s.lang=value!;
              });
              },
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
              
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () async{  
                 if (formKey.currentState!.validate()){
                  Helper h=Helper();
                  m=await h.getMovie(s.title, s.country, s.lang);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowMovie(m1:m)));
                 }
                else{
                 print("Error");
                }
              }
              ,
              child: Text('Search',style: TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),),
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                minimumSize:const Size(380, 50),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
                backgroundColor:Color.fromRGBO(155, 6, 6, 1),
                foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                
                ),),
                SizedBox(height: 150,),
                
            Image.asset("assets/images/bg1.png",height: 250,),
          ],),
        ),
          )
        ),
      ),

    );
  }
}
