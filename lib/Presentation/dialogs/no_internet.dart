import 'package:flutter/material.dart';

class NoInternetDialog extends StatelessWidget {
  bool? dismiss;
  NoInternetDialog({Key? key, this.dismiss}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: const AlertDialog(
          title: Text('No Inter Net'),
          content: Text('No Inter Net'),
        ),
        onWillPop: () async {
          return dismiss! ? true : false;
        });
  }
}
