import 'package:app/src/data/models/payout.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class LastFeesView extends StatelessWidget {
  final List<PayoutModel> lastFees;
  final bool isLoading;

  const LastFeesView({
    required this.lastFees,
    required this.isLoading,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final double totalAmountPayed = lastFees.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + double.parse(element.amount));

    int accountsByProfession(profession) => lastFees.fold<int>(
        0,
        (previousValue, element) =>
            previousValue + (element.profession == profession ? 1 : 0));

    double totalAmountPayedByProfession(profession) => lastFees.fold<double>(
        0,
        (previousValue, element) =>
            previousValue +
            (element.profession == profession
                ? double.parse(element.amount)
                : 0));

    final double timeDelta = (lastFees.fold<int>(
            0,
            (previousValue, element) =>
                previousValue + int.parse(element.timeDelta))) /
        lastFees.length;

    double timeDeltaByProfession(profession) =>
        (lastFees.fold<int>(
            0,
            (previousValue, element) =>
                previousValue +
                (element.profession == profession
                    ? int.parse(element.timeDelta)
                    : 0))) /
        accountsByProfession(profession);

    final double amountPayedPerDay =
        (totalAmountPayed / timeDelta) * 24 * 60 * 60;

    double amountPayedPerDayByProfession(profession) =>
        (totalAmountPayedByProfession(profession) /
            timeDeltaByProfession(profession)) *
        24 *
        60 *
        60;

    final double dailyEarningsPerAccount = amountPayedPerDay / lastFees.length;

    double dailyEarningsPerAccountByProfession(profession) =>
        amountPayedPerDayByProfession(profession) /
        accountsByProfession(profession);

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (lastFees.isEmpty) {
      return const Center(
        child: Text("No Payouts"),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: mediaSize.height * 0.19,
          child: Card(
            color: Colors.blue,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Accounts: ${lastFees.length}"),
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
          height: mediaSize.height * 0.6,
          child: ListView.builder(
            itemCount: lastFees.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: mediaSize.height * 0.2,
                child: Card(
                  child: ListTile(
                      title: InkWell(
                        child: Text("Address: ${lastFees[index].address}"),
                        onTap: () async => await launchUrl(
                          Uri.parse(
                            'https://subnets.avax.network/defi-kingdoms/address/${lastFees[index].address}',
                          ),
                          mode: LaunchMode.externalApplication,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "Amount payed: ${double.parse(lastFees[index].amount).toStringAsFixed(2)} jewel"),
                          Text(
                              "date: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse(lastFees[index].time) * 1000))}"),
                          Text(
                              "time delta: ${(double.parse(lastFees[index].timeDelta) / (24 * 60 * 60)).toStringAsFixed(1)} days)"),
                          Text("Profession: ${lastFees[index].profession}"),
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
