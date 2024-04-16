import 'package:cart/model/Product.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class cartProvider extends ChangeNotifier{

  List<Product> cart=[];

  void add(Product n){
      cart.add(n);
    notifyListeners();
  }

  void increaseQty(int i){
    cart[i].quantity+=1;
    notifyListeners();
  }

  void decraseQty(int i){
    cart[i].quantity-=1;
    notifyListeners();
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