import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycovid/cards.dart';
import 'package:mycovid/myjson.dart';
import 'package:dio/dio.dart';
import 'package:mycovid/dashboard.dart';
import 'package:mycovid/mainpage.dart';

class det extends StatefulWidget {
  final String cookie;
  det(this.cookie, this.myData);
  myjson myData;
  // MyHomePage({Key key, this.myData}) : super(key: key);
  //MyHomePage(this.myData);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<det> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.grey[900],
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.teal,
                title: Text("MyCovid Doctor's App"),
                leading: BackButton(
                  //icon: Icon(Icons.Back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            cards(widget.cookie, widget.myData),
                      ),
                    );
                  },
                )),
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
        'https://my-covid-hospital-api.herokuapp.com/patients/updateVitals' +
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
    print(widget.myData.PatientId);
    print(response.data);
    return response.data;
  }

  Widget profileView(String cookie) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
          child: Column(
            children: <Widget>[
             SizedBox(
               height: 10,
             ),
              Container(
          child: Padding(
                            padding:EdgeInsets.all(10),
          child:Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.grey[600], Colors.red[400]])),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
                      child: Container(
                        height: 45,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Text(
                              widget.myData.FirstName +
                                  " " +
                                  widget.myData.LastName,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 10),
                      child: Container(
                        height: 45,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Text(
                              "${widget.myData.PatientId}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.white70)),
                      ),
                    ),
                  ],
                ),
              ),
          )
              ),
              SizedBox(
               height: 10,
             ),
              Container(
          child: Padding(
                            padding:EdgeInsets.all(10),
          child:Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                   color: Colors.blueGrey[500],
                ),
                        
                child: Column(
                  
                  children: <Widget>[
                    ExpansionTile(
      title:
      Text('\nLast Updated on dd/mm/yyyy \n\n\nspO2 (%)      \n\nBlood Pressure Systolic(mm Hg)    \n\nBlood Pressure Diatolic(mm Hg) \n',
      style: TextStyle(color: Colors.white),
      ),
      
           
       children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 4),
                      child: Container(
                        
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: Text(
                                'Respiratory Rate (cycles)',
                                
                              style:  TextStyle(color: Colors.white,
                              fontSize: 17)
                              
                              ,
                               
                              ),
                            ),
                          ),
                        ),
                      
                      ),
                    
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 4),
                      child: Container(
                        height: 45,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: Text(
                                'Pulse Rate (BPM)',
                              style:  TextStyle(color: Colors.white,
                               fontSize: 17),
                               
                              ),
                            ),
                          ),
                        ),
                      
                      ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 4),
                      child: Container(
                        height: 45,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: Text(
                                'O2 (Litres)',
                              style:  TextStyle(color: Colors.white,
                               fontSize: 17),
                               
                              ),
                            ),
                          ),
                        ),
                      
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 4),
                      child: Container(
                        height: 45,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                            child: Text(
                                'Temperature   \n',
                              style:  TextStyle(color: Colors.white,
                               fontSize: 17),
                               
                              ),
                            ),
                          ),
                        ),
                      
                      ),
                  ],
                    ),
                  ],
                ),
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

