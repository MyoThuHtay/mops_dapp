// To parse this JSON data, do
//
//     final coinsAndTokens = coinsAndTokensFromJson(jsonString);

import 'dart:convert';

CoinsAndTokens coinsAndTokensFromJson(String str) => CoinsAndTokens.fromJson(json.decode(str));

String coinsAndTokensToJson(CoinsAndTokens data) => json.encode(data.toJson());

class CoinsAndTokens {
    CoinsAndTokens({
        required this.btcBalance,
        required this.ltcBalance,
        required this.bscbalance,
        required this.ethBalance,
        required this.polygonBalance,
        required this.bscToken,
        required this.ethToken,
        required this.polygonToken,
    });

    Balance btcBalance;
    Balance ltcBalance;
    Balance bscbalance;
    Balance ethBalance;
    Balance polygonBalance;
    List<Token> bscToken;
    List<Token> ethToken;
    List<Token> polygonToken;

    factory CoinsAndTokens.fromJson(Map<String, dynamic> json) => CoinsAndTokens(
        btcBalance: Balance.fromJson(json["BtcBalance"]),
        ltcBalance: Balance.fromJson(json["ltcBalance"]),
        bscbalance: Balance.fromJson(json["Bscbalance"]),
        ethBalance: Balance.fromJson(json["ethBalance"]),
        polygonBalance: Balance.fromJson(json["polygonBalance"]),
        bscToken: List<Token>.from(json["bscToken"].map((x) => Token.fromJson(x))),
        ethToken: List<Token>.from(json["ethToken"].map((x) => Token.fromJson(x))),
        polygonToken: List<Token>.from(json["polygonToken"].map((x) => Token.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "BtcBalance": btcBalance.toJson(),
        "ltcBalance": ltcBalance.toJson(),
        "Bscbalance": bscbalance.toJson(),
        "ethBalance": ethBalance.toJson(),
        "polygonBalance": polygonBalance.toJson(),
        "bscToken": List<dynamic>.from(bscToken.map((x) => x.toJson())),
        "ethToken": List<dynamic>.from(ethToken.map((x) => x.toJson())),
        "polygonToken": List<dynamic>.from(polygonToken.map((x) => x.toJson())),
    };
}

class Token {
    Token({
        required this.tokenAddress,
        required this.name,
        required this.symbol,
        this.logo,
        this.thumbnail,
        required this.decimals,
        required this.balance,
    });

    String tokenAddress;
    String name;
    String symbol;
    dynamic logo;
    dynamic thumbnail;
    int decimals;
    String balance;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        tokenAddress: json["token_address"],
        name: json["name"],
        symbol: json["symbol"],
        logo: json["logo"],
        thumbnail: json["thumbnail"],
        decimals: json["decimals"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "token_address": tokenAddress,
        "name": name,
        "symbol": symbol,
        "logo": logo,
        "thumbnail": thumbnail,
        "decimals": decimals,
        "balance": balance,
    };
}

class Balance {
    Balance({
        required this.id,
        required this.user,
        required this.address,
        required this.name,
        required this.symbol,
        required this.decimals,
        required this.logo,
        required this.amount,
        required this.type,
        required this.transactions,
        required this.v,
    });

    String id;
    String user;
    List<String> address;
    String name;
    String symbol;
    String decimals;
    String logo;
    String amount;
    String type;
    List<String> transactions;
    int v;

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        id: json["_id"],
        user: json["user"],
        address: List<String>.from(json["address"].map((x) => x)),
        name: json["name"],
        symbol: json["symbol"],
        decimals: json["decimals"],
        logo: json["logo"],
        amount: json["amount"],
        type: json["type"],
        transactions: List<String>.from(json["transactions"].map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "address": List<dynamic>.from(address.map((x) => x)),
        "name": name,
        "symbol": symbol,
        "decimals": decimals,
        "logo": logo,
        "amount": amount,
        "type": type,
        "transactions": List<dynamic>.from(transactions.map((x) => x)),
        "__v": v,
    };
}
