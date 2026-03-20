import 'package:ecommerceapp_2/models/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
            )
        ],
      ),
    );
  }
}