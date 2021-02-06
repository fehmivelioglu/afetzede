import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_afetzede/views/screens/account/login_type.dart';
import 'package:the_afetzede/views/screens/account/my_account.dart';
import 'package:the_afetzede/views/screens/home/bildirim_view.dart';
import 'package:the_afetzede/views/screens/home/deprem_view.dart';

import '../account/login_type.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  TabController _tabController ;
  @override
  void initState() {
    super.initState();
    _tabController  = TabController(length:3,vsync:this,initialIndex:0);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
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
          title: Text('AFETZEDE'),
          backgroundColor: Colors.red,
        ),
        body:_buildTabBarView(),
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
                "Harita",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              icon: Icon(Icons.search),
              child: Text(
                "Ekler",
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
        DepremView(),
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
            child: Text(""),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'))),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 1.5,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintText: "Arama yap",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.orange,
          ),
          _drawerListTile('Konut'),
          Container(
            height: 1,
            color: Colors.orange,
          ),
          _drawerListTile('Gıda'),
          Container(
            height: 1,
            color: Colors.orange,
          ),
         _drawerListTile('Giysi'),
        ],
      ),
    );
  }

  ListTile _drawerListTile(String text) {
    return ListTile(
          leading: Icon(Icons.arrow_forward_ios),
          title: AutoSizeText(text,maxLines:1),
          subtitle: AutoSizeText("Afetzedelere ${text} Sağlayabilirim",maxLines:1),
          onTap: null,
        );
  }
  

}
