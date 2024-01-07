import 'package:app/src/data/models/trade.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TradesView extends StatelessWidget {
  final List<TradeModel> trades;
  final bool isLoading;

  const TradesView({
    required this.trades,
    required this.isLoading,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final double totalProfit = trades.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + double.parse(element.realProfit));

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (trades.isEmpty) {
      return const Center(
        child: Text("No Trades"),
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
                Text("Total earnings: $totalProfit jewel"),
                const SizedBox(height: 5),
              ],
            )),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.65,
          child: ListView.builder(
            itemCount: trades.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: mediaSize.height * 0.19,
                child: Card(
                  child: ListTile(
                      title: Text(
                          "date: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse(trades[index].time) * 1000))}"),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("item: ${trades[index].item}"),
                          Text("amount: ${trades[index].amount}"),
                          Text(
                              "real_profit: ${double.parse(trades[index].realProfit).toStringAsFixed(2)} jewel"),
                          Text("Strategy: ${trades[index].strategy}"),
                          Text("Model: ${trades[index].model}")
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
