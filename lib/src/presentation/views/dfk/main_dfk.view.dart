import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainDfkView extends StatelessWidget {
  final void Function(BuildContext context) onGoToBoughtHeroes;
  const MainDfkView({
    required this.onGoToBoughtHeroes,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToBoughtHeroes(context),
            child: const Text("Bought Heroes"),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToBoughtHeroes(context),
            child: const Text("Autoplayer Tracking"),
          ),
        ),
      ],
    );
  }
}
