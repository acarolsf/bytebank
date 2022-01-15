import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {

  static const url = 'http://192.168.100.100:8080/transactions';

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(Uri.parse(url)).timeout(
        Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((e) => Transaction.fromJson(e)).toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'password': password
    }, body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
}