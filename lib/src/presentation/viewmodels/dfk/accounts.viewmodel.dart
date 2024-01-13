import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/views/dfk/accounts.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsViewModel extends StatefulWidget {
  const AccountsViewModel({super.key});

  @override
  State<AccountsViewModel> createState() => AccountsViewModelState();
}

class AccountsViewModelState extends State<AccountsViewModel> {
  @override
  void initState() {
    BlocProvider.of<DfkBloc>(context).add(DfkGetAccounts());
    BlocProvider.of<DfkBloc>(context).add(DfkGetTargetAccounts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("Accounts")),
      ),
      backgroundColor: const Color(0xffde4545),
      body: BlocBuilder<DfkBloc, DfkState>(
        builder: (context, state) {
          return AccountsView(
            targetAccountsMining: state.targetAccountsMining,
            targetAccountsGardening: state.targetAccountsGardening,
            accounts: state.accounts,
            isLoading: state.isLoading,
          );
        },
      ),
    );
  }
}
