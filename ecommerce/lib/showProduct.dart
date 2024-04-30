import 'package:ecommerce/cart.dart';
import 'package:ecommerce/model/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 380,
          leading:Row(children: [SizedBox(width: 10,),
          GestureDetector(child: Icon(Icons.arrow_back_sharp,size: 30,color: const Color.fromARGB(255, 255, 255, 255),),
          onTap: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Cart()),);
          },
          ), 
          SizedBox(width: 120,),],),
          backgroundColor:  Color.fromARGB(237, 97, 10, 10),),

          body: SingleChildScrollView(
            child:Consumer<cartProvider>(
            builder: (context, provider, child) {
            return Container(
              height: 1200,
              width: double.infinity,
              decoration: BoxDecoration(color: Color.fromARGB(234, 1, 1, 1)),
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Container(
                    width: 300,
                    child: Image.network(provider.pList[provider.current].img),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    height: 60,
                    width: 500,
                    decoration: BoxDecoration(color: Color.fromARGB(96, 46, 45, 45),border: Border(top: BorderSide(width: 1,color: Color.fromARGB(153, 255, 255, 255)),bottom: BorderSide(width: 1,color: Color.fromARGB(103, 255, 255, 255)))),
                    child:Center(child: Text("${provider.pList[provider.current].name}",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 29,fontWeight: FontWeight.w200),))
                  
                  ),
                  Text("€ ${provider.pList[provider.current].price}",style: TextStyle(color: Color.fromARGB(255, 124, 9, 9),fontSize: 25,fontWeight: FontWeight.w600),),
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
                        
                ],
              ),
            );
  }),
       
        ),
    ));
  }
}