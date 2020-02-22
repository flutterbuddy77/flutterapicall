import 'package:flutter/material.dart';
import 'package:flutterapicalls/Blocs/GetBrandBloc.dart';
import 'package:flutterapicalls/Models/BrandModel.dart';

class BrandList extends StatefulWidget {
  @override
  _BrandListState createState() => _BrandListState();
}

class _BrandListState extends State<BrandList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    bloc.fetchAllBrands();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar,
      body: StreamBuilder(
        stream: bloc.allBrands,
        builder: (context, AsyncSnapshot<BrandModel> snapshot) {
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

  Widget buildList(AsyncSnapshot<BrandModel> snapshot) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: snapshot.data.getBrandModel.length,
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
                      snapshot.data.getBrandModel
                          .elementAt(index)
                          .imageUrl
                          .replaceAll('https', 'http'),
                      fit: BoxFit.fitWidth,
                      height: 50.0,
                      width: 70.0,
                    ),
                  ),
                  title: Text(
                    snapshot.data.getBrandModel
                        .elementAt(index)
                        .name
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
