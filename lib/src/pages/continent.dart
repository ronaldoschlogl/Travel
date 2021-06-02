import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/src/models/appdata.dart';
import 'package:travel/src/pages/listcity.dart';
import 'package:travel/src/partials/customDrawer.dart';
import 'package:travel/src/partials/customappbar.dart';
import 'package:travel/src/partials/citybox.dart';

class ContinentPage extends StatefulWidget {
  @override
  _ContinentPageState createState() => _ContinentPageState();
}

class _ContinentPageState extends State<ContinentPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void seeCityAction(context, continentIndex) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ListCityPage(
            currentIndex: continentIndex,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: CustomAppBar(
                  title: "Continentes",
                  hideSearch: true,
                  showBack: false,
                  scaffoldKey: _scaffoldKey,
                  pageContext: context),
              drawer: CustomDrawer(pageContext: context),
              backgroundColor: Colors.white,
              body: ListView.builder(
                  itemCount: appdata.data.length,
                  itemBuilder: (context, index) {
                    var cities = [];
                    for (var country in appdata.data[index]['countries']) {
                      cities.addAll(country['cities']);
                    }
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "${appdata.data[index]['name']} (${cities.length})",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Helvetica Neue'),
                              ),
                            ),
                            TextButton(
                              child: Text(
                                "Ver cidades",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Helvetica Neue',
                                    color: Colors.grey[700]),
                              ),
                              onPressed: () {
                                seeCityAction(context, index);
                              },
                            ),
                          ],
                        ),
                        Container(
                            height: 150,
                            margin: EdgeInsets.only(bottom: 15),
                            child: ListView.builder(
                                itemCount: cities.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (cityContext, cityIndex) {
                                  return CityBox(
                                      data: cities[cityIndex],
                                      onTap: (cityData) {
                                        print("teste");
                                      });
                                }))
                      ],
                    );
                  }),
            ));
  }
}
