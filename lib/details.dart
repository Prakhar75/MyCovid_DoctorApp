//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycovid/myjson.dart';



class MyHomePage extends StatefulWidget {
  myjson myData;
  // MyHomePage({Key key, this.myData}) : super(key: key);
  MyHomePage(this.myData);

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
            body:
             profileView()));
  }

  Widget profileView() {
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
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                         decoration: InputDecoration(hintText: 'spO2 (%)',
                          hintStyle: TextStyle(
                    color: Colors.white70
                  ),
                  border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
                         ),
                        style: TextStyle(color: Colors.white70),
                      ),
                       
         
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                       decoration: InputDecoration(hintText: 'Blood Pressure(mm Hg)',
                        hintStyle: TextStyle(
                    color: Colors.white70
                  ),
                  border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
                       ),
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
       Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                         decoration: InputDecoration(hintText: 'Respiratory Rate (cycles)',fillColor: Colors.white,
                          hintStyle: TextStyle(
                    color: Colors.white70
                  ),
                  border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
                         ),
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                         decoration: InputDecoration(hintText: 'Pulse Rate (BPM)',
                          hintStyle: TextStyle(
                    color: Colors.white70
                  ),
                  border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
                         ),
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                         decoration: InputDecoration(hintText: 'O2 (litres)',fillColor: Colors.white,
                          hintStyle: TextStyle(
                    color: Colors.white70
                  ),
                  border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
                  ),
                        style: TextStyle(color: Colors.white),
                        
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.myData.FirstName + " " + widget.myData.LastName,
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white)),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.myData.PatientId}",
                        style: TextStyle(color: Colors.white,fontSize: 18),
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
                            onPressed: () => {},
                          ),
                        ),
                      ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
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
                              borderRadius: BorderRadius.circular(20.0),
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
