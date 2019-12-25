import 'package:flutter/material.dart';
import 'package:interval_app/screens/page_study.dart';
import 'package:interval_app/screens/page_archive.dart';
import 'package:interval_app/screens/page_settings.dart';

void main() => runApp(IntervalApp());

class IntervalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Interval Learning App',
        home: new HomePage(),
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> _todoItems = [];
  int _currentIndex = 1;

  final List<Widget> _children = [ArchivePage(), SettingsPage(), StudyPage()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
