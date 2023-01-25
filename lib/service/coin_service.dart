// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:mops_dapp/components/home.dart';
// import 'package:mops_dapp/components/utils.dart';
// import 'package:mops_dapp/constant/error_handling.dart';
// import 'package:mops_dapp/model/coinsandtokens.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// import '../provider/coin_providers.dart';

// String uri = dotenv.env['SERVER_URL']!;

// class CoinService {
//   void getCoins({
//     required BuildContext context,
//     required String address,
//     required String email,
//   }) async {
//     try {
//       http.Response response = await http.get(
//         Uri.parse('$uri/balance?email=$email&address=$address'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       if(response.statusCode != 200){
//         httpErrorHandle(
//         response: response,
//         context: context,
//         onSuccess: () async {
//           SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

//         },
//       );
//       }
      
      

      
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
// }
