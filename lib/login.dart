import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycovid/otp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<LoginScreen> {
  // WELCOME and login page
  TextEditingController passController = new TextEditingController();

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/doc.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
        )),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                child: CircleAvatar(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),
                  radius: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'MYCOVID APP',
                style: TextStyle(
                  fontSize: 30.0,
                  // fontFamily: 'Lobster',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Text(
                'WELCOME',
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 15.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              /*Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.healing,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'hospitalemail@gmail.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
              ),*/
              Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    child: Theme(
                      data: ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: passController,
                            decoration: InputDecoration(
                              labelText: "Enter Your Mobile Number",
                            ),
                            // obscureText: true,
                            keyboardType: TextInputType.text,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                        ],
                      ),
                    ),
                  )),
              MaterialButton(
                color: Colors.teal,
                textColor: Colors.white,
                child: Text('Get OTP'),
                onPressed: () => {
                  if ((passController.text).length == 10)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(passController.text),
                        ),
                      ),
                    }
                  else
                    {
                      passController.text = "invalid number",
                    }
                },
                splashColor: Colors.tealAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
