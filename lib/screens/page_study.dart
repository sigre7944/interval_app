// Copyright 2019 By Champions. All rights reserved.

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

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
  List<CameraDescription> cameras;
  StudyPage(this.cameras);
  @override
  State<StatefulWidget> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  CameraController controller;

  TextEditingController keyInputController = new TextEditingController();
  TextEditingController valueInputController = new TextEditingController();

  File jsonFile;
  Directory dir;
  String fileName = 'database.json';
  bool fileExists = false;
  //To hold value from JSON file
  Map<String, dynamic> fileContent;

  @override
  void initState() {
    super.initState();

    controller =
        new CameraController(widget.cameras[0], ResolutionPreset.medium);
    //Asynchronous returned, thus the then()
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
          () => fileContent = jsonDecode(
            jsonFile.readAsStringSync(),
          ),
        );
    });
    print("hey");
  }

  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void _createFile(
      Map<String, String> content, Directory dir, String fileName) {
    print("Creating File!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = file.existsSync();
    file.writeAsStringSync(jsonEncode(content));
  }

  void _writeToFile(String key, String value) {
    print('Writing to file');
    Map<String, String> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent =
          jsonDecode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(jsonEncode(jsonFileContent));
    } else {
      print("File does not exist!");
      _createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
  }

  _deleteByKey(String key) {
    if (fileExists) {
      Map<String, dynamic> jsonFileContent =
          jsonDecode(jsonFile.readAsStringSync());
      jsonFileContent.remove(key);
      jsonFile.writeAsStringSync(jsonEncode(jsonFileContent));
    }
    this.setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
  }

  String _getTime() {
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
                ),
              ),
              new Text(
                "File content: ",
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              new Text(fileContent.toString()),
              new Padding(padding: new EdgeInsets.only(top: 10.0)),
              new Text("Add to JSON file: "),
              new TextField(
                controller: keyInputController,
              ),
              new TextField(
                controller: valueInputController,
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0)),
              new RaisedButton(
                child: new Text("Add key, value pair"),
                onPressed: () => _writeToFile(
                    keyInputController.text, valueInputController.text),
              ),
              new RaisedButton(
                  child: new Text('Delete by Key'),
                  onPressed: () => _deleteByKey(keyInputController.text)),
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
