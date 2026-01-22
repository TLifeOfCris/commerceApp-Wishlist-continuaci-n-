import 'package:ecommerceapp_2/models/cart_item.dart';
import 'package:ecommerceapp_2/models/productModel.dart';
import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier{
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  bool contains(Product product) => _items.any((item) => 
  item.product.id == product.id);
  //Añadir al carrito
  void addToCart(Product product){
    final index = _items.indexWhere((item) => item.product.id == product.id);

    if (index == -1){
      _items.add(CartItem(product: product));
    } else {
      _items[index].quantity++;
    }
    notifyListeners();
  }

  //Eliminar producto de carrito
  void removeFromCart(Product product){
    _items.removeWhere(
      (item) => item.product.id == product.id);
    notifyListeners();
  }

  void decreaseQuantiy (Product product){
    final index = 
    _items.indexWhere((item) => item.product.id == product.id);

    if (index == -1) return ;

    if (_items[index].quantity > 1){
      _items[index].quantity--;

    }else {
      removeFromCart(product);
    }
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);
}