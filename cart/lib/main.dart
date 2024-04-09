import 'package:cart/model/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final itemController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>cartProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 380,
          leading:Row(children: [SizedBox(width: 145,),Icon(Icons.trolley,size: 30,color: const Color.fromARGB(255, 255, 255, 255),),Text('Cart',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),)],),
          backgroundColor:  Color.fromARGB(237, 97, 10, 10),),
      
        body: SingleChildScrollView(
          child:Consumer<cartProvider>(
            builder: (context, provider, child) {
            return Container(
              width: double.infinity,
              height: 820,
              decoration: BoxDecoration(color: Color.fromARGB(234, 1, 1, 1)),
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Container(
                        width: 290,
                        child: TextFormField(
                          controller: itemController,
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
                          decoration: InputDecoration(hintText: 'Enter name',
                                        hintStyle: TextStyle(color: Color.fromARGB(90, 252, 252, 252)),
                                        labelText:'Item name',labelStyle: TextStyle(color: Color.fromARGB(176, 255, 255, 255)),
                                        filled: true,
                                        fillColor: Color.fromARGB(160, 91, 93, 95),
                                        border: OutlineInputBorder(
                                        borderSide: BorderSide.none,),
                          )),
                      ),
                      SizedBox(width: 14,),
                      GestureDetector(
                        child: Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 113, 13, 13),
                        size: 60,
                      ),
                      onTap: () {
                        provider.add(itemController.text.trim());
                        itemController.text='';
                      },
                      )
                      
                    ],
                  ),
                  SizedBox(height: 28,),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.cart.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              title: Text(provider.cart[index],style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
                              trailing:GestureDetector(
                                child:Icon(Icons.delete_outline,color:  Color.fromARGB(255, 113, 13, 13),),
                                onTap: () {
                                  provider.remove(provider.cart[index]);
                                },
                                )
                               
                            );
                          },
                        
                        ),
                      ),
                      SizedBox(height: 10,),
              ElevatedButton(onPressed: () {  
                provider.cart.re();
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
                    ],
              ),
            );
  }),
        ),
        ),
    ),
    );
  }
}