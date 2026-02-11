import 'package:ecommerceapp_2/provider/cartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cartprovider>();
    final items = cart.items;  //values
    return  CupertinoPageScaffold(
      child: SafeArea(child: items.isEmpty ? const Center(
        child: Text('Cart its empty'),
      ) : Column(

      )),
    );
  }
}