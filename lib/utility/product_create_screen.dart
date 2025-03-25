import 'package:crud_api_project/api/api.dart';
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

  final formState = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Page"),
        centerTitle: true,
      ),

    body: Padding(padding: EdgeInsets.all(10),child: Column(
    children: [

      Form(
          key: formState,
          child: Column(children: [
        TextFormField(
            validator: (value) {
              if(value!.isEmpty){
                return "please enter your productName";
              }
            },
            onChanged: (textValue) {
              inputOnChange("ProductName",textValue);
            },
            decoration: inputDecoratorStyle("ProductName")),

        SizedBox(height: 10,),
        TextFormField(
            validator: (value) {
              if(value!.isEmpty){
                return "please enter your productCode";
              }return null;
            },
            onChanged: (textValue) {
              inputOnChange("ProductCode",textValue);
            },
            decoration: inputDecoratorStyle("ProductCode")),

        SizedBox(height: 10,),
        TextFormField(
            validator: (value) {
              if(value!.isEmpty){
                return "please enter your productImg";
              }return null;
            },
            onChanged: (textValue) {
              inputOnChange("Img",textValue);
            },
            decoration: inputDecoratorStyle("ProductImage")),

        SizedBox(height: 10,),
        TextFormField(
            validator: (value) {
              if(value!.isEmpty){
                return "please enter your totalPrice";
              }return null;
            },
            onChanged: (textValue) {
              inputOnChange("TotalPrice",textValue);
            },
            decoration: inputDecoratorStyle("TotalPrice")),

        SizedBox(height: 10,),
        TextFormField(
            validator: (value) {
              if(value!.isEmpty){
                return "please enter your unitPrice";
              }return null;
            },
            onChanged: (textValue) {
              inputOnChange("UnitPrice",textValue);
            },
            decoration: inputDecoratorStyle("UnitPrice")),

        SizedBox(height: 10,),

        decoratedBoxStyle(
            DropdownButtonFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return "qty is required";
                }return null;
              },
              value: formValues["Qty"],
              items: [
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
      ],)),

      ElevatedButton(onPressed: ()async{
        if(formState.currentState!.validate()){
          await ProductCreateRquest(formValues);
        }
      }, child: Text("submit") ,)
    ],
    )));
  }
}
