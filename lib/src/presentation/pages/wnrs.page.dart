import 'package:app/src/presentation/viewmodels/wnrs.viewmodel.dart';
import 'package:flutter/material.dart';

class WnrsPage extends StatelessWidget {
  static String pathName = '/wnrs';
  const WnrsPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const WnrsViewModel();
  }
}
