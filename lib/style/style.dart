import 'package:flutter/material.dart';

InputDecoration inputDecoratorStyle (label){
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black)
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white
    )
  ),
    labelText: label,
    filled: true,
    fillColor: Colors.white
  );
}

DecoratedBox decoratedBoxStyle(child){
  return DecoratedBox(decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),

  ),child: child,);
}

