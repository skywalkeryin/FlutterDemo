

import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  LifeCycle({Key key}) : super(key: key);

  _LifeCycleState createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Life Cycle"),
         ),
         body: Container(
           child:Text("Life Cycle") ,
           ),
       ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print('$state');
    if (state == AppLifecycleState.paused)
    {
      print("App Backgroud");
    }
    else if (state == AppLifecycleState.resumed)
    {
     print("app 进入前台");
    }
    else if (state == AppLifecycleState.inactive)
    {
      // 不常用： 应用程序处于非活动状态，并且未接受用户输入时调用， 比如：来了个电话
    }
    else if (state == AppLifecycleState.suspending)
    {
      // 不常用 : 应用被挂起时调用， 它不会在IOS上触发
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}