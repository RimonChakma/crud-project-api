import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';

class ProductGridviewScreen extends StatefulWidget {
  const ProductGridviewScreen({super.key});

  @override
  State<ProductGridviewScreen> createState() => _ProductGridviewScreenState();
}

class _ProductGridviewScreenState extends State<ProductGridviewScreen> {

  List productItem = [];
  bool loading = true;

  @override
  void initState() {
   getData();
    super.initState();
  }

  getData()async{
   setState(() {
     loading = true;
   });
    final item = await ProductGridViewRequest();
    setState(() {
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Product"),),
      body: loading == true?Center(child: CircularProgressIndicator(),):
      GridView.builder(gridDelegate: gridViewStyle(), itemBuilder:(context, index) {
        return Card(
          child: Column(
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQod5zKjaQfyDf7lLX072p4k_v5QbMZkKBPgg&s",
                 height: 200,width: 200,
              )
            ],
          ),
        );
      }, ),
    );
  }
}
