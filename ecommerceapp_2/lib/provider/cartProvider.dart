import 'package:ecommerceapp_2/models/cart_item.dart';
import 'package:ecommerceapp_2/models/productModel.dart';
import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier{
  //String es el PRODUCT ID y el CartItem el objeto dentro del caarrito 
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items;

  bool contains(Product product) => _items.any((item) => 
  item.product.id == product.id);
  //Añadir al carrito
  void addToCart(Product product){
    //Aqui pregunta si el producto ya está en el carrito
    if (_items.containsKey(product.id)){
      //Si existe accede directo al item porque y sabe que existe y aumenta cantidad
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(productId: 
      product.id, product: product.title);
    }
    notifyListeners();
  }

  //Eliminar producto de carrito
  void removeFromCart(Product product){
    //QUITAR PRODUCTO POR PRODUCT ID
    _items.remove(product.id);
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