import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget implements PreferredSizeWidget {
  BuildContext pageContext;
  CustomDrawer({required this.pageContext});
  @override
  CustomDrawer_State createState() => CustomDrawer_State();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

// ignore: camel_case_types
class CustomDrawer_State extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Travels",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Versão 1.0",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF15BDB1),
              )),
          ListTile(
            leading: Icon(Icons.home, color: Colors.black),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacementNamed(widget.pageContext, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.public, color: Colors.black),
            title: Text("Escolher Continente"),
            onTap: () {
              Navigator.pushReplacementNamed(widget.pageContext, '/continent');
            },
          ),
          ListTile(
            leading: Icon(Icons.search, color: Colors.black),
            title: Text("Buscar Cidade"),
            onTap: () {
              Navigator.pushReplacementNamed(widget.pageContext, '/search');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.black),
            title: Text("Cidades Salvas"),
            onTap: () {
              Navigator.pushReplacementNamed(widget.pageContext, '/favorites');
            },
          ),
        ],
      ),
    );
  }
}
