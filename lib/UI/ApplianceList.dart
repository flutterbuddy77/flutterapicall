import 'package:flutter/material.dart';
import 'package:flutterapicalls/Blocs/MyApplianceBloc.dart';
import 'package:flutterapicalls/Models/Requests/GetMyApplianceRequest.dart';
import 'package:flutterapicalls/Models/Responces/MyApplianceModel.dart';

class ApplianceList extends StatefulWidget {
  static const String routeName = '/ApplianceList';
  @override
  _ApplianceListState createState() => _ApplianceListState();
}

class _ApplianceListState extends State<ApplianceList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    GetMyApplianceRequest body =
        new GetMyApplianceRequest(userId: 6, creator: 0, modifier: 0);

    myappliancesbloc.fetchMyAppliances(body);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    myappliancesbloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: StreamBuilder(
        stream: myappliancesbloc.allMyAppliance,
        builder: (context, AsyncSnapshot<MyApplianceModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MyApplianceModel> snapshot) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: snapshot.data.getMyApplianceModel.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                      border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white24),
                      ),
                    ),
                    child: Image.network(
                      snapshot.data.getMyApplianceModel
                          .elementAt(index)
                          .imageUrl
                          .replaceAll('https', 'http'),
                      fit: BoxFit.fitWidth,
                      height: 50.0,
                      width: 70.0,
                    ),
                  ),
                  title: Text(
                    snapshot.data.getMyApplianceModel
                        .elementAt(index)
                        .applianceTypeName
                        .toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  final topAppBar = AppBar(
    elevation: 10.0,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Text("Appliance List"),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );
}
