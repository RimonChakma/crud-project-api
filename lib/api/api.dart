
import 'dart:convert';
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

