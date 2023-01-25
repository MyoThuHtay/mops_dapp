// ignore_for_file: use_build_context_synchronously
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mops_dapp/components/utils.dart';
import 'package:mops_dapp/model/coinsandtokens.dart';
import 'package:http/http.dart' as http;

class CoinAndTokensProvider extends ChangeNotifier {
  String uri = dotenv.env['SERVER_URL']!;

  List<CoinsAndTokens> _coinsAndTokens = [];
  List<CoinsAndTokens> get coins => _coinsAndTokens;

  Future<List<CoinsAndTokens>> getCoinAndTokens(
      BuildContext context, String address, String email) async {
    _coinsAndTokens = [];

    http.Response response = await http.get(
      Uri.parse('$uri/balance?email=$email&address=$address'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      showSnackBar(context, 'Something went wrong');
    }
    _coinsAndTokens.add(coinsAndTokensFromJson(response.body));
    if (kDebugMode) {
      print(response.body);
      //print(_coinsAndTokens.first.binanceSmartChain!.name);
    }
    notifyListeners();
    return _coinsAndTokens;
  }
}
