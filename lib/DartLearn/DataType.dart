
import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  DataType({Key key}) : super(key: key);

  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    return Container(
      child: Text("Please see in console fff"),
      );
  }
   
  void _numType(){
    num num1 = -1.0;
    num num2 = 2;
    int int1 = 2;
    double d1 = 1.68;
    print(num1);
    print(num2);
    print(int1);
    print(d1);
  }
   
}