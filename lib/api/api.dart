
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart 'as http ;

  Future<bool>ProductCreateRquest(formValues)async{
  final uri = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  final body = jsonEncode(formValues);
  final header = {"Content-Type":"application/json"};

  final response = await http.post(uri,body: body,headers: header);
  final data = response.statusCode;
  final result = jsonDecode(response.body);

  if(data == 200 && result ["status"]=='success'){
    print("success is ok");
    return true;

  }else{
    print("call is error");
    return false;
  }
}

Future<List>ProductGridViewRequest()async{
    final uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    final header = {"Content-Type":"application/json"};
    final response = await http.get(uri,headers: header);
    final resultCode = response.statusCode;
    final result = jsonDecode(response.body);

    if(resultCode == 200 && result["status"]=="success"){
      print("get process ok");
      return result ["data"];
    }else{
      print("error");
      return [];
    }
}

Future<bool>ProductDeleteRequest(id)async{
  final uri = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  final header = {"Content-Type":"application/json"};
  final response = await http.get(uri,headers: header);
  final resultCode = response.statusCode;
  final result = jsonDecode(response.body);

  if(resultCode == 200 && result["status"]=="success"){
    print("delete is ok");
    return true;
  }else{
    print("error");
    return false;
  }
}

Future<bool>ProductUpdateRquest(formValues ,id)async{
  final uri = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct"+id);
  final body = jsonEncode(formValues);
  final header = {"Content-Type":"application/json"};

  final response = await http.post(uri,body: body,headers: header);
  final data = response.statusCode;
  final result = jsonDecode(response.body);

  if(data == 200 && result ["status"]=='success'){
    print("success is ok");
    return true;

  }else{
    print("call is error");
    return false;
  }
}


SliverGridDelegateWithFixedCrossAxisCount gridViewStyle(){
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10
    );
}
