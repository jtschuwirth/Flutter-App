import 'package:app/src/presentation/views/wnrs.view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WnrsViewModel extends StatefulWidget {
  const WnrsViewModel({super.key});

  @override
  State<WnrsViewModel> createState() => WnrsViewModelState();
}

class WnrsViewModelState extends State<WnrsViewModel> {
  Prompt _prompt = Prompt.fromJson({"phrase": "", "lvl": 1});
  List<dynamic> _buffer = [];
  int _lvl = 1;

  Future changePrompt() async {
    if (_buffer.isEmpty || _prompt.lvl != _lvl) {
      final response = await http.get(Uri.parse(
          'https://59fxcxkow4.execute-api.us-east-1.amazonaws.com/dev/icebreakers/phrases?n=31&level=${_lvl}'));
      if (response.statusCode == 200) {
        setState(() {
          _prompt = Prompt.fromJson(jsonDecode(response.body)[0]);
        });
        setState(() {
          _buffer = jsonDecode(response.body)
              .skip(1)
              .map((_) => Prompt.fromJson(_))
              .toList();
        });
      } else {
        throw Exception('Failed to load new buffer');
      }
    } else {
      setState(() {
        _prompt = _buffer[0];
      });
      List newBuffer = _buffer;
      newBuffer.removeAt(0);
      setState(() {
        _buffer = newBuffer;
      });
    }
  }

  void changeLevel(int newLevel) {
    setState(() {
      _lvl = newLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("We are not really strangers")),
      ),
      body: WnrsView(
        changePrompt: changePrompt,
        changeLevel: changeLevel,
        prompt: _prompt,
        lvl: _lvl,
      ),
    );
  }
}
