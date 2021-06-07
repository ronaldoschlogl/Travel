import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/src/partials/citybox.dart';
import 'package:travel/src/partials/customDrawer.dart';
import 'package:travel/src/partials/customappbar.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List favorites = appdata.favoritesCities();
      print(favorites);
      return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
              title: "Cidades salvas",
              hideSearch: true,
              showBack: false,
              scaffoldKey: _scaffoldKey,
              pageContext: context),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(favorites.length, (index) {
              return CityBox(
                data: favorites[index],
                onTap: (cityData) {
                  Navigator.pushNamed(context, '/city', arguments: cityData);
                },
              );
            }),
          ));
    });
  }
}
