import 'package:app/src/presentation/viewmodels/dfk/trades.viewmodel.dart';
import 'package:flutter/material.dart';

class TradesPage extends StatelessWidget {
  static String pathName = '/dfk/trades';
  const TradesPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const TradesViewModel();
  }
}
