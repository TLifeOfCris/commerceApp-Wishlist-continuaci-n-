import 'package:ecommerceapp_2/widgets/product_grid.dart';
import 'package:ecommerceapp_2/widgets/promo_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Commerce App'),
      ),
      child: SafeArea(child: Column(
        children: [
          //Aqui cambiar con remote config
          PromoBanner(text: 'Holi'),
          //PROMO BANNER
          Expanded(child: ProductGrid())
        ],
      ))
        );
  }
}