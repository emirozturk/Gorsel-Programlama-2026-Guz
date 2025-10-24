import 'package:flutter/material.dart';
import 'package:uygulama_4/anasayfa.dart';

void main() {
  runApp(Uygulama4());
}

class Uygulama4 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Anasayfa(),
    );
  }
}