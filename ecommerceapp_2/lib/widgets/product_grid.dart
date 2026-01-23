import 'package:ecommerceapp_2/provider/productsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = context.watch<Productsprovider>();
    final products = productsProvider.products;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12), 
        itemCount: products.length,
        
        itemBuilder: (context, index){
          final product = products[index];

          return Card();
        });
  }
}

//EL BANNER NO DEPENDE DEL GRID
//EL GRID NO DEPENDE DEL BANNER
//HOMESCREEN SOLO LOS COMPONE