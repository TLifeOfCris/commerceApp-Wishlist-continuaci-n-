import 'package:ecommerceapp_2/models/productModel.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1
  });
}