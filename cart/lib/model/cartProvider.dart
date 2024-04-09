import 'package:cart/model/Product.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class cartProvider extends ChangeNotifier{

  List<Product> cart=[];

  void add(String name){
    cart.add(name);
    notifyListeners();
  }

  void remove(String name){
    cart.remove(name);
    notifyListeners();
  }

  void removeAll(){
    cart.clear();
    notifyListeners(); 
    }



}