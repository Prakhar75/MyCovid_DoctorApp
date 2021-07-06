//import 'dart:js_util';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycovid/myjson.dart';
import 'package:dio/dio.dart';
import 'package:mycovid/dashboard.dart';

class MyHomePage extends StatefulWidget {
  final String cookie;
  MyHomePage(this.cookie, this.myData);
  myjson myData;
  // MyHomePage({Key key, this.myData}) : super(key: key);
  //MyHomePage(this.myData);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text("MyCovid Doctor's App")),
            body: profileView(widget.cookie)));
  }

  String spo2;
  String bp_sys;
  String bp_dia;
  String res_cycle;
  String pul_rate;
  String o2;
  String temp;
  String vital_status;

  Dio dio = new Dio();

  Future postVitals() async {
    final String Url =
        'https://my-covid-hospital-api.herokuapp.com/patients/UpdateVitals' +
            '${widget.myData.PatientId}';

    dynamic vitals = {
      "PulseRate": pul_rate,
      "RespiratoryRate": res_cycle,
      "BpSystolic": bp_sys,
      "BpDiastolic": bp_dia,
      "SpO2": spo2,
      "O2": o2,
      "Temperature": temp
    };
    var response = await dio.post(Url,
        data: vitals,
        options: Options(
          headers: {
            'content-type': 'application/json; charset=UTF-8',
            'Cookie': "connect.sid=" + widget.cookie
          },
        ));
    vital_status = response.data["status"];
    return response.data;
  }

  Widget profileView(String cookie) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '   PROFILE  DETAILS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(height: 24, width: 24)
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 50, 1)])),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 13, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: Text(
                        widget.myData.FirstName + " " + widget.myData.LastName,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: Text(
                        "${widget.myData.PatientId}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'spO2 (%)',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white70),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'spO2 (%) is required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          spo2 = value;
                        },
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Blood Pressure Systolic(mm Hg)',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white70),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Blood Pressure Systolic(mm Hg) is required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          bp_sys = value;
                        },
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Blood Pressure Diastolic(mm Hg)',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white70),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Blood Pressure Diastolic(mm Hg) is required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          bp_dia = value;
                        },
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Respiratory Rate (cycles)',
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white70),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Respiratory Rate (cycles) is required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          res_cycle = value;
                        },
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Pulse Rate (BPM)',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white70),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Pulse Rate (BPM) is required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          pul_rate = value;
                        },
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'O2 (litres)',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white70),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'O2 (litres) is required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          o2 = value;
                        },
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 4),
                child: Container(
                  height: 45,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Temperature',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white70),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Temperature is required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          temp = value;
                        },
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      child: Text(
                        'Update Vitals',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    onPressed: () async {
                      await postVitals();
                      if (vital_status == "success") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => dash(cookie),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(20.0),
                                ),
                            color: Colors.teal,
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(20, 3, 10, 3),
                            child: Container(
                              child: Text(
                                'Consult Senior Doctor',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(20.0),
                                ),
                            color: Colors.teal,
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(20, 3, 10, 3),
                            child: Container(
                              child: Align(
                                child: Text(
                                  'Prompt To Relatives',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
