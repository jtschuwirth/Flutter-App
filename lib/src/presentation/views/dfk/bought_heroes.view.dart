
import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BoughtHeroesView extends StatelessWidget {
  final List<HeroBoughtModel> heroesBought;
  final bool isLoading;

  const BoughtHeroesView({
    required this.heroesBought,
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
    return ListView.builder(
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
    );
  }
}
