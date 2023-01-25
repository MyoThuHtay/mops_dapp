import 'package:flutter/material.dart';
import 'package:mops_dapp/components/home.dart';
import 'package:mops_dapp/components/route.dart';
import 'package:mops_dapp/provider/coin_providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'model/coinsandtokens.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CoinAndTokensProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String address = "0xe887232387645c90601935fc028d0589d97942eb";
  String email = "kaunglaysainge5@gmail.com";
  List<CoinsAndTokens> coins = [];
  @override
  void initState() {
    getCoins(address, email);
    super.initState();
  }

  getCoins(String address, String email)async {
   var coin = await Provider.of<CoinAndTokensProvider>(context,listen: false).getCoinAndTokens(context, address, email);
    for(int i = 0; i < coin.length; i++){
      coins.add(
        CoinsAndTokens(
          binanceSmartChain: coin[i].binanceSmartChain,
          ethereum: coin[i].ethereum,
          polygon: coin[i].polygon),
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mops Swap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: 
      //Provider.of<UserProvider>(context).user.token.isNotEmpty
          //?
           const HomeScreen()
         // : const AuthScreen(),
    );
  }
}
