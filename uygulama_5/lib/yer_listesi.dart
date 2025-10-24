import 'package:flutter/material.dart';

class YerListesi extends StatefulWidget {
  @override
  State<YerListesi> createState() => _YerListesiState();
}

class _YerListesiState extends State<YerListesi> {
  var liste = ["Edirne", "Malatya", "Ardahan", "Erzincan", "Zonguldak"];
  var secili = "";
  elemanSec(context) {
    Navigator.pop(context,secili);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: liste.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () { setState(() {
                  secili = liste[index];
                });},
                title: Text(liste[index]),
                tileColor: liste[index] == secili
                    ? Colors.amberAccent
                    : Colors.white,
              ),
            ),
          ),
          ElevatedButton(onPressed: ()=>elemanSec(context), child: Text("Seç")),
        ],
      ),
    );
  }
}
