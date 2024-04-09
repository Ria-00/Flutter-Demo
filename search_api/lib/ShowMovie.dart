import 'package:flutter/material.dart';
import 'package:search_api/main.dart';
import 'package:search_api/model/movie.dart';

// ignore: must_be_immutable
class ShowMovie extends StatelessWidget {
  Movie m1=Movie();

  ShowMovie({super.key,required this.m1});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            
            width: double.infinity,
            height: 790,
            decoration: BoxDecoration(color: Color.fromARGB(239, 0, 0, 0)),
            child: Column(
              children: [
                SizedBox(height: 15,),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp()),), icon: Icon(Icons.arrow_back,size: 34,color: Color.fromARGB(205, 255, 255, 255),))
              ,
                ),
              Image.asset("assets/images/2.png",height: 200,),
            SizedBox(height: 13,),
            Text('${m1.title}',style: TextStyle(fontFamily: 'LeagueSpartan',color: const Color.fromARGB(255, 197, 186, 186),fontSize: 33),textAlign:TextAlign.left,),
            Row(children: [
              SizedBox(width:160 ,),
            Text('${m1.year}', style: TextStyle(color: Color.fromARGB(255, 174, 11, 11),fontSize: 15,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w900),textAlign: TextAlign.right,),
            SizedBox(width: 7,),
            Icon(Icons.calendar_today_rounded,color: Color.fromARGB(202, 255, 255, 255),size: 18,)
            ],),
            SizedBox(height: 35,),
            
            Row(
              children: [
              SizedBox(width: 27,),  
              Text('Directors:',style: TextStyle(color: Color.fromARGB(255, 174, 11, 11),fontSize: 20,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w900))
            ,Text('   ${m1.directors[0]}',style: TextStyle(color: Color.fromARGB(183, 231, 222, 222),fontSize: 16),
            )
            ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
              SizedBox(width: 27,),  
              Text('Genres:',style: TextStyle(color: Color.fromARGB(255, 174, 11, 11),fontSize: 20,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w900))
            ,Text('   ${m1.genres[0]['name']}, ${m1.genres[1]['name']}',style: TextStyle(color: Color.fromARGB(183, 231, 222, 222),fontSize: 16)
            )
            ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
              SizedBox(width: 27,),  
              Text('Cast:',style: TextStyle(color: Color.fromARGB(255, 174, 11, 11),fontSize: 20,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w900))
            ,Text('   ${m1.cast},',style: TextStyle(color: Color.fromARGB(183, 231, 222, 222),fontSize: 16)
            )
            ],
            ),
            SizedBox(height: 8,), 
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 27,right: 8),
                child: Text('Overview:',style: TextStyle(color: Color.fromARGB(255, 174, 11, 11),fontSize: 20,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w900)),
              ),
             
            ),Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 5,bottom: 7),
              child: Text('${m1.overview}',style: TextStyle(color: Color.fromARGB(183, 231, 222, 222),fontSize: 16)
                         ),
            )
            
            
              
              ],
            
            )
             
          ),
        ),
        ),
    );
  }
}

