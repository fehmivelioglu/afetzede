import 'package:flutter/material.dart';

showAlertBildirimlerDialog(BuildContext context, String text,{String bolge='1.bölge'}) {
  Widget cancelButton = FlatButton(
    child: Text('Kapat'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
var items = ['1.bölge','2.bölge'];
var selectedItems = bolge;
  // set up the AlertDialog
  var alert = AlertDialog(
    title: Center(child: Text('Talep')),
    content: Container(
      height: 100,
      width: 200,
      child: Center(
        child: DropdownButton<String>(
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: selectedItems,
                    onChanged: (String value) {
                      Navigator.of(context).pop();
                     // burda post olaylarımız gerçekleşecek
                    }),
      ),
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
