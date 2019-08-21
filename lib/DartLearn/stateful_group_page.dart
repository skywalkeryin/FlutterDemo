import 'package:flutter/material.dart';

class StateFullGroupPage extends StatefulWidget {
  StateFullGroupPage({Key key}) : super(key: key);

  StateFullGroupPageState createState() => StateFullGroupPageState();
}

class StateFullGroupPageState extends State<StateFullGroupPage> {
  var textStytle = TextStyle(fontSize: 20);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateful Widget"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )
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
                        ))
                  ],
                ),
              )
            : Text(" List "),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
  }
}
