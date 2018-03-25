import 'dart:io';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:io/io.dart';
import 'package:audioplayer/audioplayer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'myCalc',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'myCalc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String Gleichung = "";
  num Ergebnis = 0;

  void add() {
    setState(() {
      Gleichung += "+";
    });
  }

  void sub() {
    setState(() {
      Gleichung += "-";
    });
  }

  void mul() {
    setState(() {
      Gleichung += "*";
    });
  }

  void div() {
    setState(() {
      Gleichung += "/";
    });
  }

  playLocal() async {
    AudioPlayer audioPlayer = new AudioPlayer();
    final file = new File('${(await getTemporaryDirectory()).path}/quick.mp3');
    await file.writeAsBytes((await playLocal()).buffer.asUint8List());
    final result = await audioPlayer.play(file.path, isLocal: true);
  }

  void eval() async {
    setState(() {
      Parser p = new Parser();
      Expression exp = p.parse(Gleichung);
      Ergebnis = exp.evaluate(EvaluationType.REAL, new ContextModel());
      playLocal();
    });
  }

  void nol() {
    setState(() {
      Gleichung += "0";
    });
  }

  void eins() {
    setState(() {
      Gleichung += "1";
    });
  }

  void zwei() {
    setState(() {
      Gleichung += "2";
    });
  }

  void drei() {
    setState(() {
      Gleichung += "3";
    });
  }

  void vier() {
    setState(() {
      Gleichung += "4";
    });
  }

  void fuenf() {
    setState(() {
      Gleichung += "5";
    });
  }

  void sechs() {
    setState(() {
      Gleichung += "6";
    });
  }

  void sieben() {
    setState(() {
      Gleichung += "7";
    });
  }

  void acht() {
    setState(() {
      Gleichung += "8";
    });
  }

  void neun() {
    setState(() {
      Gleichung += "9";
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '$Gleichung',
            ),
            new Text(
              'Result: $Ergebnis',
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text('+',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: add),
                  new RaisedButton(
                      child: new Text('-',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: sub),
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text('*',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: mul),
                  new RaisedButton(
                      child: new Text('/',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: div),
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text('7',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: sieben),
                  new RaisedButton(
                      child: new Text('8',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: acht),
                  new RaisedButton(
                      child: new Text('9',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: neun),
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text('4',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: vier),
                  new RaisedButton(
                      child: new Text('5',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: fuenf),
                  new RaisedButton(
                      child: new Text('6',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: sechs),
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text('1',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: eins),
                  new RaisedButton(
                      child: new Text('2',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: zwei),
                  new RaisedButton(
                      child: new Text('3',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: drei),
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text('0',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: mul),
                  new RaisedButton(
                      child: new Text('=',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: eval),
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text('C',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        setState(() {
                          Gleichung = Gleichung.substring(1);
                        });
                      }),
                  new RaisedButton(
                      child: new Text('CE',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        setState(() {
                          Gleichung = "";
                          Ergebnis = 0;
                        });
                      }),
                ]),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
