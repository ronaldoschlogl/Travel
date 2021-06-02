import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/src/models/appdata.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPageState createState() => _PreloadPageState();
}

class _PreloadPageState extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      loading = true;
    });

    bool req = await Provider.of<AppData>(context, listen: false).requestData();

    if (req) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  void initState() {
    super.initState();

    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/travel.png',
              width: 200,
            ),
            loading
                ? Container(
                    margin: EdgeInsets.all(30),
                    child: Text(
                      "Carregando Informações...",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : Container(),
            loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFFF757C)),
                  )
                : Container(),
            !loading
                ? Container(
                    margin: EdgeInsets.all(30),
                    child: ElevatedButton(
                      child: Text("Tentar Novamente"),
                      onPressed: () {},
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
