import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We are not really strangers',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.cyan.shade200,
      ),
      home: const MyHomePage(title: 'We are not really strangers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Prompt {
  final int lvl;
  final String phrase;

  const Prompt({
    required this.lvl,
    required this.phrase,
  });

  factory Prompt.fromJson(Map<String, dynamic> json) {
    return Prompt(
      lvl: json['lvl'],
      phrase: json['phrase'],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Prompt _prompt= Prompt.fromJson({"phrase": "", "lvl": 1});
  List<dynamic> _buffer = [];
  int _lvl = 1;

  Future changePrompt() async {
    if (_buffer.length == 0 || _prompt.lvl != _lvl) {
      final response = await http.get(Uri.parse('https://59fxcxkow4.execute-api.us-east-1.amazonaws.com/dev/icebreakers/phrases?n=31&level=${_lvl}'));
      if (response.statusCode == 200) {
        setState(() { _prompt = Prompt.fromJson(jsonDecode(response.body)[0]);});
        setState(() { _buffer = jsonDecode(response.body).skip(1).map((_) => Prompt.fromJson(_)).toList();});
      } else {
        throw Exception('Failed to load new buffer');
      }
    } else {
      setState(() {_prompt = _buffer[0];});
      List new_buffer = _buffer;
      new_buffer.removeAt(0);
      setState(() {_buffer = new_buffer;});
    }
      
  }

  void changeLevel(new_level) {
    setState(() { _lvl = new_level;});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child:Text(widget.title)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 0, height: 10),
            Row(
              children: [
                SizedBox(
                  width: 100.0,
                  child:ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () { changeLevel(1); },
                    child: Text('lvl 1'),
                  ),
                ),
                SizedBox(width: 10, height: 0),
                SizedBox(
                  width: 100.0,
                  child:ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () { changeLevel(2); },
                    child: Text('lvl 2'),
                  ),
                ),
                SizedBox(width: 10, height: 0),
                SizedBox(
                  width: 100.0,
                  child:ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () { changeLevel(3); },
                    child: Text('lvl 3'),
                  ),
                ),
            ],
            mainAxisAlignment: MainAxisAlignment.center
            ),
            SizedBox(width: 0, height: 50),
            Center(child: Text("${_lvl}")),
            Container(
              width: 400.0,
              height: 300.0,
                child:Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child:Center(child: Text(
                    _prompt.phrase,
                    textAlign: TextAlign.center)))
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                border: Border.all( width: 1)
              ),
            ),
            SizedBox(width: 0, height: 50),
            ElevatedButton(
              style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
                onPressed: () { changePrompt(); },
                child: Text('New prompt'),
            ),
          ]
        )
      ));
  }
}
