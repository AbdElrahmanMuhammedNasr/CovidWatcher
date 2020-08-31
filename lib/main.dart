import 'package:covid19/CasePack/Statistic.dart';
import 'package:covid19/Product/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Covid-19",
              style: TextStyle(color: Colors.green),
            ),
            elevation: 0,
            backgroundColor: Colors.grey[200],
            leading: Image.asset(
              'images/co.png',
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.verified_user, color: Colors.green),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProdectMethod()));
                  })
            ],
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(flex: 8, child: Statistic()),
              ],
            ),
          )),
    );
  }
}
