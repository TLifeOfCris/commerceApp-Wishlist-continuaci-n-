import 'package:ecommerceapp_2/models/productModel.dart';
import 'package:flutter/material.dart';

class Productsprovider extends ChangeNotifier{
  final List<Product> _products = [
    Product(
    id: '1', 
    title: 'Iphone Case', 
    description: 'Silicone case for iphone',
    price: 29.99),

    Product(id: '2',
    title: 'Wireless Headphones',
    price: 199.99,
    description: 'Noise cancelling'),
  ];


  //Todos los productos
  List<Product> get products => _products;

  //Wishlist (likeados)
  List<Product> get wishlist => _products.where((p) => p.isLiked).toList();

  //Like / Unlike 
  void toggleLike(String productId){
    final index = _products.indexWhere((p) => p.id == productId);
    //devuelve -1 cuando no encuentra nada entonces cuando devuelva ese número significa STOP
    if (index == -1) return;

    _products[index].isLiked = !_products[index].isLiked;
    notifyListeners();
  }


  //context.read<ProductsProvider>().toggleLike(product.id); para corazon


  // Todos los productos
  
}