import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  BuildContext pageContext;
  String title;
  bool hideSearch = false;
  bool showBack = false;
  CustomAppBar({
    required this.title,
    required this.hideSearch,
    required this.showBack,
    required this.scaffoldKey,
    required this.pageContext,
  });

  @override
  CustomAppBar_State createState() => CustomAppBar_State();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

// ignore: camel_case_types
class CustomAppBar_State extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    IconButton drawerIcon = IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {
        widget.scaffoldKey.currentState?.openDrawer();
      },
    );
    IconButton backIcon = IconButton(
        onPressed: () {
          Navigator.pop(widget.pageContext);
        },
        icon: Icon(Icons.arrow_back, size: 30, color: Colors.black));

    IconButton leadingButton = drawerIcon;
    if (widget.showBack) {
      leadingButton = backIcon;
    }
    void searchAction() {
      Navigator.pushReplacementNamed(widget.pageContext, '/search');
    }

    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: true,
      title: Text(
        widget.title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica Neue'),
      ),
      leading: leadingButton,
      actions: <Widget>[
        widget.hideSearch
            ? IconButton(
                onPressed: searchAction,
                icon: Icon(Icons.search),
                color: Colors.black,
                iconSize: 30,
              )
            : Container()
      ],
    );
  }
}
