import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_afetzede/core/shared/drawer.dart';

import 'package:the_afetzede/views/screens/home/bildirim_view.dart';
import 'package:the_afetzede/views/screens/home/deprem_view.dart';
import 'package:the_afetzede/views/screens/home/harita_view.dart';
import 'package:the_afetzede/views/screens/viewmodels/home_viewmodels.dart';

import '../../../core/shared/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBar(context),
        floatingActionButton: fabButton,
        body: _buildTabBarView(),
        bottomNavigationBar: _buildTabBar(),
        drawer: DrawerWidget());
  }

  BottomAppBar _buildTabBar() {
    return BottomAppBar(
      child: Container(
        height: 60,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorWeight: 0.001,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: FaIcon(FontAwesomeIcons.houseDamage),
              child: Text(
                'Depremler',
                style: boldStyle,
              ),
            ),
            Tab(
              icon: Icon(Icons.map),
              child: Text(
                'Harita',
                style: boldStyle,
              ),
            ),
            Tab(
              icon: Icon(Icons.bolt),
              child: Text(
                'İşlemler',
                style: boldStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        DepremView(),
        HaritaView(),
        BildirimView(),
      ],
    );
  }
}
