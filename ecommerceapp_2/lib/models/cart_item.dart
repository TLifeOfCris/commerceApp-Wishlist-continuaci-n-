import 'package:ecommerceapp_2/models/productModel.dart';

class CartItem {
  final Product product;
  final String productId;
  int quantity;

  CartItem({
    required this.productId,
    required this.product,
    this.quantity = 1
  });
}