import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mycovid/dashboard.dart';

//void main() => runApp(FormScreen());

class FormScreen extends StatefulWidget {
  final String cookie;
  FormScreen(this.cookie);
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _namem;
  String _namel;
  String _rel;
  String _ipd;
  String _rname;
  String _phoneNumber;
  String _rno;
  String ward_id;

  Dio dio = new Dio();

  Future postData() async {
    final String Url =
        'https://my-covid-hospital-api.herokuapp.com/patients/newPatient';

    dynamic data = {
      "FirstName": _name,
      "MiddleName": _namem,
      "LastName": _namel,
      "PhoneNumber": _phoneNumber,
      "RelativeName": _rname,
      "RelativePhoneNumber": _rno,
      "Relationship": _rel,
      "AdmissionDateTime": "2021-06-25 21:52:00",
      "WardId": int.parse(ward_id)
    };

    var response = await dio.post(Url,
        data: data,
        options: Options(
          headers: {
            'content-type': 'application/json; charset=UTF-8',
            'Cookie': "connect.sid=" + widget.cookie,
          },
        ));
    print(response.statusCode);
    return response.data;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildNamem() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Middle Name'),
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        _namem = value;
      },
    );
  }

  Widget _buildNamel() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        _namel = value;
      },
    );
  }

  // Widget _buildEmail() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Email'),
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Email is Required';
  //       }

  //       if (!RegExp(
  //               r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
  //           .hasMatch(value)) {
  //         return 'Please enter a valid email Address';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _email = value;
  //     },
  //   );
  // }

  /*Widget _buildIPD() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'IPD number'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _ipd = value;
      },
    );
  }*/

  Widget _builRelname() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Relative's Name"),
      keyboardType: TextInputType.name,
      validator: (String value) {
        if (value.isEmpty) {
          return 'data is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _rname = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      maxLength: 10,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildRelphNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Relative's phone number"),
      maxLength: 10,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _rno = value;
      },
    );
  }

  Widget _buildRelre() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Relationship with relative'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'data is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _rel = value;
      },
    );
  }

  Widget _wardID() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter Ward Number'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'data is Required';
        }

        return null;
      },
      onSaved: (String value) {
        ward_id = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal, title: Text("Enter Patient details")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildNamem(),
                _buildNamel(),
                //_buildIPD(),
                _buildPhoneNumber(),
                _builRelname(),
                _buildRelphNo(),
                _buildRelre(),
                _wardID(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () async {
                    _formKey.currentState.save();
                    if (!_formKey.currentState.validate()) {
                      return;
                    } else {
                      await postData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => dash(widget.cookie),
                        ),
                      );
                    }

                    print(_name);
                    print(_namem);
                    print(_namel);
                    print(_ipd);
                    print(_phoneNumber);
                    print(_rname);
                    print(_rno);
                    print(_rel);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
