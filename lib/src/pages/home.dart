import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/src/partials/customDrawer.dart';
import 'package:travel/src/partials/customappbar.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: CustomAppBar(
                  title: "Home",
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
                      margin: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Bem vindo(a) ao Travels",
                        style: styles,
                      ),
                    ),
                    Image.asset(
                      "lib/assets/travel.png",
                      width: 200,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        "Seu guia de viagem perfeito!",
                        style: styles,
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
