import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'UI Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
  bool _status = false;
  bool _status2 = false;

  String _link = "https://cs.brown.edu/courses/csci1300/";
  String _link2 = "https://signmeup.cs.brown.edu/";

  void _checkStatus() async {
    final res = await http.get(_link);
    setState(() {
      _status = res.statusCode == 200;
      // _link = parse(res.body).getElementByTagName('title').single.innerHtml;
    });
  }

  void _checkStatus2() async {
    final res = await http.get(_link2);
    setState(() {
      _status2 = res.statusCode == 200;
      // _link2 = parse(res.body).getElementByTagName('title').single.innerHtml;
    });
  }

  void _checkStatusAll() {
    _checkStatus();
    _checkStatus2();
  }
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: _status ? Icon(Icons.check) : Icon(Icons.delete_forever_rounded),
              title: Text(
                //   'You have pushed the button this many times:',
                "Website: $_link",
              ),
            ),
            ListTile(
              leading: _status2 ? Icon(Icons.check) : Icon(Icons.delete_forever_rounded),
              title: Text(
                //   'You have pushed the button this many times:',
                "Website: $_link2",
              ),
            ),
            Text(
              '$_status',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkStatusAll,
        tooltip: 'Check Status',
        child: Icon(Icons.network_check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
