import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final void Function(BuildContext context) onGoToWnrs;
  final void Function(BuildContext context) onGoToNhie;
  const HomeView(
      {required this.onGoToWnrs, required this.onGoToNhie, super.key})
      : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToWnrs(context),
            child: const Text("We are not really strangers"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToNhie(context),
            child: const Text("Never have i ever"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
