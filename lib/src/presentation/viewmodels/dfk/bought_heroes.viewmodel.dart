import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/views/dfk/bought_heroes.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoughtHeroesViewModel extends StatefulWidget {
  const BoughtHeroesViewModel({super.key});

  @override
  State<BoughtHeroesViewModel> createState() => BoughtHeroesViewModelState();
}

class BoughtHeroesViewModelState extends State<BoughtHeroesViewModel> {
  @override
  void initState() {
    BlocProvider.of<DfkBloc>(context).add(const DfkGetHeroesBought());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("Bought Heroes")),
      ),
      backgroundColor: const Color(0xffde4545),
      body: BlocBuilder<DfkBloc, DfkState>(
        builder: (context, state) {
          List<HeroBoughtModel> sortedHeroesBought =
              state.heroesBought.where((element) => true).toList();
          sortedHeroesBought.sort((a, b) => a.time.compareTo(b.time));
          return BoughtHeroesView(
            heroesBought: sortedHeroesBought.reversed.toList(),
            isLoading: state.isLoading,
          );
        },
      ),
    );
  }
}
