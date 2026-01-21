import 'package:ecommerceapp_2/models/productModel.dart';
import 'package:flutter/material.dart';

class Productsprovider extends ChangeNotifier{
  final List<Product> _products = [
    Product(
    id: '1', 
    title: 'Iphone Case', 
    description: 'Silicone case for iphone',
    price: 29.99)
  ];
}