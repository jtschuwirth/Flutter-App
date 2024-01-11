import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/pages/dfk/accounts.page.dart';
import 'package:app/src/presentation/pages/dfk/bought_heroes.page.dart';
import 'package:app/src/presentation/pages/dfk/last_payouts.page.dart';
import 'package:app/src/presentation/pages/dfk/tracking_data.page.dart';
import 'package:app/src/presentation/pages/dfk/trades.page.dart';
import 'package:app/src/presentation/views/dfk/main_dfk.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainDfkViewModel extends StatefulWidget {
  const MainDfkViewModel({super.key});

  @override
  State<MainDfkViewModel> createState() => MainDfkViewModelState();
}

class MainDfkViewModelState extends State<MainDfkViewModel> {
  void _onGoToBoughtHeroes(context, profession) {
    GoRouter.of(context).push(BoughtHeroesPage.pathName, extra: profession);
  }

  void _onGoToPayouts(context) {
    GoRouter.of(context).push(LastPayoutsPage.pathName);
  }

  void _onGoToTrackingData(context, profession) {
    GoRouter.of(context).push(TrackingDataPage.pathName, extra: profession);
  }

  void _onGoToAccounts(context) {
    GoRouter.of(context).push(AccountsPage.pathName);
  }

  void _onGoToTrades(context) {
    GoRouter.of(context).push(TradesPage.pathName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("Defi Kingdoms Main View")),
      ),
      backgroundColor: const Color(0xffde4545),
      body: BlocBuilder<DfkBloc, DfkState>(
        builder: (context, state) {
          return MainDfkView(
            onGoToBoughtHeroes: _onGoToBoughtHeroes,
            onGoToPayouts: _onGoToPayouts,
            onGoToTrackingData: _onGoToTrackingData,
            onGoToAccounts: _onGoToAccounts,
            onGoToTrades: _onGoToTrades,
          );
        },
      ),
    );
  }
}
