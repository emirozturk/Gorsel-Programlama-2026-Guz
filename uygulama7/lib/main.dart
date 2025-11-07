import 'package:flutter/material.dart';
import 'package:uygulama7/alt_sayfa.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uygulama7',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        primaryColor: Colors.blue,
        highlightColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white30,        
        brightness: Brightness.light,
        textTheme: GoogleFonts.dancingScriptTextTheme(
          Typography.dense2018
        ),
      ),
      home: Uygulama7(),
    );
  }
}

class Uygulama7 extends StatelessWidget {
  var liste = [
    "Toplantı var",
    "Akşam yemeği",
    "3 gün sonra plan yapılacak",
    "Gezi rehberi hazırlanacak",
    "Blog yazısı",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).highlightColor,),
      body: Container(
        child: Expanded(
          child: ListView.builder(
            itemCount: liste.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(liste[index]),
              leading: Icon(Icons.circle),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AltSayfa(liste[index])),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
