
// TODO 
// AGREGAR CARTPROVIDER AL BOTON DE CARRITO 
import 'package:ecommerceapp_2/provider/cartProvider.dart';
import 'package:ecommerceapp_2/provider/productsProvider.dart';
import 'package:ecommerceapp_2/utils/show_toast.dart';
import 'package:ecommerceapp_2/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = context.watch<ProductsProvider>();
    final products = productsProvider.products;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12), 
          itemCount: products.length,
          
          itemBuilder: (context, index){
            final product = products[index];
      
            return ProductCard(product: product);
          }),
    );
  }
}

//EL BANNER NO DEPENDE DEL GRID
//EL GRID NO DEPENDE DEL BANNER
//HOMESCREEN SOLO LOS COMPONE