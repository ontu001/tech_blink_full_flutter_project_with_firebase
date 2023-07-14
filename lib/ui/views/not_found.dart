import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Unknown extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/files/notfound.png'),),
      ),
    );
  }

}