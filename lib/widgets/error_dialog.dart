import 'package:flutter/material.dart';

class ErrorDialog {
  static void showErrorDialog(
      {required String error, required BuildContext ctx}) {
    showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://image.flaticon.com/icons/png/512/1370/1370553.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Ocurrió un error'),
                ),
              ],
            ),
            content: Text(
              error,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Entendido',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }
}
