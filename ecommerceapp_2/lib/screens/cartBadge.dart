import 'package:ecommerceapp_2/provider/cartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final  cart = context.watch<Cartprovider>();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(CupertinoIcons.cart),
        if (cart.totalItems > 0) 
        Positioned(
          right: -6,
          left: -4,
          child: Container(
            padding: EdgeInsets.all(4), 
            decoration: BoxDecoration(
          color: CupertinoColors.systemRed, 
          borderRadius: BorderRadius.circular(10),
        ), constraints: const BoxConstraints(
          minHeight: 18,
          minWidth: 18
        ),
        child:  Text(cart.totalItems.toString(),
        style:  TextStyle(
          color: CupertinoColors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        ),))
      ],
    );
  }
}