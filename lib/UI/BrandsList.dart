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
    return GridView.builder(
        itemCount: snapshot.data.getBrandModel.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              enableFeedback: true,
              child: Image.network(
                snapshot.data.getBrandModel
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
