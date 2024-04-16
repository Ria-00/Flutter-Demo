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