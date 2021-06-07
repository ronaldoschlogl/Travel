import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/src/partials/citybox.dart';
import 'package:travel/src/partials/customDrawer.dart';
import 'package:travel/src/partials/customappbar.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var list = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styles = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void doSearch(pageContext, text) async {
    // ignore: await_only_futures
    var newList = await Provider.of<AppData>(pageContext).searchCity(text);
    print(newList);
    setState(() {
      list = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppBar(
                title: "Busque uma cidade",
                hideSearch: false,
                showBack: false,
                scaffoldKey: _scaffoldKey,
                pageContext: context),
            drawer: CustomDrawer(
              pageContext: context,
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (text) {
                      doSearch(context, text);
                    },
                    decoration: InputDecoration(
                        hintText: "Insira o nome de uma cidade!",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.search,
                          size: 32,
                        )),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(list.length, (index) {
                    return CityBox(
                      data: list[index],
                      onTap: (cityData) {
                        print(cityData['name']);
                      },
                    );
                  }),
                )
              ],
            )));
  }
}
