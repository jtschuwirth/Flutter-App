import 'package:app/src/data/models/trade.model.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/views/dfk/trades.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TradesViewModel extends StatefulWidget {
  const TradesViewModel({super.key});

  @override
  State<TradesViewModel> createState() => TradesViewModelState();
}

class TradesViewModelState extends State<TradesViewModel> {
  @override
  void initState() {
    BlocProvider.of<DfkBloc>(context).add(const DfkGetTrades());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("Trades")),
      ),
      backgroundColor: const Color(0xffde4545),
      body: BlocBuilder<DfkBloc, DfkState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.trades.isEmpty) {
            return const Center(
              child: Text("No Trades"),
            );
          }

          List<TradeModel> sortedTrades =
              state.trades.where((element) => true).toList();
          sortedTrades.sort((a, b) => a.time.compareTo(b.time));

          List<TradeModel> lastDayTrades = sortedTrades
              .where((element) => DateTime.fromMillisecondsSinceEpoch(
                      int.parse(element.time) * 1000)
                  .isAfter(DateTime.now().subtract(const Duration(days: 1))))
              .toList();

          double totalProfit = sortedTrades.fold(0.0, (previousValue, element) {
            if (element.operation == "buy") {
              return previousValue - double.parse(element.price);
            } else {
              return previousValue + double.parse(element.price);
            }
          });

          double lastDayProfit =
              lastDayTrades.fold(0.0, (previousValue, element) {
            if (element.operation == "buy") {
              return previousValue - double.parse(element.price);
            } else {
              return previousValue + double.parse(element.price);
            }
          });

          double dailyAvgProfit = totalProfit /
              (DateTime.now()
                  .difference(DateTime.fromMillisecondsSinceEpoch(
                      int.parse(sortedTrades.first.time) * 1000))
                  .inDays);

          return TradesView(
            trades: sortedTrades.reversed.toList(),
            dailyAvgProfit: dailyAvgProfit,
            totalProfit: totalProfit,
            lastDayProfit: lastDayProfit,
            isLoading: state.isLoading,
          );
        },
      ),
    );
  }
}
