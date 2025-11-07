import 'package:flutter/material.dart';

class AltSayfa extends StatelessWidget {
  var text;
  AltSayfa(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).highlightColor),
      body: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(fontSize: 52, color: Colors.amber),
      ),
    );
  }
}
