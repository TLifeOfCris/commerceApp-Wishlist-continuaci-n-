import 'package:ecommerceapp_2/models/productModel.dart';

class CartItem {
  final String product;
  final String productId;
  final double price;
  int quantity;

  CartItem({
    required this.productId,
    required this.product,
    this.quantity = 1,
    this.price = 1,
  });
}