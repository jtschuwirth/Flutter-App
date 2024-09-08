import 'package:app/src/data/models/payout.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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

    int accountsByProfession(profession) => lastPayouts.fold<int>(
        0,
        (previousValue, element) =>
            previousValue + (element.profession == profession ? 1 : 0));

    double totalAmountPayedByProfession(profession) => lastPayouts.fold<double>(
        0,
        (previousValue, element) =>
            previousValue +
            (element.profession == profession
                ? double.parse(element.amount)
                : 0));

    final double timeDelta = (lastPayouts.fold<int>(
            0,
            (previousValue, element) =>
                previousValue + int.parse(element.timeDelta))) /
        lastPayouts.length;

    double timeDeltaByProfession(profession) =>
        (lastPayouts.fold<int>(
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

    final double dailyEarningsPerAccount =
        amountPayedPerDay / lastPayouts.length;

    double dailyEarningsPerAccountByProfession(profession) =>
        amountPayedPerDayByProfession(profession) /
        accountsByProfession(profession);

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
          height: mediaSize.height * 0.19,
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
          height: mediaSize.height * 0.19,
          child: Card(
            color: Colors.blue,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Accounts Mining: ${accountsByProfession("mining")}"),
                const SizedBox(height: 5),
                Text(
                    "Total earnings: ${totalAmountPayedByProfession("mining").toStringAsFixed(3)} jewel (${(timeDeltaByProfession("mining") / (24 * 60 * 60)).toStringAsFixed(1)} days)"),
                const SizedBox(height: 5),
                Text(
                    "Daily earnings: ${amountPayedPerDayByProfession("mining").toStringAsFixed(3)} jewel"),
                const SizedBox(height: 5),
                Text(
                    "Daily earnings per account: ${dailyEarningsPerAccountByProfession("mining").toStringAsFixed(3)} jewel")
              ],
            )),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.19,
          child: Card(
            color: Colors.blue,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Accounts Gardening: ${accountsByProfession("gardening")}"),
                const SizedBox(height: 5),
                Text(
                    "Total earnings: ${totalAmountPayedByProfession("gardening").toStringAsFixed(3)} jewel (${(timeDeltaByProfession("gardening") / (24 * 60 * 60)).toStringAsFixed(1)} days)"),
                const SizedBox(height: 5),
                Text(
                    "Daily earnings: ${amountPayedPerDayByProfession("gardening").toStringAsFixed(3)} jewel"),
                const SizedBox(height: 5),
                Text(
                    "Daily earnings per account: ${dailyEarningsPerAccountByProfession("gardening").toStringAsFixed(3)} jewel")
              ],
            )),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.3,
          child: ListView.builder(
            itemCount: lastPayouts.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: mediaSize.height * 0.2,
                child: Card(
                  child: ListTile(
                      title: InkWell(
                        child: Text("Address: ${lastPayouts[index].address}"),
                        onTap: () async => await launchUrl(
                          Uri.parse(
                            'https://subnets.avax.network/defi-kingdoms/address/${lastPayouts[index].address}',
                          ),
                          mode: LaunchMode.externalApplication,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "Amount payed: ${double.parse(lastPayouts[index].amount).toStringAsFixed(2)} jewel"),
                          Text(
                              "date: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse(lastPayouts[index].time) * 1000))}"),
                          Text(
                              "time delta: ${(double.parse(lastPayouts[index].timeDelta) / (24 * 60 * 60)).toStringAsFixed(1)} days"),
                          Text("Profession: ${lastPayouts[index].profession}"),
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
