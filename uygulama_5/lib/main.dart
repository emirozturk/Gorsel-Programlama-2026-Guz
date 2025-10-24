import 'package:flutter/material.dart';
import 'package:uygulama_5/kisi_ekle.dart';
import 'package:uygulama_5/kisi_listesi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var sayfaListesi = [KisiEkle(), KisiListesi()];

  var suAnkiSayfa = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Replace the default hamburger with a custom icon
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.account_circle),
            tooltip: 'Open navigation drawer',
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: sayfaListesi[suAnkiSayfa],
      drawer: Drawer(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Menu item 1"),
            Text("Menu item 1"),
            Text("Menu item 1"),
            Text("Menu item 1"),
            TextButton(onPressed: (){}, child: Text("Tıkla"))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
        ],
        onTap: (deger) {
          setState(() {
            suAnkiSayfa = deger;
          });
        },
        iconSize: 45,
        backgroundColor: Colors.amber,
      ),
    );
  }
}
