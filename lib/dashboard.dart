import 'package:flutter/material.dart';
import 'package:mycovid/details.dart';


void main() => runApp(dash());

class dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text("MyCovid Doctor's App")),
          body: Center(child: ListSearch()),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal[600],
            child: Icon(Icons.qr_code_2_rounded),
            onPressed: () {
              print("Clicked");
              
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            elevation: 5,
            highlightElevation: 10,
          ),
        ));
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    // from
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

// to
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search by name or IPD',
                // hintStyle: TextStyle( color: Colors.white),
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                    title: Text(data),
                    onTap: () => {
                          print(data),
                          Navigator.push(
                             context,
                                  MaterialPageRoute(
                                    builder: (context) => det(),
                           ),
                           )
                        });
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
