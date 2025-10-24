import 'package:flutter/material.dart';
import 'package:uygulama_4/db.dart';
import 'package:uygulama_4/kayit.dart';
import 'package:uygulama_4/multi_select_list.dart';

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => AnasayfaState();
}

class AnasayfaState extends State<Anasayfa> {
  List<Kayit> liste = [];
  var seciliIndexListesi = [];
  getir() {
    setState(() {
      liste = Db.kayitListesi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: getir, child: Text("Getir")),
          MultiSelectList(liste),
        ],
      ),
    );
  }
}
