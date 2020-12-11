import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Sheet',
      theme: ThemeData(),
      home: MyHomePage(title: 'Bottom Sheet'),
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
  _filter() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return Container(
            // child: ,
            height: 380,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                )),
          );
        });
  }

  _dragg() {
    return DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
      return SingleChildScrollView(
        child: Container(
          child: ListView.builder(
              itemCount: 15,
              controller: scrollController,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text('Item ${index + 1}'),
                );
              }),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.grey,
              width: double.infinity,
            ),
            DraggableScrollableSheet(
                minChildSize: 0.05,
                initialChildSize: 0.1,
                maxChildSize: 1.0,
                builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                child: ListView.builder(
                    itemCount: 15,
                    controller: scrollController,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        title: Text('Item ${index + 1}'),
                      );
                    }),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
              );
            }),
          ],
        ));
  }
}
