import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:intl/intl.dart';

class BoughtHeroesView extends StatelessWidget {
  final List<HeroBoughtModel> heroesBought;
  final List<HeroBoughtModel> heroesBoughtToday;
  final Map<String, List<HeroBoughtModel>> heroesBoughtByDay;
  final bool isLoading;
  final int totalHeroesBoughtTwoWeeks;

  const BoughtHeroesView({
    required this.heroesBought,
    required this.heroesBoughtToday,
    required this.heroesBoughtByDay,
    required this.isLoading,
    required this.totalHeroesBoughtTwoWeeks,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    Widget chartToRun() {
      LabelLayoutStrategy? xContainerLabelLayoutStrategy;
      ChartData chartData;
      ChartOptions chartOptions = const ChartOptions();
      chartData = ChartData(
        dataRows: [
          heroesBoughtByDay.keys
              .map((e) => heroesBoughtByDay[e]!.length.toDouble())
              .toList()
        ],
        dataRowsLegends: const ["Heroes Bought"],
        xUserLabels: heroesBoughtByDay.keys.toList(),
        chartOptions: chartOptions,
      );
      var lineChartContainer = LineChartTopContainer(
        chartData: chartData,
        xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
      );

      var lineChart = LineChart(
        painter: LineChartPainter(
          lineChartContainer: lineChartContainer,
        ),
      );
      return lineChart;
    }

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
        SizedBox(
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
                Text(
                    "Avg Heroes Bought per day: ${(totalHeroesBoughtTwoWeeks / heroesBoughtByDay.keys.length).toStringAsFixed(2)}"),
                const SizedBox(height: 10),
                Text(
                    "Avg Hero Bought Price: ${(heroesBought.fold<double>(0, (previousValue, element) => previousValue + double.parse(element.price)) / heroesBought.length).toStringAsFixed(2)}"),
                Text(
                    "Avg Hero Bought Today Price: ${(heroesBoughtToday.fold<double>(0, (previousValue, element) => previousValue + double.parse(element.price)) / heroesBoughtToday.length).toStringAsFixed(2)}")
              ],
            )),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.2,
          width: mediaSize.width,
          child: Card(
            color: Colors.white,
            child: chartToRun(),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.45,
          child: ListView.builder(
            itemCount: heroesBought.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: mediaSize.height * 0.1,
                child: Card(
                  child: ListTile(
                      title: Text(
                          "date: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse(heroesBought[index].time) * 1000))}"),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("price: ${heroesBought[index].price}"),
                          Text("Hero Id: ${heroesBought[index].heroId}"),
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
