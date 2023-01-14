import 'package:flutter/material.dart';

class Swap extends StatelessWidget {
  const Swap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child:const Text('Swap'),),)
    );
  }
}