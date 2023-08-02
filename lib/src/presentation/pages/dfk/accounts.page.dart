import 'package:app/src/presentation/viewmodels/dfk/accounts.viewmodel.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  static String pathName = '/dfk/accounts';
  const AccountsPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const AccountsViewModel();
  }
}
