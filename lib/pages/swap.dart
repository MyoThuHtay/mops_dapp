import 'package:flutter/material.dart';

class Swap extends StatefulWidget {
  const Swap({Key? key}) : super(key: key);

  @override
  State<Swap> createState() => _SwapState();
}

class _SwapState extends State<Swap> {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child:const Text('Swap'),),)
    );
  }
}