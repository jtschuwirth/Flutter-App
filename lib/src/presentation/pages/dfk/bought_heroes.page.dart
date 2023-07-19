import 'package:app/src/presentation/viewmodels/dfk/bought_heroes.viewmodel.dart';
import 'package:flutter/material.dart';

class BoughtHeroesPage extends StatelessWidget {
  static String pathName = '/dfk/bought_heroes';
  const BoughtHeroesPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const BoughtHeroesViewModel();
  }
}
