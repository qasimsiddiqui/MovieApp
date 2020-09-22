import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/api/api_configuration.dart';
import 'package:movies_app/models/movie.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
