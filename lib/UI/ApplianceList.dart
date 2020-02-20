import 'package:flutter/material.dart';
import 'package:flutterapicalls/Blocs/MyApplianceBloc.dart';
import 'package:flutterapicalls/Models/Requests/GetMyApplianceRequest.dart';
import 'package:flutterapicalls/Models/Responces/MyApplianceModel.dart';

class ApplianceList extends StatefulWidget {
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
    final body = {
      "UserId": 6,
    };
    myappliancesbloc.fetchMyAppliances(6);
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
    return GridView.builder(
        itemCount: snapshot.data.getMyApplianceModel.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              enableFeedback: true,
              child: Image.network(
                snapshot.data.getMyApplianceModel
                    .elementAt(index)
                    .imageUrl
                    .replaceAll('https', 'http'),
                fit: BoxFit.fitWidth,
                height: 50.0,
                width: 100.0,
              ),
            ),
          );
        });
  }
}
