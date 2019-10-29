import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Built with Flutter !",
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
      ),
    );
  }
}
