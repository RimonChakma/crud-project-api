import 'package:crud_api_project/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {

  Map<String,String> formValues ={
    "ProductName":"","ProductCode":"","Img":"","TotalPrice":"","UnitPrice":"","Qty":""
  };


  inputOnChange(mapKey ,textValue){
    setState(() {
      formValues.update(mapKey, (value) => textValue,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Page"),
        centerTitle: true,
      ),

    body: Padding(padding: EdgeInsets.all(10),child: Column(
    children: [
    TextFormField(
        onChanged: (textValue) {
          inputOnChange("ProductName",textValue);
        },
        decoration: inputDecoratorStyle("ProductName")),

    SizedBox(height: 10,),
    TextFormField(
        onChanged: (textValue) {
          inputOnChange("ProductCode",textValue);
        },
        decoration: inputDecoratorStyle("ProductCode")),

    SizedBox(height: 10,),
    TextFormField(
        onChanged: (textValue) {
          inputOnChange("Img",textValue);
        },
        decoration: inputDecoratorStyle("ProductImage")),

    SizedBox(height: 10,),
    TextFormField(
        onChanged: (textValue) {
          inputOnChange("TotalPrice",textValue);
        },
        decoration: inputDecoratorStyle("TotalPrice")),

    SizedBox(height: 10,),
    TextFormField(
        onChanged: (textValue) {
          inputOnChange("UnitPrice",textValue);
        },
        decoration: inputDecoratorStyle("UnitPrice")),

      SizedBox(height: 10,),

     decoratedBoxStyle( DropdownButton(items: [
       DropdownMenuItem(child: Text("select item"),value: "",),
       DropdownMenuItem(child: Text("1st"),value: "1st",),
       DropdownMenuItem(child: Text("2nd"),value: "2nd",),
       DropdownMenuItem(child: Text("3rd"),value: "3rd",),
       DropdownMenuItem(child: Text("4th"),value: "4th",),
     ], onChanged: (textValue) {
       inputOnChange('Qty', textValue);
     },
       isExpanded: true,
     )),

      ElevatedButton(onPressed: (){}, child: Text("submit") ,)
    ],
    )));
  }
}
