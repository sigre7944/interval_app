// Copyright 2019 By Champions. All rights reserved.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:camera/camera.dart';

import 'package:interval_app/screens/page_study.dart';
import 'package:interval_app/screens/page_archive.dart';
import 'package:interval_app/screens/page_settings.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  //This is so whenever users open the app it will ask for cameras
  cameras = await availableCameras();
  runApp(IntervalApp());
}

class IntervalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Interval Learning App',
        home: new HomePage(cameras),
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}

class HomePage extends StatefulWidget {
  var cameras;
  HomePage(this.cameras);
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    StudyPage(cameras),
    ArchivePage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          fixedColor: Colors.deepOrangeAccent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.book),
              title: new Text("Study"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.archive),
              title: new Text("Archive"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.slidersH),
              title: new Text("Settings"),
            )
          ],
        ),
        body: _children[_currentIndex]);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
