import 'package:crud_api_project/utility/product_create_screen.dart';
import 'package:crud_api_project/utility/product_gridview_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductGridviewScreen(),
    );
  }
}
