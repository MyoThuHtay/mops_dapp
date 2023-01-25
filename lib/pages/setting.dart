import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: const Text('Settings'),),)
    );
  }
}