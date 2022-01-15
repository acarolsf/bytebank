import 'package:flutter/material.dart';

class LoadingElement extends StatelessWidget {

  final String message;

  LoadingElement({this.message = 'Loading..'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(message),
        ],
      ),
    );
  }
}
