import 'package:flutter/material.dart';

class MainDfkView extends StatelessWidget {
  final void Function(BuildContext context) onGoToBoughtHeroes;
  final void Function(BuildContext context) onGoToPayouts;
  final void Function(BuildContext context) onGoToTrackingData;
  final void Function(BuildContext context) onGoToAccounts;
  const MainDfkView({
    required this.onGoToBoughtHeroes,
    required this.onGoToPayouts,
    required this.onGoToTrackingData,
    required this.onGoToAccounts,
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
            onPressed: () => onGoToPayouts(context),
            child: const Text("Payouts"),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToTrackingData(context),
            child: const Text("Tracking Data"),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToAccounts(context),
            child: const Text("Accounts"),
          ),
        ),
      ],
    );
  }
}
