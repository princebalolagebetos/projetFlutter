import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new  AppBar(title:Text('home') ),
      
       body:Column(
        children: <Widget>[
          Text('estamos en ventas'),
        ],
      )
    );
    
  }
}