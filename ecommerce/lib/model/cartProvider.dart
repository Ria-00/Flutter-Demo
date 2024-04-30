
import 'package:ecommerce/model/Product.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class cartProvider extends ChangeNotifier{

  int current=0;

  List<Product> cart=[];
  List<Product> pList=[
    Product("Shirt", 7999, 1,10,"https://imagescdn.thecollective.in/img/app/product/6/630053-6170579.jpg"),
    Product("Jacket", 8999, 1,10,"https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQaNes-ZFMvfz04qYzrkjVrxwSN6ZlBK5jvoPCnZnbxbtzEbYJeBxDhv8RiyGV1NAz0xTGfTZKG8siDJ4fw_-1AhyMB_Gk65VRtFdU9GT6gH7B_qfqa-e9ZjQ&usqp=CAE"),
    Product("Skirt", 4999, 1,10,"https://imagescdn.thecollective.in/img/app/product/8/881321-10579169.jpg"),
    Product("Cap", 4999, 1,10,"https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQIMMp3OMRPPCimeMT1KPsc9ZpsMWCkSRsc2icF3Ymdhviht7BBNoeqzhAvYc_0ZBS1QM4T6M42QE-6bGLUF3-LitbEI4c4t5tfAeA5bmt5pdxKo88Gfippyw"),
    
  ];

  void add(Product n){
      cart.add(n);
    notifyListeners();
  }

  void increaseQty(int i){
    try {
      if (cart[i].quantity+1>cart[i].limit) {
      throw Exception();
    } else {
      cart[i].quantity+=1;
      notifyListeners();
    }
    } catch (e) {
      throw Exception();
    }
    
    
  }

  void decraseQty(int i){
    try {
      if (cart[i].quantity-1<0) {
      throw Exception();
    } else {
      cart[i].quantity-=1;
      notifyListeners();
    }
    } catch (e) {
      throw Exception();
    }
    
  }

  void delete(int n){
    cart.removeAt(n);
    notifyListeners();
  }

  void removeAll(){
    cart.clear();
    notifyListeners(); 
    }

}