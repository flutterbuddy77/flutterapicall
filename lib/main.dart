import 'package:flutter/material.dart';
import 'package:flutterapicalls/widgets/AppDrawer.dart';

import 'UI/ApplianceList.dart';
import 'UI/BrandsList.dart';
import 'UI/FBLogin.dart';
import 'UI/GoogleAdMob.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: FBLoginPage(title: 'Facebook Login'),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      //appBar: AppBar(title: Text(widget.title),),
      //body: BrandList(),
      //body: ApplianceList(),
      body: GoogleAdMob(),
    );
  }
}
