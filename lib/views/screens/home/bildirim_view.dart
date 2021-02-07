import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_afetzede/core/shared/alert_bildirimler_dialog.dart';

class BildirimView extends StatefulWidget {
  @override
  _BildirimViewState createState() => _BildirimViewState();
}

class _BildirimViewState extends State<BildirimView> {
  final islemler = [
    'Afet bildiriminde bulun',
    'Yakınıma ulaşamıyorum',
    'Kablosuz ağlarının şifresini kaldır talebi',
    'Para yardımı yap',
    'Giysi yardımı yap',
    'Yiyecek yardımı yap',
    'Kalacak yer yardımı yap',
    'Ben güvendeyim',
    'Yardım iste'
  ];

  final List<FaIcon> icons = [
    FaIcon(FontAwesomeIcons.exclamation),
    FaIcon(FontAwesomeIcons.bell),
    FaIcon(FontAwesomeIcons.wifi),
    FaIcon(FontAwesomeIcons.liraSign),
    FaIcon(FontAwesomeIcons.tshirt),
    FaIcon(FontAwesomeIcons.utensils),
    FaIcon(FontAwesomeIcons.home),
    FaIcon(FontAwesomeIcons.thumbsUp),
    FaIcon(FontAwesomeIcons.handsHelping),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Colors.yellow[200],
            elevation: 20,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: icons[index],
              ),
              title: AutoSizeText(
                islemler[index],
              ),
              onTap: () {
                showAlertBildirimlerDialog(context, islemler[index]);
              },
            ),
          );
        },
        itemCount: islemler.length,
        shrinkWrap: true,
      ),
    );
  }
}
