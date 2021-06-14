import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class Home extends StatefulWidget {
  // home page for doctor App after login (in process)
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid;

  @override
  Widget build(BuildContext context) {
    return dash();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
  }
}
