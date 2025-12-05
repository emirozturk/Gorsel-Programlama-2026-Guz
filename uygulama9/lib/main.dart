import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Uygulama(),
    );
  }
}

class Uygulama extends StatefulWidget {
  @override
  State<Uygulama> createState() => _UygulamaState();
}

class _UygulamaState extends State<Uygulama> {
  var metin = "Deneme";

  var eklenecekController = TextEditingController();

  void kaydet() {
    metin += "\n${eklenecekController.text}";
    var dosya = File("/Users/emirozturk/Desktop/dosya.txt");
    dosya.writeAsString(metin).then((value) {
      oku();
      eklenecekController.text = "";
    });
  }

  void oku() {
    var dosya = File("/Users/emirozturk/Desktop/dosya.txt");
    dosya.readAsString().then(
      (value) => setState(() {metin = value;}),
    );
  }
  @override
  void initState() {
    super.initState();
    oku();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: eklenecekController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: kaydet, child: Text("Kaydet")),
                ElevatedButton(onPressed: oku, child: Text("Oku")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: metin,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
