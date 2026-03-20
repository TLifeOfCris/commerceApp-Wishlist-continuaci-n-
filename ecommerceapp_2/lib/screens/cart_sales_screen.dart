import 'package:ecommerceapp_2/provider/cartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSalesScreen extends StatelessWidget {
  const CartSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cartprovider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cart'),
      ),
      child: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index){
            final item = cart.items[index];
            return ;
          }))
        ],
      ),
    );
  }
}