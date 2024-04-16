import 'package:cart/main.dart';
import 'package:cart/model/cartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => cartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShowCart(),
      ),
    ),
  );
}

class ShowCart extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        appBar: AppBar(
          leadingWidth: 380,
          leading:Row(children: [SizedBox(width: 10,),
          GestureDetector(child: Icon(Icons.arrow_back_sharp,size: 30,color: const Color.fromARGB(255, 255, 255, 255),),
          onTap: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MyApp()),);
          },
          ), 
          SizedBox(width: 120,),Icon(Icons.trolley,size: 30,color: const Color.fromARGB(255, 255, 255, 255),),Text('Cart',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 25,fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),)],),
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
                      Text('${provider.cart.isEmpty ? "Cart is Empty":''}',style: TextStyle(color: Color.fromARGB(151, 139, 134, 134),fontSize: 20),),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.cart.length,
                          itemBuilder: (context,index){
                            return Container(
                              decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(210, 57, 47, 47))),
                              child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              provider.cart[index].name,
                              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    try {
                                      provider.decraseQty(index);
                                    } catch (e) {
                                      
                                    }
                                  },
                                ),
                                Text(
                                  '${provider.cart[index].quantity}',
                                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    try {
                                      provider.increaseQty(index);
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Center(child: Text('Limited Stock!')), // Show error message in the Snackbar
                                          ),
                                        );
                                    }
                                    
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: GestureDetector(
                          child: Icon(Icons.delete_outline, color: Color.fromARGB(255, 113, 13, 13)),
                          onTap: () {
                            provider.delete(index);
                          },
                        ),
                            ));
                                        },
                        
                        ),
                      ),
                
              SizedBox(height: 28,),
              ElevatedButton(onPressed: () {  
                provider.removeAll();
                // print(provider.cart[0].quantity);
              }
              ,
              child: Text('Clear All',style: TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan',fontWeight: FontWeight.w600),),
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
    );
  }
}