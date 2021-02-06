import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_afetzede/core/models/deprem_model.dart';
import 'package:the_afetzede/core/services/deprem_service.dart';
import 'package:the_afetzede/core/services/realtime_db_service.dart';
import 'package:the_afetzede/core/shared/alert_dialog.dart';




class DepremView extends StatefulWidget {
  @override
  _DepremViewState createState() => _DepremViewState();
}

class _DepremViewState extends State<DepremView> {
  final RealTimeDBService _realTimeDBService = RealTimeDBService.getInstance();
  Future _rtDBFuture;
 final DepremService _depremService = DepremService();
  Future _depremFuture;
  List<DepremModel> _listDeprem = [];
  @override
  void initState() {
    super.initState();
    _depremFuture = _depremService.getDeprems();
    _rtDBFuture = _realTimeDBService.getUsers();
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
                      //  shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: _listDeprem.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.grey[200],
                                // boxShadow: shadowList,
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.only(top: 10, bottom: 2),
                            height: 80,
                            width: screenWidth,
                            child: Center(
                              child: ListTile(
                                onTap: () {
                                  showAlertDialog(context, _listDeprem[index]);
                                },
                                contentPadding: EdgeInsets.all(0),
                                title: Center(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      AutoSizeText(
                                        _listDeprem[index].yer +
                                            _listDeprem[index].sehir,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                leading: Padding(
                                    padding: EdgeInsets.only(left: 5, bottom: 5),
                                    child: Container(
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.red),
                                      child: Center(
                                          child:
                                              Text(_listDeprem[index].buyukluk,style: TextStyle(fontWeight: FontWeight.bold),)),
                                    )),
                                trailing: Padding(
                                  padding: EdgeInsets.only(right: 8, top: 3),
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    children: [
                                      Text(
                                        _listDeprem[index].saat,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(_listDeprem[index].tarih),
                                    ],
                                  ),
                                ),
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
}