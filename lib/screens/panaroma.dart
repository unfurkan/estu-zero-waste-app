import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class Panaroma extends StatefulWidget {
  String asset;
  String description;

  Panaroma({Key? key, required this.asset,required this.description}) : super(key: key);

  @override
  _PanaromaState createState() => _PanaromaState();
}

class _PanaromaState extends State<Panaroma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.description),
      ),
      body: Panorama(
        zoom: 1,
        animSpeed: 0.0,
        child: Image.asset(this.widget.asset),
      ),
    );
  }
}
