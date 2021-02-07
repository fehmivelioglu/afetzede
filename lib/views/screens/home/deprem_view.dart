import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_afetzede/core/models/deprem_model.dart';
import 'package:the_afetzede/core/services/deprem_service.dart';
import 'package:the_afetzede/core/shared/alert_dialog.dart';

import '../../../core/shared/constants.dart';

class DepremView extends StatefulWidget {
  @override
  _DepremViewState createState() => _DepremViewState();
}

class _DepremViewState extends State<DepremView> {
  final DepremService _depremService = DepremService();
  Future _depremFuture;
  List<DepremModel> _listDeprem = [];
  @override
  void initState() {
    super.initState();
    _depremFuture = _depremService.getDeprems();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder(
          future: _depremFuture,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  _listDeprem = snapshot.data;
                }
                return ListView.builder(
                  itemCount: _listDeprem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: shadowDecoration,
                        margin: EdgeInsets.only(top: 10, bottom: 2),
                        height: 80,
                        width: screenWidth,
                        child: Center(
                          child: ListTile(
                            onTap: () {
                              showAlertDialog(context, _listDeprem[index]);
                            },
                            contentPadding: EdgeInsets.all(0),
                            title: _buildCenterTitle(index),
                            leading: _buildPaddingLeading(index),
                            trailing: _buildPadding(index),
                          ),
                        ));
                  },
                );

                break;
              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          }),
    );
  }

  Center _buildCenterTitle(int index) {
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          AutoSizeText(
            _listDeprem[index].yer + _listDeprem[index].sehir,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Padding _buildPaddingLeading(int index) {
    return Padding(
        padding: EdgeInsets.only(left: 5, bottom: 5),
        child: Container(
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.red),
          child: Center(
              child: Text(
            _listDeprem[index].buyukluk,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ));
  }

  Padding _buildPadding(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 8, top: 3),
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Text(
            _listDeprem[index].saat,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(_listDeprem[index].tarih),
        ],
      ),
    );
  }
}
