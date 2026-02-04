import 'package:ecommerceapp_2/provider/cartProvider.dart';
import 'package:ecommerceapp_2/provider/productsProvider.dart';
import 'package:ecommerceapp_2/screens/main_tab_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Productsprovider()),
      ChangeNotifierProvider(create: (_) => Cartprovider()),
    ],
    child: MyApp(),));
    
     
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      //MainTabScaffold es el que tiene al HomeScreen y otras pantallas
      
      home: MainTabScaffold(),
    );
  }
}