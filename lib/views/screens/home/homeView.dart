import 'package:auto_size_text/auto_size_text.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_afetzede/core/shared/constants.dart';
import 'package:the_afetzede/views/screens/account/login_type.dart';
import 'package:the_afetzede/views/screens/account/my_account.dart';
import 'package:the_afetzede/views/screens/home/bildirim_view.dart';
import 'package:the_afetzede/views/screens/home/deprem_view.dart';
import 'package:the_afetzede/views/screens/home/harita_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../account/login_type.dart';

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
        appBar: AppBar(
          flexibleSpace: SafeArea(child: Image(image:AssetImage('assets/appbar_logo.jpg'),fit:BoxFit.cover)),
          automaticallyImplyLeading: true,
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
          // title: Text('AFETZEDE'),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FabCircularMenu(
          fabCloseColor: Colors.green,
        // fabOpenColor: Colors.green,
        fabColor: Colors.red,
        ringColor: Colors.red,
          fabOpenIcon: Icon(Icons.phone),
          children: [
            FlatButton.icon(
              icon: FaIcon(FontAwesomeIcons.starAndCrescent,color: Colors.black,),
              label: Text('KIZILAY 168',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              onPressed: (){
                _callUrgent('168');
              },
            ),
            FlatButton.icon(
              icon: FaIcon(FontAwesomeIcons.ambulance,color: Colors.black,),
              label: Text('112 ACİL',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
             onPressed: (){
                _callUrgent('112');
              },
            ),
             FlatButton.icon(
              icon: FaIcon(FontAwesomeIcons.handsHelping,color:Colors.black),
              label: Text('AFAD 122 ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              onPressed: (){
                _callUrgent('122');
              },
            )
            ,
            FlatButton.icon(
              icon: FaIcon(FontAwesomeIcons.burn,color: Colors.black,),
              label: Text('110 İTFAİYE',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              onPressed: (){
                _callUrgent('110');
              },
            ),
            
            
          ],
        ),
        body: _buildTabBarView(),
        bottomNavigationBar: _buildTabBar(),
        drawer: _buildDrawer());
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
              icon: Icon(Icons.home),
              child: Text(
                'Depremler',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              icon: Icon(Icons.beach_access),
              child: Text(
                'Harita',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              icon: Icon(Icons.search),
              child: Text(
                'Ekler',
                style: TextStyle(fontWeight: FontWeight.bold),
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

  Drawer _buildDrawer() {
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
          _container(),
          _drawerListTile('Konut'),
          _container(),
          _drawerListTile('Gıda'),
          _container(),
          _drawerListTile('Giysi'),
        ],
      ),
    );
  }

  Container _container() {
    return Container(
      height: 1,
      color: Colors.orange,
    );
  }

  ListTile _drawerListTile(String text) {
    return ListTile(
      leading: Icon(Icons.arrow_forward_ios),
      title: AutoSizeText(text, maxLines: 1),
      subtitle:
          AutoSizeText('Afetzedelere ${text} Sağlayabilirim', maxLines: 1),
      onTap: null,
    );
  }
}

_callUrgent(String number){
launch('tel://${number}');
}