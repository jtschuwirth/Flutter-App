import 'package:app/src/presentation/viewmodels/home.viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String pathName = '/';
  const HomePage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const HomeViewModel();
  }
}
