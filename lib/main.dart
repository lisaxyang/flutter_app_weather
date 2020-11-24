import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Weather'),
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

  int _tempr = 0;
  int _time = 12;
  String _precip = "none";
  String _comic = "";

  String _link = "https://cs.brown.edu/courses/csci1300/";
  String _link2 = "https://signmeup.cs.brown.edu/";
  String _weatherlink = "http://www.7timer.info/bin/astro.php?lon=-71.4&lat=41.8&ac=0&unit=metric&output=json&tzshift=0";
  String _xkcd = "https://xkcd.com/info.0.json";

  void _checkStatus() async {
    final res = await http.get(_weatherlink);
    print("it got here");
    setState(() {
      _status = res.statusCode == 200;
      // _link = parse(res.body).getElementByTagName('title').single.innerHtml;
    });
  }

  void _checkStatus2() async {
    final res = await http.get(_xkcd);
    setState(() {
      _status2 = res.statusCode == 200;
      // _link2 = parse(res.body).getElementByTagName('title').single.innerHtml;
    });
  }

  void _checkStatusAll() {
    print(_link);
    _checkStatus();
    _checkStatus2();
  }

  void _getWeather() async {
    _checkStatusAll();
    final res = await http.get(_xkcd);
    final response = '{ "product" : "astro" , "init" : "2020112312" , "dataseries" : [ { "timepoint" : 3, "cloudcover" : 9, "seeing" : 4, "transparency" : 8, "lifted_index" : 2, "rh2m" : 14, "wind10m" : { "direction" : "SW", "speed" : 3 }, "temp2m" : 14, "prec_type" : "rain" }, { "timepoint" : 6, "cloudcover" : 9, "seeing" : 3, "transparency" : 6, "lifted_index" : 15, "rh2m" : 13, "wind10m" : { "direction" : "NW", "speed" : 3 }, "temp2m" : 7, "prec_type" : "rain" }, { "timepoint" : 9, "cloudcover" : 9, "seeing" : 5, "transparency" : 3, "lifted_index" : 15, "rh2m" : 10, "wind10m" : { "direction" : "NW", "speed" : 3 }, "temp2m" : 6, "prec_type" : "rain" }, { "timepoint" : 12, "cloudcover" : 6, "seeing" : 5, "transparency" : 2, "lifted_index" : 15, "rh2m" : 9, "wind10m" : { "direction" : "NW", "speed" : 3 }, "temp2m" : 3, "prec_type" : "rain" }, { "timepoint" : 15, "cloudcover" : 1, "seeing" : 5, "transparency" : 2, "lifted_index" : 15, "rh2m" : 10, "wind10m" : { "direction" : "NW", "speed" : 3 }, "temp2m" : 2, "prec_type" : "none" }, { "timepoint" : 18, "cloudcover" : 1, "seeing" : 5, "transparency" : 2, "lifted_index" : 15, "rh2m" : 9, "wind10m" : { "direction" : "NW", "speed" : 3 }, "temp2m" : 1, "prec_type" : "none" }, { "timepoint" : 21, "cloudcover" : 1, "seeing" : 6, "transparency" : 3, "lifted_index" : 15, "rh2m" : 10, "wind10m" : { "direction" : "NW", "speed" : 3 }, "temp2m" : 1, "prec_type" : "none" }, { "timepoint" : 24, "cloudcover" : 1, "seeing" : 6, "transparency" : 3, "lifted_index" : 15, "rh2m" : 10, "wind10m" : { "direction" : "W", "speed" : 3 }, "temp2m" : 1, "prec_type" : "none" }, { "timepoint" : 27, "cloudcover" : 1, "seeing" : 4, "transparency" : 2, "lifted_index" : 15, "rh2m" : 6, "wind10m" : { "direction" : "NW", "speed" : 3 }, "temp2m" : 4, "prec_type" : "none" }, { "timepoint" : 30, "cloudcover" : 1, "seeing" : 4, "transparency" : 2, "lifted_index" : 15, "rh2m" : 4, "wind10m" : { "direction" : "NW", "speed" : 3 }, "temp2m" : 5, "prec_type" : "none" }, { "timepoint" : 33, "cloudcover" : 1, "seeing" : 6, "transparency" : 2, "lifted_index" : 15, "rh2m" : 6, "wind10m" : { "direction" : "NW", "speed" : 2 }, "temp2m" : 4, "prec_type" : "none" }, { "timepoint" : 36, "cloudcover" : 1, "seeing" : 6, "transparency" : 2, "lifted_index" : 15, "rh2m" : 7, "wind10m" : { "direction" : "N", "speed" : 2 }, "temp2m" : 1, "prec_type" : "none" }, { "timepoint" : 39, "cloudcover" : 3, "seeing" : 6, "transparency" : 2, "lifted_index" : 15, "rh2m" : 6, "wind10m" : { "direction" : "N", "speed" : 2 }, "temp2m" : -1, "prec_type" : "none" }, { "timepoint" : 42, "cloudcover" : 4, "seeing" : 5, "transparency" : 2, "lifted_index" : 15, "rh2m" : 5, "wind10m" : { "direction" : "NE", "speed" : 2 }, "temp2m" : -1, "prec_type" : "none" }, { "timepoint" : 45, "cloudcover" : 8, "seeing" : 4, "transparency" : 2, "lifted_index" : 15, "rh2m" : 5, "wind10m" : { "direction" : "E", "speed" : 2 }, "temp2m" : -1, "prec_type" : "none" }, { "timepoint" : 48, "cloudcover" : 8, "seeing" : 4, "transparency" : 2, "lifted_index" : 15, "rh2m" : 6, "wind10m" : { "direction" : "E", "speed" : 2 }, "temp2m" : 0, "prec_type" : "none" }, { "timepoint" : 51, "cloudcover" : 9, "seeing" : 3, "transparency" : 2, "lifted_index" : 15, "rh2m" : 7, "wind10m" : { "direction" : "SE", "speed" : 2 }, "temp2m" : 6, "prec_type" : "none" }, { "timepoint" : 54, "cloudcover" : 9, "seeing" : 5, "transparency" : 3, "lifted_index" : 15, "rh2m" : 10, "wind10m" : { "direction" : "S", "speed" : 2 }, "temp2m" : 9, "prec_type" : "none" }, { "timepoint" : 57, "cloudcover" : 9, "seeing" : 6, "transparency" : 3, "lifted_index" : 15, "rh2m" : 11, "wind10m" : { "direction" : "SW", "speed" : 2 }, "temp2m" : 8, "prec_type" : "none" }, { "timepoint" : 60, "cloudcover" : 9, "seeing" : 6, "transparency" : 4, "lifted_index" : 15, "rh2m" : 14, "wind10m" : { "direction" : "SW", "speed" : 2 }, "temp2m" : 7, "prec_type" : "none" }, { "timepoint" : 63, "cloudcover" : 9, "seeing" : 6, "transparency" : 4, "lifted_index" : 15, "rh2m" : 13, "wind10m" : { "direction" : "SW", "speed" : 2 }, "temp2m" : 7, "prec_type" : "none" }, { "timepoint" : 66, "cloudcover" : 9, "seeing" : 6, "transparency" : 4, "lifted_index" : 15, "rh2m" : 13, "wind10m" : { "direction" : "W", "speed" : 2 }, "temp2m" : 7, "prec_type" : "rain" }, { "timepoint" : 69, "cloudcover" : 9, "seeing" : 6, "transparency" : 4, "lifted_index" : 15, "rh2m" : 13, "wind10m" : { "direction" : "SE", "speed" : 2 }, "temp2m" : 6, "prec_type" : "none" }, { "timepoint" : 72, "cloudcover" : 9, "seeing" : 5, "transparency" : 7, "lifted_index" : 15, "rh2m" : 14, "wind10m" : { "direction" : "E", "speed" : 2 }, "temp2m" : 6, "prec_type" : "rain" } ] }';
    final parsed = jsonDecode(response);
    setState(() {
      _comic = jsonDecode(res.body)['img'];
      _tempr = parsed['dataseries'][0]['temp2m'];
      _time = 12 + parsed['dataseries'][0]['timepoint'];
      // _time = parsed['dataseries'][0]['timepoint'];
      _precip = parsed['dataseries'][0]['prec_type'];
      // _tempr = 5;
      // throw(_tempr);
      print(_tempr);
    });
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
                "Website: $_weatherlink",
              ),
            ),
            ListTile(
              leading: _status2 ? Icon(Icons.check) : Icon(Icons.delete_forever_rounded),
              title: Text(
                //   'You have pushed the button this many times:',
                "Website: $_xkcd",
              ),
            ),
            ListTile(
              // leading:
              title: Text(
                'comic link: $_comic',
              ),
            ),
            ListTile(
              // leading:
              title: Text(
                'Hello :) \nClick on the button to get the weather for today',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                //   'You have pushed the button this many times:',
                'Time: $_time :00',
              ),
            ),
            ListTile(
              leading: Icon(Icons.thermostat_outlined),
              title: Text(
                //   'You have pushed the button this many times:',
                'Temperature: $_tempr C',
              ),
            ),
            ListTile(
              leading: _precip == "none" ? Icon(Icons.wb_sunny_outlined) : Icon(Icons.cloud),
              title: Text(
                //   'You have pushed the button this many times:',
                'Precipitation: $_precip',
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getWeather,
        tooltip: 'Get Weather',
        child: Icon(Icons.cloud_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
