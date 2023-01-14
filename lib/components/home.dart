import 'package:flutter/material.dart';
import 'package:mops_dapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              user.toJson(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        selectedItemColor: Colors.blueAccent,
        backgroundColor: Colors.black45,
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
                  Icons.home_outlined,
                ),
              ),
              label: 'Home'),
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
                  Icons.shopping_cart_outlined,
                ),
              ),
              label: 'Cart'),
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
                  Icons.account_circle_outlined,
                ),
              ),
              label: 'Account'),
        ],
      ),
    );
  }
}
