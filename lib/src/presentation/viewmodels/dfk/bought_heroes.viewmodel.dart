import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/views/dfk/bought_heroes.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BoughtHeroesViewModel extends StatefulWidget {
  final String profession;
  const BoughtHeroesViewModel({super.key, required this.profession});

  @override
  State<BoughtHeroesViewModel> createState() => BoughtHeroesViewModelState();
}

class BoughtHeroesViewModelState extends State<BoughtHeroesViewModel> {
  @override
  void initState() {
    BlocProvider.of<DfkBloc>(context)
        .add(DfkGetHeroesBought(profession: widget.profession));
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

          int totalHeroesBoughtTwoWeeks = 0;
          final List<HeroBoughtModel> twoWeekData = state.heroesBought
              .where((element) =>
                  DateTime.fromMillisecondsSinceEpoch(
                          int.parse(element.time) * 1000)
                      .compareTo(
                          DateTime.now().subtract(const Duration(days: 14))) >=
                  0)
              .toList();

          final Map<String, List<HeroBoughtModel>> heroesBoughtByDay = {};
          for (final heroBought in twoWeekData) {
            final String day = DateFormat("dd/MM").format(
                DateTime.fromMillisecondsSinceEpoch(
                    int.parse(heroBought.time) * 1000));
            if (heroesBoughtByDay.containsKey(day)) {
              heroesBoughtByDay[day]!.add(heroBought);
            } else {
              heroesBoughtByDay[day] = [heroBought];
            }
            totalHeroesBoughtTwoWeeks++;
          }

          return BoughtHeroesView(
            heroesBought: sortedHeroesBought.reversed.toList(),
            heroesBoughtToday:
                heroesBoughtByDay[DateFormat("dd/MM").format(DateTime.now())] ??
                    [],
            heroesBoughtByDay: heroesBoughtByDay,
            totalHeroesBoughtTwoWeeks: totalHeroesBoughtTwoWeeks,
            isLoading: state.isLoading,
          );
        },
      ),
    );
  }
}
