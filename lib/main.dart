import 'package:flutter/material.dart';
import 'package:my_app/DartLearn/LifeCycle.dart';
import 'package:my_app/DartLearn/StateLessWidget.dart';
import 'package:my_app/DartLearn/flutter_layout_page.dart';
import 'package:my_app/DartLearn/gesture_page.dart';
import 'package:my_app/DartLearn/resource_page.dart';
import 'package:my_app/DartLearn/stateful_group_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Title',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: RouteNavigator(title: 'Flutter Demo Home Page'),
      routes:<String, WidgetBuilder>{
        'less': (BuildContext context)=> StatelessGroupPage(),
        'stateful': (BuildContext context)=> StateFullGroupPage(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesture': (BuildContext context) =>  GesturePage(),
        'resource': (BuildContext context) =>  ResourcePage(),
        'lifeCycle': (BuildContext context) =>  LifeCycle()
      } ,
    );
  }
}

class RouteNavigator extends StatefulWidget  {
  RouteNavigator({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SwitchListTile(
                title: Text('${byName ? "" : "don't"} by router name'),
                value: byName,
                onChanged: (value){
                     setState(() {
                      byName = value; 
                     });
                },
              ),
              _item("Stateless", StatelessGroupPage(), 'less'),
              _item("Stateful", StateFullGroupPage(), 'stateful'),
              _item("Layout", FlutterLayoutPage(), 'layout'),
              _item("Gesture", GesturePage(), 'gesture'),
              _item("Resource", ResourcePage(), 'resource'),
              _item("LifeCycle", LifeCycle(), 'lifeCycle'),
             ],
            ),
          ),
    );
  }

    _item(String title, page, String routeName) {
  return Container(
    child: RaisedButton(
      onPressed: (){
         if(byName){
           Navigator.pushNamed(context, routeName);
         }
         else{
           Navigator.push(context, MaterialPageRoute(
             builder: (context)=> page
           ));
         }
      },
      child: Text(title),
      ),
  );
}
}
              

