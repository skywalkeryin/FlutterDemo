import 'package:flutter/material.dart';


class StatelessGroupPage extends StatefulWidget {
  StatelessGroupPage({Key key}) : super(key: key);

  @override
  _StatelessWidgetState createState() => _StatelessWidgetState();
}

class _StatelessWidgetState extends State<StatelessGroupPage> {
  var textStytle = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Stateless"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            )),
        body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                Text("i am text", style: textStytle),
                Icon(
                  Icons.watch,
                  size: 50,
                  color: Colors.red,
                ),
                CloseButton(),
                BackButton(),
                Chip(
                  avatar: Icon(Icons.ac_unit),
                  label: Text("This is a chip"),
                ),
                Divider(
                  indent: 10,
                  color: Colors.red,
                  height: 10,
                ),
                Card(
                  color: Colors.red,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'this is a card',
                      style: textStytle,
                    ),
                  ),
                ),
                AlertDialog(
                  title: Text("alert"),
                )
              ],
            )));
  }
}
