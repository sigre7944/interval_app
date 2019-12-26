import 'package:flutter/material.dart';

class Query {
  static var currentTimeString;

  String datetimefucntion() {
    return DateTime.now().day.toString() +
        '/' +
        DateTime.now().month.toString() +
        '/' +
        DateTime.now().year.toString() +
        ' '
            ' ' +
        DateTime.now().hour.toString() +
        ':' +
        DateTime.now().minute.toString();
  }
}

class StudyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  String getTime() {
    Query query = new Query();
    Query.currentTimeString = query.datetimefucntion();
    return Query.currentTimeString;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 150.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.red,
                          height: 1.5,
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                          height: 360,
                          color: Colors.red,
                          padding: EdgeInsets.only(bottom: 25.0))
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
