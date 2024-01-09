import 'package:app/src/presentation/viewmodels/dfk/bought_heroes.viewmodel.dart';
import 'package:flutter/material.dart';

class BoughtHeroesPage extends StatelessWidget {
  static String pathName = '/dfk/bought_heroes';
  final String profession;

  const BoughtHeroesPage({super.key, required this.profession}) : super();

  @override
  Widget build(BuildContext context) {
    return BoughtHeroesViewModel(profession: profession);
  }
}
