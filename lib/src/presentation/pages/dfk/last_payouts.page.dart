import 'package:app/src/presentation/viewmodels/dfk/last_payouts.viewmodel.dart';
import 'package:flutter/material.dart';

class LastPayoutsPage extends StatelessWidget {
  static String pathName = '/dfk/last_payouts';
  const LastPayoutsPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const LastPayoutsViewModel();
  }
}
