
import 'package:ecommerce/model/cartProvider.dart';
import 'package:ecommerce/showCart.dart';
import 'package:ecommerce/showProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Cart extends StatelessWidget {
  final itemController = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 380,
          leading:Row(children: [SizedBox(width: 145,),Icon(Icons.window_rounded,size: 25,color: Color.fromARGB(162, 255, 255, 255)),Text('Products',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),),SizedBox(width: 67,),
          GestureDetector(child: Icon(Icons.trolley,size: 30,color: const Color.fromARGB(255, 255, 255, 255),),
          onTap: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>ShowCart()),);
               
          },
          )],),
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
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 16,),
                      Container(
                        height: 260,
                        width: 150,
                        child: Column(children: [
                          GestureDetector(
                            onTap: (){
                              provider.current=0;
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>ShowProduct()));
                            },
                            child: Image.network(provider.pList[0].img)
                          ),
                          SizedBox(height: 6,),
                          Text(provider.pList[0].name,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 24),),
                          Row(children: [SizedBox(width: 10,),Text('\$${provider.pList[0].price}',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 19)),SizedBox(width: 35,),
                          IconButton(icon: Icon(provider.cart.contains(provider.pList[0]) ? Icons.check : Icons.add,color: Color.fromARGB(255, 121, 4, 4),size: 33,),
                                  onPressed: () {
                                    if (provider.cart.contains(provider.pList[0])) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Center(child: Text('Already in cart!')),
                                          duration: Duration(milliseconds: 1500),
                                        ),);
                            } else {
                              provider.add(provider.pList[0]);  
                            }
                                  },)
                        
                          ],)
                        ],)
                        
                        ),
                        SizedBox(width: 42,),
                      Container(
                        height: 260,
                        width: 150,
                        child: Column(children: [
                          GestureDetector(
                            onTap: (){
                              provider.current=1;
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>ShowProduct()));
                            },
                            child: Image.network(provider.pList[1].img)),
                          SizedBox(height: 6,),
                          Text(provider.pList[1].name,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 24),),
                          Row(children: [SizedBox(width: 10,),Text('\$${provider.pList[1].price}',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 19)),SizedBox(width: 35,),
                          IconButton(icon: Icon(provider.cart.contains(provider.pList[1]) ? Icons.check : Icons.add,color: Color.fromARGB(255, 121, 4, 4),size: 33,),
                                  onPressed: () {
                                    if (provider.cart.contains(provider.pList[1])) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Center(child: Text('Already in cart!')),
                                          duration: Duration(milliseconds: 1500),
                                        ),);
                            } else {
                              provider.add(provider.pList[1]);  
                            }
                                  },)
                        
                          ],)
                        ],)
                        
                        )
                      
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      SizedBox(width: 16,),
                      Container(
                        height: 260,
                        width: 150,
                        child: Column(children: [
                          GestureDetector(
                            onTap: (){
                              provider.current=2;
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>ShowProduct()));
                            },
                            child:Image.network(provider.pList[2].img)),
                          SizedBox(height: 6,),
                          Text(provider.pList[2].name,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 24),),
                          Row(children: [SizedBox(width: 10,),Text('\$${provider.pList[2].price}',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 19)),SizedBox(width: 35,),
                          IconButton(icon: Icon(provider.cart.contains(provider.pList[2]) ? Icons.check : Icons.add,color: Color.fromARGB(255, 121, 4, 4),size: 33,),
                                  onPressed: () {
                                    if (provider.cart.contains(provider.pList[2])) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Center(child: Text('Already in cart!')),
                                          duration: Duration(milliseconds: 1500),
                                        ),);
                            } else {
                              provider.add(provider.pList[2]);  
                            }
                                  },)
                        
                          ],)
                        ],)
                        
                        ),
                        SizedBox(width: 42,),
                      Container(
                        height: 260,
                        width: 150,
                        child: Column(children: [
                          GestureDetector(
                            onTap: (){
                              provider.current=3;
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>ShowProduct()));
                            },
                            child:Image.network(provider.pList[3].img)),
                          SizedBox(height: 6,),
                          Text(provider.pList[3].name,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 24),),
                          Row(children: [SizedBox(width: 10,),Text('\$${provider.pList[3].price}',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 19)),SizedBox(width: 35,),
                          IconButton(icon: Icon(provider.cart.contains(provider.pList[3]) ? Icons.check : Icons.add,color: Color.fromARGB(255, 121, 4, 4),size: 33,),
                                  onPressed: () {
                                    if (provider.cart.contains(provider.pList[3])) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Center(child: Text('Already in cart!')),
                                          duration: Duration(milliseconds: 1500),
                                        ),);
                            } else {
                              provider.add(provider.pList[3]);  
                            }
                                  },)
                        
                          ],)
                        ],)
                        
                        )
                      
                    ],
                  ),
              // ElevatedButton(onPressed: () {  
              //   String firstProductName = provider.pList[0].name;
              //   print(provider.cart[0].name);
                

              // }
              // ,
              // child: Text('Clear All',style: TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),),
              // style: ElevatedButton.styleFrom(
              //   elevation: 8.0,
              //   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
              //   backgroundColor:Color.fromRGBO(155, 6, 6, 1),
              //   foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                
              //   ),),
                    ],
              ),
            );
  }),
        ),
        ),
    );
  }
}