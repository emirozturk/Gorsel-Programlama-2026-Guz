import 'package:flutter/material.dart';

void main() {
  runApp(Uygulama2());
}

class Uygulama2 extends StatefulWidget {
  @override
  State<Uygulama2> createState() => _Uygulama2State();
}

class _Uygulama2State extends State<Uygulama2> {
  var sayi = 0;
  var index = 1;
  arttir(){
    setState(() {
          sayi++;
          index++;
          index = index%2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Uygulama 2")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/$index.jpg",width: 250,height: 250,),
              Text("Merhaba", style: TextStyle(fontSize: 34)),
              Text("Sayı: $sayi", style: TextStyle(fontSize: 30)),
              ElevatedButton(onPressed: arttir, child: Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
