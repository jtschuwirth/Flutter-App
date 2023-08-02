
import 'package:app/src/data/models/tracking_data.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:intl/intl.dart';

class TrackingDataView extends StatelessWidget {
  final List<TrackingDataModel> trackingData;
  final Map<String, Map<String, double>> trackingDataByDay;
  final bool isLoading;

  const TrackingDataView({
    required this.trackingData,
    required this.trackingDataByDay,
    required this.isLoading,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;

    Widget chartToRun() {
      LabelLayoutStrategy? xContainerLabelLayoutStrategy;
      ChartData chartData;
      ChartOptions chartOptions = const ChartOptions();
      chartData = ChartData(
        dataRows: [
          trackingDataByDay.keys
              .map((e) =>
                  trackingDataByDay[e]!["dailyRealAvgProfit"]! /
                  trackingDataByDay[e]!["dataPoints"]!)
              .toList(),
          trackingDataByDay.keys
              .map((e) =>
                  trackingDataByDay[e]!["dailyExpectedAvgProfit"]! /
                  trackingDataByDay[e]!["dataPoints"]!)
              .toList(),
        ],
        dataRowsLegends: const ["Real Profit", "Expected Profit"],
        xUserLabels: trackingDataByDay.keys.toList(),
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

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (trackingData.isEmpty) {
      return const Center(
        child: Text("No tracking data"),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: mediaSize.height * 0.2,
          width: mediaSize.width,
          child: Card(
            color: Colors.white,
            child: chartToRun(),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.7,
          child: ListView.builder(
            itemCount: trackingData.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: mediaSize.height * 0.15,
                child: Card(
                  child: ListTile(
                      title: Text(
                          "date: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse(trackingData[index].time) * 1000))}"),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "Daily avg earnings: ${double.parse(trackingData[index].dailyAvgEarning).toStringAsFixed(2)} jewel"),
                          Text(
                              "Daily avg gas cost: ${double.parse(trackingData[index].dailyAvgGasCost).toStringAsFixed(2)} jewel"),
                          Text(
                              "Daily avg expected profit: ${double.parse(trackingData[index].dailyExpectedAvgProfit).toStringAsFixed(2)} jewel"),
                          Text(
                              "Daily avg real profit: ${double.parse(trackingData[index].dailyRealAvgProfit).toStringAsFixed(2)} jewel"),
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
