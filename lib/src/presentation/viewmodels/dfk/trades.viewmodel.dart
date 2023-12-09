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
          List<TradeModel> sortedTrades =
              state.trades.where((element) => true).toList();
          sortedTrades.sort((a, b) => a.time.compareTo(b.time));
          return TradesView(
            trades: sortedTrades.reversed.toList(),
            isLoading: state.isLoading,
          );
        },
      ),
    );
  }
}
