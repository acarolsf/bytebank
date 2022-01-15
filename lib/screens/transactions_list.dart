import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/loading_element.dart';
import 'package:bytebank/components/transaction_card.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

const _titlePage = 'Transactions';
const _emptyListMessage = 'No transactions found!';
const _unknownErrorMessage = 'Unknown Error.';

class TransactionsList extends StatelessWidget {

  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titlePage),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _webClient.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return LoadingElement();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction> transactions = snapshot.data!;
                if (transactions.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions[index];
                      return TransactionCard(transaction);
                    },
                    itemCount: transactions.length,
                  );
                }
              }
              return CenteredMessage(
                _emptyListMessage,
                icon: Icons.warning,
              );
              break;
          }

          return CenteredMessage(_unknownErrorMessage);
        },
      ),
    );
  }
}
