import 'package:ecommerceapp_2/models/cart_item.dart';
import 'package:ecommerceapp_2/models/productModel.dart';
import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier{
  //String es el PRODUCT ID y el CartItem el objeto dentro del caarrito 
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  bool contains(Product product){
    return _items.containsKey(product.id);
  }
  //Añadir al carrito
  void addToCart(Product product){
    //Aqui pregunta si el producto ya está en el carrito
    if (_items.containsKey(product.id)){
      //Si existe accede directo al item porque y sabe que existe y aumenta cantidad
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(productId: 
      product.id, product: product.title, price: product.price);
    }
    notifyListeners();
  }

  //Eliminar producto de carrito
  void removeFromCart(Product product){
    //QUITAR PRODUCTO POR PRODUCT ID
    _items.remove(product.id);
    notifyListeners();
  }

  void decreaseQuantity(Product product){
    if (!_items.containsKey(product.id)) return;
    final cartItem = _items[product.id]!;

    if (cartItem.quantity > 1){
      cartItem.quantity--;
    } else {
      _items.remove(product.id);
    }
    notifyListeners();
  }

  double get totalPrice => _items.values.fold(0, (sum, item) => sum + item.price * item.quantity,
  );
}