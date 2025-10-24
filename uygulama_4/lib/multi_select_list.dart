import 'package:flutter/material.dart';
import 'package:uygulama_4/kayit.dart';

class MultiSelectList extends StatefulWidget {
  List<Kayit> liste;
  @override
  State<MultiSelectList> createState() => _MultiSelectListState();
  MultiSelectList(this.liste);
}

class _MultiSelectListState extends State<MultiSelectList> {
  var seciliIndexListesi = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.liste.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(widget.liste[index].icerik),
            subtitle: Text(widget.liste[index].tarih),
            leading: Icon(Icons.today_rounded),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              setState(() {
                if (seciliIndexListesi.contains(index)) {
                  seciliIndexListesi.remove(index);
                } else {
                  seciliIndexListesi.add(index);
                }
              });
            },
            tileColor: seciliIndexListesi.contains(index)
                ? Colors.blue
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
