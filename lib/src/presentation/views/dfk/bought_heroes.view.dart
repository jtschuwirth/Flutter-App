import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BoughtHeroesView extends StatelessWidget {
  final List<HeroBoughtModel> heroesBought;
  final List<HeroBoughtModel> heroesBoughtToday;
  final bool isLoading;

  const BoughtHeroesView({
    required this.heroesBought,
    required this.heroesBoughtToday,
    required this.isLoading,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (heroesBought.isEmpty) {
      return const Center(
        child: Text("No Heroes bought"),
      );
    }
    return Column(
      children: [
        Container(
          height: mediaSize.height * 0.2,
          child: Card(
            color: Colors.blue,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total Heroes Bought: ${heroesBought.length}"),
                Text("Heroes Bought Today: ${heroesBoughtToday.length}"),
                const SizedBox(height: 10),
                Text(
                    "Avg Hero Bought Price: ${(heroesBought.fold<double>(0, (previousValue, element) => previousValue + double.parse(element.price)) / heroesBought.length).toStringAsFixed(2)}"),
                Text(
                    "Avg Hero Bought Today Price: ${(heroesBoughtToday.fold<double>(0, (previousValue, element) => previousValue + double.parse(element.price)) / heroesBoughtToday.length).toStringAsFixed(2)}")
              ],
            )),
          ),
        ),
        Container(
          height: mediaSize.height * 0.7,
          child: ListView.builder(
            itemCount: heroesBought.length,
            itemBuilder: (context, index) {
              return Container(
                height: mediaSize.height * 0.1,
                child: Card(
                  child: ListTile(
                      title: Text("Hero Id: ${heroesBought[index].heroId}"),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("price: ${heroesBought[index].price}"),
                          Text(
                              "date: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse(heroesBought[index].time) * 1000))}"),
                        ],
                      )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
