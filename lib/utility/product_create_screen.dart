import 'package:crud_api_project/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Page"),
        centerTitle: true,
      ),

    body: Padding(padding: EdgeInsets.all(10),child: Column(
    children: [
    TextFormField(decoration: inputDecoratorStyle("productname")),

    SizedBox(height: 10,),
    TextFormField(decoration: inputDecoratorStyle("productcode")),

    SizedBox(height: 10,),
    TextFormField(decoration: inputDecoratorStyle("productimage")),

    SizedBox(height: 10,),
    TextFormField(decoration: inputDecoratorStyle("unitprice")),

    SizedBox(height: 10,),
    TextFormField(decoration: inputDecoratorStyle("totalprice")),

      SizedBox(height: 10,),

      DropdownButton(items: [
    DropdownMenuItem(child: Text("select item"),value: "",),
    DropdownMenuItem(child: Text("1st"),value: "1st",),
    DropdownMenuItem(child: Text("2nd"),value: "2nd",),
    DropdownMenuItem(child: Text("3rd"),value: "3rd",),
    DropdownMenuItem(child: Text("4th"),value: "4th",),
      ], onChanged: (value) {

      },
      isExpanded: true,
      )

    ],
    )));
  }
}
