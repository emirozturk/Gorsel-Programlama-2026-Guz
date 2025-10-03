import 'package:flutter/material.dart';

class KisiKarti extends StatelessWidget {
  final String isim;
  final String numara;
  const KisiKarti(this.isim,this.numara, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.run_circle_outlined, size: 48),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(isim,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),), Text(numara,style: TextStyle(
                ),)]),
            ),
          ],
        ),
      ),
    );
  }
}
