import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  GesturePage({Key key}) : super(key: key);

  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printStr = "";
  double moveX, moveY = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gesture",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text("Stateful Widget"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            )),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _printMsg("Click"),
                    onDoubleTap: () => _printMsg("DoubleClick"),
                    onLongPress: () => _printMsg("LongPress"),
                    onTapCancel: () => _printMsg("Cancel"),
                    onTapUp: (e) => _printMsg("Up"),
                    onTapDown: (e) => _printMsg("Down"),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        "Click Me",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(printStr)
                ],
              ),
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _doMove(e),
                  child: Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(32)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      printStr += ", $msg";
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
        moveY += e.delta.dy;
        moveX += e.delta.dx;
    }); 
    print(e);
  }

}
