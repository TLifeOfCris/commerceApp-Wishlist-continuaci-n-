import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class PromoBanner extends StatelessWidget {
  final String text;
  const PromoBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemYellow.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.tag, color: CupertinoColors.systemOrange),
          SizedBox(width: 8,),
          Expanded(child: 
          //cambiar con remot config
          Text(' 10% en productos', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),)
          )
        ],
      ),
    );
  }
}