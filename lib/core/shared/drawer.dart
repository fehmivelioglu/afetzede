import 'package:flutter/material.dart';

import 'constants.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(image: AssetImage('assets/bg.png'))),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 1.5,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintText: 'Arama yap',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                focusedBorder: outlineInputBorder,
                border: outlineInputBorder,
              ),
            ),
          ),
          container,
          drawerListTile('Konut'),
          container,
          drawerListTile('Gıda'),
          container,
          drawerListTile('Giysi'),
        ],
      ),
    );
  }
}