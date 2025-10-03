import 'package:flutter/material.dart';
import 'package:uygulama_3/kisi_karti.dart';

class Uygulama3 extends StatelessWidget {
  const Uygulama3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(8), child: Icon(Icons.people_alt)),
            Padding(padding: EdgeInsets.all(8), child: Text("Kişiler")),
          ],
        ),
      ),
      body: Column(
        children: [
          KisiKarti("Emir Öztürk","1060203022"),
          KisiKarti("Moustafa Moustafa","1211602625"),
          KisiKarti("Semih Akbaş","1201602093"),
        ],
      ),
    );
  }
}
