import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(15));

Container container = Container(
  height: 1,
  color: Colors.orange,
);

dynamic drawerListTile(String text) {
    return ListTile(
      leading: Icon(Icons.arrow_forward_ios),
      title: AutoSizeText(text, maxLines: 1),
      subtitle:
          AutoSizeText('Afetzedelere ${text} Sağlayabilirim', maxLines: 1),
      onTap: null,
    );
  }

TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);

final shadowDecoration = BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.grey[200],
                            // boxShadow: shadowList,
                            borderRadius: BorderRadius.circular(20));