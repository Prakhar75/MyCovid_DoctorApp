import 'package:flutter/material.dart';

void main() => runApp(FormScreen());

class FormScreen extends StatefulWidget {
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

  Widget _buildPassword() {
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
  }

  Widget _builURL() {
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

  Widget _buildCalories() {
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

  Widget _buildEmail() {
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
                _buildPassword(),
                
                _buildPhoneNumber(),
                _builURL(),
                _buildCalories(),
                _buildEmail(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

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
