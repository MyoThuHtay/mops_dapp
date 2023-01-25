import 'package:flutter/material.dart';
import 'package:mops_dapp/model/coinsandtokens.dart';
import 'package:provider/provider.dart';

import '../provider/coin_providers.dart';

class Token extends StatefulWidget {
  const Token({Key? key}) : super(key: key);

  @override
  State<Token> createState() => _TokenState();
}

class _TokenState extends State<Token> {
  // @override
  // void initState() {

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    List<CoinsAndTokens> coins =
        Provider.of<CoinAndTokensProvider>(context, listen: false).coins;
    return Scaffold(
      body: coins.isNotEmpty
          ? ListView.builder(
              itemCount: coins.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: Image.network(coins[index].binanceSmartChain!.logo),
                  title: Row(
                    children: [
                      Text(coins[index].binanceSmartChain!.name),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(coins[index].binanceSmartChain!.symbol),
                    ],
                  ),
                  trailing: Row(
                    children: [
                      Text(coins[index].binanceSmartChain!.amount),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(coins[index].binanceSmartChain!.symbol),
                    ],
                  ),
                );
              }),
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
