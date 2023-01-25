import 'package:flutter/material.dart';

class NFTs extends StatefulWidget {
  const NFTs({Key? key}) : super(key: key);

  @override
  State<NFTs> createState() => _NFTsState();
}

class _NFTsState extends State<NFTs> {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child:const Text('NFTs'),),)
    );
  }
}