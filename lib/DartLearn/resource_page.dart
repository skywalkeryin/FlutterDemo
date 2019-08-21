
import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  ResourcePage({Key key}) : super(key: key);

  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: MaterialApp(
         title: "Resource",
         theme: ThemeData(
           primarySwatch: Colors.blue,
         ),
         home: Scaffold(
           appBar: AppBar(
             title: Text("Resource"),
           ),
           body: Container(
              child: Column(
                children: <Widget>[
                  Image(
                    width: 50,
                    height: 50,
                    image: AssetImage('images/phone.jpg'),
                  )
                ],
              ),
           ),
         ),

       ),
    );
  }
}