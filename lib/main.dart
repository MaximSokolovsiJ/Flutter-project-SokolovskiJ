import 'package:flutter/material.dart';
import 'package:sokolovskij_app/EzAsanasList.dart';

void main() => runApp(EzAsanas());

class EzAsanas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EzAsanas to Make You More Flexible',
      theme: ThemeData(
        primarySwatch: Colors.lime
      ),
      home: EzAsanasList()
    );
  }
}
