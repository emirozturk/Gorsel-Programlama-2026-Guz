import 'package:flutter/material.dart';
import 'package:uygulama_5/db.dart';
import 'package:uygulama_5/kisi.dart';
import 'package:uygulama_5/yer_listesi.dart';

class KisiEkle extends StatelessWidget {
  var liste = db.liste;
  var adSoyadC = TextEditingController();
  var yerC = TextEditingController();
  kaydet() {
    var yeniKisi = Kisi(adSoyadC.text, yerC.text);
    liste.add(yeniKisi);
    adSoyadC.clear();
    yerC.clear();
  }

  yerSec(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => YerListesi()),
    ).then((value) {
      if (value != null) {
        yerC.text = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: adSoyadC,
            style: TextStyle(fontSize: 32),
            decoration: InputDecoration(hintText: "Ad Soyad"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: yerC,
            style: TextStyle(fontSize: 32),
            decoration: InputDecoration(hintText: "Yaşadığı yer"),
            onTap: () => yerSec(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: kaydet,
            child: Text("Kaydet", style: TextStyle(fontSize: 28)),
          ),
        ),
      ],
    );
  }
}
