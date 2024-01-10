import 'package:app/src/data/models/trade.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TradesView extends StatelessWidget {
  final List<TradeModel> trades;
  final double dailyAvgProfit;
  final double totalProfit;
  final double lastDayProfit;
  final bool isLoading;

  const TradesView({
    required this.trades,
    required this.totalProfit,
    required this.lastDayProfit,
    required this.dailyAvgProfit,
    required this.isLoading,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;

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
                Text("earnings last 24 hours: $lastDayProfit jewel"),
                const SizedBox(height: 5),
                Text("average earnings per day: $dailyAvgProfit jewel"),
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
                height: mediaSize.height * 0.22,
                child: Card(
                  child: ListTile(
                      title: Text(
                          "date: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse(trades[index].time) * 1000))}"),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("item: ${trades[index].item}"),
                          Text("amount: ${trades[index].amount}"),
                          Text("price: ${trades[index].price}"),
                          Text(
                              "expected_profit: ${trades[index].expectedProfit}"),
                          Text("operation: ${trades[index].operation}"),
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
