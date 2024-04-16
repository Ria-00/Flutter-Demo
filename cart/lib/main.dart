
import 'package:cart/ShowCart.dart';
import 'package:cart/model/Product.dart';
import 'package:cart/model/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => cartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final itemController = TextEditingController();
  List<Product> pList=[
    Product("Shirt", 7999, 1,10,"https://imagescdn.thecollective.in/img/app/product/6/630053-6170579.jpg"),
    Product("Jacket", 8999, 1,10,"https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQaNes-ZFMvfz04qYzrkjVrxwSN6ZlBK5jvoPCnZnbxbtzEbYJeBxDhv8RiyGV1NAz0xTGfTZKG8siDJ4fw_-1AhyMB_Gk65VRtFdU9GT6gH7B_qfqa-e9ZjQ&usqp=CAE"),
    Product("Skirt", 4999, 1,10,"https://imagescdn.thecollective.in/img/app/product/8/881321-10579169.jpg"),
    Product("Cap", 4999, 1,10,"https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQIMMp3OMRPPCimeMT1KPsc9ZpsMWCkSRsc2icF3Ymdhviht7BBNoeqzhAvYc_0ZBS1QM4T6M42QE-6bGLUF3-LitbEI4c4t5tfAeA5bmt5pdxKo88Gfippyw"),
    
  ];
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
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      SizedBox(width: 16,),
                      Container(
                        height: 260,
                        width: 150,
                        child: Column(children: [
                          Image.network(pList[0].img),
                          SizedBox(height: 6,),
                          Text(pList[0].name,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 24),),
                          Row(children: [SizedBox(width: 10,),Text('\$${pList[0].price}',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 19)),SizedBox(width: 35,),
                          IconButton(icon: Icon(provider.cart.contains(pList[0]) ? Icons.check : Icons.add,color: Color.fromARGB(255, 121, 4, 4),size: 33,),
                                  onPressed: () {
                                    if (provider.cart.contains(pList[0])) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Center(child: Text('Already in cart!')),
                                          duration: Duration(milliseconds: 1500),
                                        ),);
                            } else {
                              provider.add(pList[0]);  
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
                          Image.network(pList[1].img),
                          SizedBox(height: 6,),
                          Text(pList[1].name,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 24),),
                          Row(children: [SizedBox(width: 10,),Text('\$${pList[1].price}',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 19)),SizedBox(width: 35,),
                          IconButton(icon: Icon(provider.cart.contains(pList[1]) ? Icons.check : Icons.add,color: Color.fromARGB(255, 121, 4, 4),size: 33,),
                                  onPressed: () {
                                    if (provider.cart.contains(pList[1])) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Center(child: Text('Already in cart!')),
                                          duration: Duration(milliseconds: 1500),
                                        ),);
                            } else {
                              provider.add(pList[1]);  
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
                          Image.network(pList[2].img),
                          SizedBox(height: 6,),
                          Text(pList[2].name,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 24),),
                          Row(children: [SizedBox(width: 10,),Text('\$${pList[2].price}',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 19)),SizedBox(width: 35,),
                          IconButton(icon: Icon(provider.cart.contains(pList[2]) ? Icons.check : Icons.add,color: Color.fromARGB(255, 121, 4, 4),size: 33,),
                                  onPressed: () {
                                    if (provider.cart.contains(pList[2])) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Center(child: Text('Already in cart!')),
                                          duration: Duration(milliseconds: 1500),
                                        ),);
                            } else {
                              provider.add(pList[2]);  
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
                          Image.network(pList[3].img),
                          SizedBox(height: 6,),
                          Text(pList[3].name,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 24),),
                          Row(children: [SizedBox(width: 10,),Text('\$${pList[3].price}',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255,),fontSize: 19)),SizedBox(width: 35,),
                          IconButton(icon: Icon(provider.cart.contains(pList[3]) ? Icons.check : Icons.add,color: Color.fromARGB(255, 121, 4, 4),size: 33,),
                                  onPressed: () {
                                    if (provider.cart.contains(pList[3])) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Center(child: Text('Already in cart!')),
                                          duration: Duration(milliseconds: 1500),
                                        ),);
                            } else {
                              provider.add(pList[3]);  
                            }
                                  },)
                        
                          ],)
                        ],)
                        
                        )
                      
                    ],
                  ),
              // ElevatedButton(onPressed: () {  
              //   String firstProductName = pList[0].name;
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