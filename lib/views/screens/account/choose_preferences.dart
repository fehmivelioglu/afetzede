import 'package:flutter/material.dart';
import 'package:the_afetzede/views/screens/viewmodels/register_viewmodels.dart';

class ChooseView extends StatefulWidget {
  @override
  _ChooseViewState createState() => _ChooseViewState();
}

class _ChooseViewState extends State<ChooseView> {
  var items = oncelikItems;
  var selectedItems = '0. Grup';
  var itemsiki = lokasyonItems;
  var selectedItemsiki = '1. Mahalle';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            SizedBox(height: 8.0),
            Row(
              children: [
                SizedBox(width: 50),
                Icon(Icons.elevator),
                SizedBox(width: 5),
                DropdownButton<String>(
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: selectedItems,
                    onChanged: (String value) {
                      setState(() {
                        selectedItems = value;
                      });
                    }),
                SizedBox(width: 50),
                Icon(Icons.house),
                SizedBox(width: 5),
                DropdownButton<String>(
                    items: itemsiki.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: selectedItemsiki,
                    onChanged: (String value) {
                      setState(() {
                        selectedItemsiki = value;
                      });
                    }),
              ],
            ),
            grupAciklama(context),
            SizedBox(height: 40),
            registerButton(context),
            createAcc(context),
          ],
        ),
      ),
    );
  }
}