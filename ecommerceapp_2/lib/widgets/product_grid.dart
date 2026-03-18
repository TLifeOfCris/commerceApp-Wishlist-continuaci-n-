
// TODO 
// AGREGAR CARTPROVIDER AL BOTON DE CARRITO 
import 'package:ecommerceapp_2/provider/cartProvider.dart';
import 'package:ecommerceapp_2/provider/productsProvider.dart';
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
      
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                children: [
                  //AQUÍ DEBERÍA DE IR UNA IMAGEN
                  Expanded(child: Container(
                    color: Colors.grey[300]
                  ),),
                  //  AQUÍ VA EL TITULO DEL PRODUCTO
                  Text(product.title),
                  //  AQUÍ VA EL PRECIO DEL PRODUCTO
                  Text('\$${product.price}'),
                  //DESCRIPCIÓN DE PRODUCTO FALTA AGREGARLE QUE SOLO PUEDA MOSTRAR UNA PARTE DE DICHA APRA QUE NO CRASHE O SE VEA FEO 
                  Text(product.description),
                  

                  //Agregar un row
                  // BOTÓN DE LIKE 
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    IconButton(onPressed: (){
                    productsProvider.toggleLike(product.id);}, 
                    icon: Icon(product.isLiked ? Icons.favorite : Icons.favorite_border)),
                  // AÑADIR A CARRITO
                    IconButton(onPressed: (){
                      context.read<Cartprovider>().addToCart(product);
                    //Agregar CARTPROVIDER
                  }, icon: Icon(Icons.add))
                    ],
                  )

                ],
              ),
            );
          }),
    );
  }
}

//EL BANNER NO DEPENDE DEL GRID
//EL GRID NO DEPENDE DEL BANNER
//HOMESCREEN SOLO LOS COMPONE