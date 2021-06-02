import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/src/partials/customDrawer.dart';
import 'package:travel/src/partials/customappbar.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context).settings.arguments;
    print(cityData);
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: CustomAppBar(
                  title: "Cidade",
                  hideSearch: true,
                  showBack: false,
                  scaffoldKey: _scaffoldKey,
                  pageContext: context),
              drawer: CustomDrawer(pageContext: context),
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        "Cidade!",
                        style: styles,
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
