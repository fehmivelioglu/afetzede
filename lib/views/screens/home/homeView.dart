import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_afetzede/core/models/deprem_model.dart';
import 'package:the_afetzede/core/services/deprem_service.dart';
import 'package:the_afetzede/core/services/realtime_db_service.dart';
import 'package:the_afetzede/core/shared/alert_dialog.dart';
import 'package:the_afetzede/views/screens/account/login_type.dart';
import 'package:the_afetzede/views/screens/account/my_account.dart';

import '../account/login_type.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RealTimeDBService _realTimeDBService = RealTimeDBService.getInstance();
  Future _rtDBFuture;
  DepremService _depremService = DepremService();
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                FirebaseAuth.instance.authStateChanges().listen((User user) {
                  if (user == null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginType()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyAccountPage()));
                    ;
                  }
                });
              },
            ),
          ],
          centerTitle: true,
          title: Text('AFETZEDE'),
          backgroundColor: Colors.red,
        ),
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
                                            Text(_listDeprem[index].buyukluk)),
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
            }));
  }
}
