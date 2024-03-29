import 'package:flutter/material.dart';
import 'package:app/src/data/models/prompt.model.dart';

class WnrsView extends StatelessWidget {
  final void Function() changePrompt;
  final void Function(int newLevel) changeLevel;
  final Prompt prompt;
  final int lvl;

  const WnrsView(
      {required this.changePrompt,
      required this.changeLevel,
      required this.prompt,
      required this.lvl,
      super.key})
      : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    return Center(
        child: Column(children: [
      const SizedBox(width: 0, height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: 100.0,
          child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: lvl == 1
                    ? MaterialStateProperty.all<Color>(Colors.purple)
                    : MaterialStateProperty.all<Color>(Colors.blue)),
            onPressed: () {
              changeLevel(1);
            },
            child: const Text('1'),
          ),
        ),
        const SizedBox(width: 10, height: 0),
        SizedBox(
          width: 100.0,
          child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: lvl == 2
                    ? MaterialStateProperty.all<Color>(Colors.purple)
                    : MaterialStateProperty.all<Color>(Colors.blue)),
            onPressed: () {
              changeLevel(2);
            },
            child: const Text('2'),
          ),
        ),
        const SizedBox(width: 10, height: 0),
        SizedBox(
          width: 100.0,
          child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: lvl == 3
                    ? MaterialStateProperty.all<Color>(Colors.purple)
                    : MaterialStateProperty.all<Color>(Colors.blue)),
            onPressed: () {
              changeLevel(3);
            },
            child: const Text('3'),
          ),
        ),
      ]),
      const SizedBox(width: 0, height: 50),
      Container(
        width: mediaSize.width * 0.9,
        height: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            border: Border.all(width: 0.1)),
        child: Card(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(
                    child: Text(prompt.phrase, textAlign: TextAlign.center)))),
      ),
      const SizedBox(width: 0, height: 50),
      ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          changePrompt();
        },
        child: const Text('New prompt'),
      ),
      const SizedBox(
        height: 60,
      ),
    ]));
  }
}
