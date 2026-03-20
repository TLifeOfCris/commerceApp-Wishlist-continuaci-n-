import 'package:ecommerceapp_2/models/productModel.dart';
import 'package:ecommerceapp_2/provider/cartProvider.dart';
import 'package:ecommerceapp_2/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<Cartprovider>();
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
            ),
        ]
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey5,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(CupertinoIcons.photo),
              ),
            ),
            ),
            const SizedBox(height: 8,),

            //TITULO 
            Text(product.title, style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
            const  SizedBox( height: 4,),

            //PRICE
            Text('\$${product.price}', 
            style: TextStyle(color: CupertinoColors.systemGrey, 
            fontSize: 13),
            ),

            const SizedBox( height: 8,),
            // DAR LIKE Y AGREGAR A CARRITO BOTTONES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                GestureDetector(
                  child: Icon(product.isLiked 
                  ? CupertinoIcons.heart_fill 
                  : CupertinoIcons.heart,
                  color: CupertinoColors.systemRed,),
                ),
                GestureDetector(
                  onTap: (){
                    cart.addToCart(product);

                    showiOSToast(context, '${product.title} has been addded to the cart');
                  },
                  child: const Icon(CupertinoIcons.cart_badge_plus),
                )
              ],
            )

        ],
      ),
    );
  }
}