import 'package:flutter/material.dart';

class Dapps extends StatefulWidget {
  const Dapps({Key? key}) : super(key: key);

  @override
  State<Dapps> createState() => _DappsState();
}

class _DappsState extends State<Dapps> {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child:const Text('Dapps'),),)
    );
  }
}