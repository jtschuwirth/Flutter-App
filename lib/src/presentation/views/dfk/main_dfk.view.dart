import 'package:flutter/material.dart';

class MainDfkView extends StatelessWidget {
  final void Function(BuildContext context, String profession)
      onGoToBoughtHeroes;
  final void Function(BuildContext context) onGoToPayouts;
  final void Function(BuildContext context, String profession)
      onGoToTrackingData;
  final void Function(BuildContext context) onGoToAccounts;
  final void Function(BuildContext context) onGoToTrades;
  const MainDfkView({
    required this.onGoToBoughtHeroes,
    required this.onGoToPayouts,
    required this.onGoToTrackingData,
    required this.onGoToAccounts,
    required this.onGoToTrades,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToBoughtHeroes(context, "mining"),
            child: const Text("Bought Heroes Mining"),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToBoughtHeroes(context, "gardening"),
            child: const Text("Bought Heroes Gardening"),
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
            onPressed: () => onGoToTrackingData(context, "mining"),
            child: const Text("Tracking Data Mining"),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToTrackingData(context, "gardening"),
            child: const Text("Tracking Data Gardening"),
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
        Center(
          child: ElevatedButton(
            onPressed: () => onGoToTrades(context),
            child: const Text("Trades"),
          ),
        ),
      ],
    );
  }
}
