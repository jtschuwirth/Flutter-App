import 'package:app/src/data/const/const.dart';
import 'package:flutter/material.dart';

class MainDfkView extends StatelessWidget {
  final void Function(BuildContext context, String profession)
      onGoToBoughtHeroes;
  final void Function(BuildContext context) onGoToPayouts;
  final void Function(BuildContext context) onGoToFees;
  final void Function(BuildContext context, String profession)
      onGoToTrackingData;
  final void Function(BuildContext context) onGoToAccounts;
  final void Function(BuildContext context) onGoToTrades;
  final void Function(String selectedAddress) onChangeSelectedUser;
  final String selectedAddress;

  const MainDfkView({
    required this.onGoToBoughtHeroes,
    required this.onGoToPayouts,
    required this.onGoToFees,
    required this.onGoToTrackingData,
    required this.onGoToAccounts,
    required this.onGoToTrades,
    required this.onChangeSelectedUser,
    required this.selectedAddress,
    super.key,
  }) : super();

  Widget button({required String text, required VoidCallback onPressed}) {
    return SizedBox(
        width: 250,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: DropdownButton<String>(
            value: selectedAddress,
            onChanged: (String? newValue) {},
            items: <String>[...users]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                onTap: () {
                  onChangeSelectedUser(value);
                },
                value: value,
                child: Text(value.substring(0, 4) +
                    "..." +
                    value.substring(value.length - 4)),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 5),
        button(
          onPressed: () => onGoToBoughtHeroes(context, "mining"),
          text: "Bought Heroes Mining",
        ),
        const SizedBox(height: 5),
        button(
          onPressed: () => onGoToBoughtHeroes(context, "gardening"),
          text: "Bought Heroes Gardening",
        ),
        const SizedBox(height: 5),
        button(
          onPressed: () => onGoToPayouts(context),
          text: "Payouts",
        ),
        const SizedBox(height: 5),
        button(
          onPressed: () => onGoToFees(context),
          text: "Fees",
        ),
        const SizedBox(height: 5),
        button(
          onPressed: () => onGoToTrackingData(context, "mining"),
          text: "Tracking Data Mining",
        ),
        const SizedBox(height: 5),
        button(
          onPressed: () => onGoToTrackingData(context, "gardening"),
          text: "Tracking Data Gardening",
        ),
        const SizedBox(height: 5),
        button(
          onPressed: () => onGoToAccounts(context),
          text: "Accounts",
        ),
        const SizedBox(height: 5),
        button(
          onPressed: () => onGoToTrades(context),
          text: "Trades",
        ),
      ],
    );
  }
}
