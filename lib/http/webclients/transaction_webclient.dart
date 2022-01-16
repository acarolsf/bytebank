import 'dart:convert';

import 'package:bytebank/http/exceptions/http_exception.dart';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  static const url = 'http://192.168.100.100:8080/transactions';

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(Uri.parse(url));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((e) => Transaction.fromJson(e)).toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    
    await Future.delayed(Duration(seconds: 2));
    
    final Response response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'password': password,
      },
      body: transactionJson,
    );

    if (response.statusCode <= 204) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  String? _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Unknown Error';
  }

  final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
    409: 'transaction already exists'
  };
}
