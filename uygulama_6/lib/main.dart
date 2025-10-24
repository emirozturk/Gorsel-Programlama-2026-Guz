import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Uygulama"),
          leading: Icon(Icons.abc),
          backgroundColor: Colors.blue,
        ),
        body: U5(),
      ),
    );
  }
}

class U1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: Container(color: Colors.green)),
        Expanded(flex: 16, child: Container(color: Colors.amber)),
        Expanded(flex: 2, child: Container(color: Colors.white24)),
      ],
    );
  }
}

class U2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 640,
        width: 480,
        child: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/%22_Stay_on_the_Job%22_Ralley_at_K-25_by_J.A._Jones_Construction_Co._1944_Oak_Ridge_%2824798675620%29.jpg/1920px-%22_Stay_on_the_Job%22_Ralley_at_K-25_by_J.A._Jones_Construction_Co._1944_Oak_Ridge_%2824798675620%29.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class U3 extends StatefulWidget {
  @override
  State<U3> createState() => _U3State();
}

class _U3State extends State<U3> {
  var degerC = TextEditingController();
  var mesaj = "";
  void kontrol(value) {
    setState(() {
      if (degerC.text.length < 11) {
        mesaj = "11 hane olmalıdır şu an ${degerC.text.length} hane";
      } else {
        mesaj = "Şimdi oldu";
      }
    });
  }

  var sliderDegeri = 0.0;
  degerDegistir(value) {
    setState(() {
      sliderDegeri = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: degerC,
          onChanged: kontrol,
          maxLength: 11,
          obscureText: true,
          decoration: InputDecoration(fillColor: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(mesaj, style: TextStyle(fontSize: 24)),
        ),
        Slider(
          value: sliderDegeri,
          onChanged: degerDegistir,
          min: 0.0,
          max: 100.0,
        ),
        Text(sliderDegeri.toString()),
      ],
    );
  }
}

class U4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 12,
      itemBuilder: (context, index) =>
          Card(child: SizedBox(height: 256, width: 256),color: Colors.white,),
    );
  }
}
class U5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 256,
      ),
      itemCount: 12,
      itemBuilder: (context, index) =>
          Card(child: SizedBox(height: 256, width: 256),color: Colors.white,),
    );
  }
}
