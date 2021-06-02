import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/src/models/appdata.dart';
import 'package:travel/src/partials/citybox.dart';
import 'package:travel/src/partials/customDrawer.dart';
import 'package:travel/src/partials/customappbar.dart';

class ListCityPage extends StatefulWidget {
  ListCityPage({this.currentIndex});
  int? currentIndex;
  @override
  _ListCityPageState createState() => _ListCityPageState();
}

class _ListCityPageState extends State<ListCityPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void cityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, "/city", arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    //final continentIndex = ModalRoute.of(context)?.settings.arguments;
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      var cities = [];
      for (var country in appdata.data[widget.currentIndex!]['countries']) {
        cities.addAll(country['cities']);
      }
      return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            title:
                "${appdata.data[widget.currentIndex!]['name']} (${cities.length} cidades)",
            hideSearch: true,
            showBack: true,
            scaffoldKey: _scaffoldKey,
            pageContext: context),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index) {
              return CityBox(
                data: cities[index],
                onTap: (cityData) {
                  cityBoxAction(context, cityData);
                },
              );
            })),
      );
    });
  }
}
