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
    final data = await ProductGridViewRequest();
    setState(() {
      productItem = data;
      loading = false;
    });
  }

  deleteButton(id)async{
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('delete!'),
        content: Text("once can get delete"),
        actions: [
          OutlinedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(Icons.close)),
          OutlinedButton(onPressed: (){}, child: Icon(Icons.check))
        ],
      );
    },);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Product"),),
      body: loading == true?Center(child: CircularProgressIndicator(),):
      RefreshIndicator(
        onRefresh: () async{
          await getData();
        },
          child: GridView.builder(gridDelegate: gridViewStyle(),
            itemCount: productItem.length,
            itemBuilder:(context, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQod5zKjaQfyDf7lLX072p4k_v5QbMZkKBPgg&s",
                        fit: BoxFit.cover,),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productItem[index]["ProductName"]),
                            Text(productItem[index]["TotalPrice"]),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(onPressed: (){}, child: Icon(CupertinoIcons.ellipsis_vertical_circle)),
                                OutlinedButton(onPressed: (){
                                  deleteButton(productItem[index][ "_id"]);
                                }, child: Icon(CupertinoIcons.delete)),

                              ],)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }, ),
          )
    );
  }
}
