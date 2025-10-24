import 'package:flutter/material.dart';
import 'package:uygulama_5/db.dart';

class KisiListesi extends StatelessWidget {
  var liste = db.liste;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(liste[index].adSoyad,style: TextStyle(fontSize: 24),),
          subtitle: Text(liste[index].yasadigiYer,style: TextStyle(fontSize: 24)),
          trailing: Icon(Icons.person),
        ),
      ),
    );
  }
}
