/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class Home extends StatefulWidget {
  // home page for doctor App after login (in process)
  final String cookie;
  Home(this.cookie);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid;
  @override
  TextEditingController editingController = TextEditingController();
  TabController controller;
  List<String> listItems = [
    // enter patient names here from database
  ];

  @override
  Widget build(BuildContext context) {
    return dash(widget.cookie);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
  }
}*/
