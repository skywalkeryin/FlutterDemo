import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatefulWidget {
  FlutterLayoutPage({Key key}) : super(key: key);

  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  var textStytle = TextStyle(fontSize: 20);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Stateful Widget"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("List"),
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text("Click"),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                onRefresh: _handleRefresh,
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: Image.network(
                                    "https://img2.mukewang.com/57b82f5b0001d66f01000100-140-140.jpg",
                                    width: 100,
                                    height: 100),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Opacity(
                                      opacity: 0.6,
                                      child: Image.network(
                                          "https://img2.mukewang.com/57b82f5b0001d66f01000100-140-140.jpg",
                                          width: 100,
                                          height: 100),
                                    )),
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.white),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.antiAlias,
                              child: PageView(
                               children: <Widget>[
                                _item("Page1", Colors.blueAccent),
                                _item("Page2", Colors.yellow),
                                _item("Page3", Colors.blueAccent),
                               ],
                              ),
                            )
                          ),
                          Column(
                            children: <Widget>[
                                  FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                      decoration: BoxDecoration(color: Colors.greenAccent),
                                      child: Text("width"),
                                    ),
                                  )
                             ],
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Image.network(
                          "https://img2.mukewang.com/57b82f5b0001d66f01000100-140-140.jpg",
                          width: 100,
                          height: 100
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network(
                          "https://img2.mukewang.com/57b82f5b0001d66f01000100-140-140.jpg",
                          width: 36,
                          height: 36
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: <Widget>[
                        _chip("Flutter APP"),
                        _chip("进阶"),
                        _chip("实战"),
                        _chip("APP"),
                        _chip("实战"),
                      ],
                    ),
                  ],
                ),
              )
            : Column(
              children: <Widget>[
                Text("List"),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: Text("fill up screen"),
                  ),
                )
                
              ],
            ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
  }
}

_item(String title, Color color) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color),
    child: Text(
      title,
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
  );
}

_chip(String label){
   return Chip(
     label: Text(label),
     avatar: CircleAvatar(
       backgroundColor: Colors.blue.shade900,
       child: Text(
         label.substring(0,1),
         style: TextStyle(fontSize: 10),
       ),
     ),
   );
}
