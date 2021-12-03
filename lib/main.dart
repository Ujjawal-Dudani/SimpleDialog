import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

enum Answers{YES,NO,MAYBE}

class _State extends State<MyApp> {

  String _value = '';

  void _setValue(String value) => setState(() => _value = value);

  Future _askUser() async {
    switch(
    await showDialog(
        context: context,
        /*
       Older Flutter Versions
        child: new SimpleDialog(
          title: new Text('Do you like Flutter?'),
          children: <Widget>[
            new SimpleDialogOption(child: new Text('Yes!!!'),onPressed: (){Navigator.pop(context, Answers.YES);},),
            new SimpleDialogOption(child: new Text('NO :('),onPressed: (){Navigator.pop(context, Answers.NO);},),
            new SimpleDialogOption(child: new Text('Maybe :|'),onPressed: (){Navigator.pop(context, Answers.MAYBE);},),
          ],
        )
        */
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Do you like Flutter?'),
            children: <Widget>[
              SimpleDialogOption(child: Text('Yes!!!'),onPressed: (){Navigator.pop(context, Answers.YES);},),
              SimpleDialogOption(child: Text('NO :('),onPressed: (){Navigator.pop(context, Answers.NO);},),
              SimpleDialogOption(child: Text('Maybe :|'),onPressed: (){Navigator.pop(context, Answers.MAYBE);},),
            ],
          );
        }
    )
    ) {
      case Answers.YES:
        _setValue('Yes');
        break;
      case Answers.NO:
        _setValue('No');
        break;
      case Answers.MAYBE:
        _setValue('Maybe');
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_value),
                RaisedButton(onPressed: _askUser, child: Text('Click me'),)
              ],
            ),
          )
      ),
    );
  }
}