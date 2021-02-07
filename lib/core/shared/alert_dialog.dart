import 'package:flutter/material.dart';
import 'package:the_afetzede/core/models/deprem_model.dart';

// ignore: always_declare_return_types
showAlertDialog(BuildContext context, DepremModel _deprem) {
  // ignore: deprecated_member_use
  Widget cancelButton = FlatButton(
    child: Text('Kapat'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  // ignore: omit_local_variable_types
  AlertDialog alert = AlertDialog(
    title: Center(child: Text('Deprem ayrıntı')),
    content: Container(
      height: 200,
      width: 200,
      child: Center(
          child: Column(
        children: [
          Text('Yer: ' + _deprem.yer + _deprem.sehir),
          Text('Tarih: ' + _deprem.tarih),
          Text('Saat: ' + _deprem.saat),
          Text('Büyüklük: ' + _deprem.buyukluk),
          Text('Derinlik: ' + _deprem.derinlik),
          Text('Enlem: ' + _deprem.enlem),
          Text('Boylam: ' + _deprem.boylam),
        ],
      )),
    ),
    actions: [
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
