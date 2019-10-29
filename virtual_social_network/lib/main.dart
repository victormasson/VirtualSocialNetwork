import 'package:flutter/material.dart';
import 'package:virtual_social_network/pages/root_page.dart';
import 'package:virtual_social_network/services/authentification.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new RootPage();
  }
}
