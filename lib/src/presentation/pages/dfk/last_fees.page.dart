import 'package:app/src/presentation/viewmodels/dfk/last_fees.viewmodel.dart';
import 'package:flutter/material.dart';

class LastFeesPage extends StatelessWidget {
  static String pathName = '/dfk/last_fees';
  const LastFeesPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const LastFeesViewModel();
  }
}
