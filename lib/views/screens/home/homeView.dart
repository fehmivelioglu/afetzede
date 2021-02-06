import 'package:flutter/material.dart';
import 'package:the_afetzede/core/services/realtime_db_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RealTimeDBService _realTimeDBService = RealTimeDBService.getInstance();
  Future _rtDBFuture;
  @override
  void initState() {
    super.initState();
  _rtDBFuture = _realTimeDBService.getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdasdsad'),
      ),
      body: Container(child: Text('adsada')),
    );
  }
}
