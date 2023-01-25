import 'package:flutter/material.dart';
import 'package:mops_dapp/components/app_bar.dart';
import 'package:mops_dapp/pages/setting.dart';
import 'package:mops_dapp/pages/swap.dart';

import '../pages/dapps.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;
  double buttomBarWidth = 42;

  onTap(int index) {
    setState(() {
      page = index;
    });
  }

  List<Widget> pages = const [
    CustomAppBar(),
    Dapps(),
    Swap(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.blueGrey[600],
        iconSize: 28,
        onTap: onTap,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: buttomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: page == 0 ? Colors.blueAccent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.account_balance_wallet_outlined,
                ),
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Container(
                width: buttomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: page == 1 ? Colors.blueAccent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.webhook_outlined,
                ),
              ),
              label: 'Dapp'),
          BottomNavigationBarItem(
              icon: Container(
                width: buttomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: page == 2 ? Colors.blueAccent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.token_outlined,
                ),
              ),
              label: 'Swap'),
          BottomNavigationBarItem(
              icon: Container(
                width: buttomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: page == 3 ? Colors.blueAccent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.settings,
                ),
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
