import 'package:app/src/data/const/const.dart';
import 'package:app/src/data/models/payout.model.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/views/dfk/last_payouts.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastPayoutsViewModel extends StatefulWidget {
  const LastPayoutsViewModel({super.key});

  @override
  State<LastPayoutsViewModel> createState() => LastPayoutsViewModelState();
}

class LastPayoutsViewModelState extends State<LastPayoutsViewModel> {
  @override
  void initState() {
    BlocProvider.of<DfkBloc>(context)
        .add(DfkGetLastPayouts(managerAddress: managerAddress));
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
          List<PayoutModel> sortedPayouts =
              state.lastPayouts.where((element) => true).toList();
          sortedPayouts.sort((a, b) => a.time.compareTo(b.time));
          return LastPayoutsView(
            lastPayouts: sortedPayouts.reversed.toList(),
            isLoading: state.isLoading,
          );
        },
      ),
    );
  }
}
