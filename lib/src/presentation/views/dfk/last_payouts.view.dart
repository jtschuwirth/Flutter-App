import 'package:app/src/data/models/payout.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastPayoutsView extends StatelessWidget {
  final List<PayoutModel> lastPayouts;
  final bool isLoading;

  const LastPayoutsView({
    required this.lastPayouts,
    required this.isLoading,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final double totalAmountPayed = lastPayouts.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + double.parse(element.amount));

    final double timeDelta = (lastPayouts.fold<int>(
            0,
            (previousValue, element) =>
                previousValue + int.parse(element.timeDelta))) /
        lastPayouts.length;

    final double amountPayedPerDay =
        (totalAmountPayed / timeDelta) * 24 * 60 * 60;

    final double dailyEarningsPerAccount =
        amountPayedPerDay / lastPayouts.length;
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (lastPayouts.isEmpty) {
      return const Center(
        child: Text("No Payouts"),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: mediaSize.height * 0.2,
          child: Card(
            color: Colors.blue,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Accounts: ${lastPayouts.length}"),
                const SizedBox(height: 5),
                Text(
                    "Total earnings: ${totalAmountPayed.toStringAsFixed(3)} jewel (${(timeDelta / (24 * 60 * 60)).toStringAsFixed(1)} days)"),
                const SizedBox(height: 5),
                Text(
                    "Daily earnings: ${amountPayedPerDay.toStringAsFixed(3)} jewel"),
                const SizedBox(height: 5),
                Text(
                    "Daily earnings per account: ${dailyEarningsPerAccount.toStringAsFixed(3)} jewel")
              ],
            )),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.65,
          child: ListView.builder(
            itemCount: lastPayouts.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: mediaSize.height * 0.13,
                child: Card(
                  child: ListTile(
                      title: Text("Address: ${lastPayouts[index].address}"),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "Amount payed: ${double.parse(lastPayouts[index].amount).toStringAsFixed(2)} jewel"),
                          Text(
                              "date: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse(lastPayouts[index].time) * 1000))}"),
                          Text(
                              "time delta: ${(double.parse(lastPayouts[index].timeDelta) / (24 * 60 * 60)).toStringAsFixed(1)} days)"),
                        ],
                      )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
