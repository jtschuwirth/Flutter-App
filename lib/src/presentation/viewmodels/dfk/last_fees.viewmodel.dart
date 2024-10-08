import 'package:app/src/data/models/payout.model.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/views/dfk/last_fees.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastFeesViewModel extends StatefulWidget {
  const LastFeesViewModel({super.key});

  @override
  State<LastFeesViewModel> createState() => LastFeesViewModelState();
}

class LastFeesViewModelState extends State<LastFeesViewModel> {
  @override
  void initState() {
    BlocProvider.of<DfkBloc>(context).add(DfkGetLastFees());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("Payouts")),
      ),
      backgroundColor: const Color(0xffde4545),
      body: BlocBuilder<DfkBloc, DfkState>(
        builder: (context, state) {
          List<PayoutModel> sortedFees =
              state.lastFees.where((element) => true).toList();
          sortedFees.sort((a, b) => a.time.compareTo(b.time));
          return LastFeesView(
            lastFees: sortedFees.reversed.toList(),
            isLoading: state.isLoading,
          );
        },
      ),
    );
  }
}
