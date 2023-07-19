import 'package:app/src/presentation/viewmodels/dfk/main_dfk.viewmodel.dart';
import 'package:flutter/material.dart';

class MainDfkPage extends StatelessWidget {
  static String pathName = '/dfk';
  const MainDfkPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const MainDfkViewModel();
  }
}
