import 'package:app/src/data/models/tracking_data.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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

    List<LineSeries<MapEntry<String, double>, String>> generateLineSeries() {
      return [
        LineSeries<MapEntry<String, double>, String>(
          dataSource: trackingDataByDay.entries
              .map((e) => MapEntry(e.key,
                  e.value["dailyRealAvgProfit"]! / e.value["dataPoints"]!))
              .toList(),
          xValueMapper: (MapEntry<String, double> entry, _) => entry.key,
          yValueMapper: (MapEntry<String, double> entry, _) => entry.value,
          name: "Real Profit",
          markerSettings: const MarkerSettings(isVisible: true),
        ),
        LineSeries<MapEntry<String, double>, String>(
          dataSource: trackingDataByDay.entries
              .map((e) => MapEntry(e.key,
                  e.value["dailyExpectedAvgProfit"]! / e.value["dataPoints"]!))
              .toList(),
          xValueMapper: (MapEntry<String, double> entry, _) => entry.key,
          yValueMapper: (MapEntry<String, double> entry, _) => entry.value,
          name: "Expected Profit",
          markerSettings: const MarkerSettings(isVisible: true),
        ),
        LineSeries<MapEntry<String, double>, String>(
          dataSource: trackingDataByDay.entries
              .map((e) => MapEntry(
                  e.key, e.value["dailyAvgGasCost"]! / e.value["dataPoints"]!))
              .toList(),
          xValueMapper: (MapEntry<String, double> entry, _) => entry.key,
          yValueMapper: (MapEntry<String, double> entry, _) => entry.value,
          name: "Gas Cost",
          markerSettings: const MarkerSettings(isVisible: true),
        ),
        LineSeries<MapEntry<String, double>, String>(
          dataSource: trackingDataByDay.entries
              .map((e) =>
                  MapEntry(e.key, e.value["uptime"]! / e.value["dataPoints"]!))
              .toList(),
          xValueMapper: (MapEntry<String, double> entry, _) => entry.key,
          yValueMapper: (MapEntry<String, double> entry, _) => entry.value,
          name: "Uptime",
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ];
    }

    Widget lineChart(BuildContext context) {
      return SfCartesianChart(
        title: ChartTitle(text: 'Tracking Data Chart'),
        series: generateLineSeries(),
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Date')),
        primaryYAxis: NumericAxis(title: AxisTitle(text: 'Value')),
      );
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
          height: mediaSize.height * 0.5,
          width: mediaSize.width,
          child: Card(
            color: Colors.white,
            child: lineChart(context),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.39,
          child: ListView.builder(
            itemCount: trackingData.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: mediaSize.height * 0.2,
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
                          Text(
                              "Current gas price: ${double.parse(trackingData[index].averageGasPrice).toStringAsFixed(2)} gwei"),
                          Text(
                              "uptime: ${double.parse(trackingData[index].uptime) * 100}%"),
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
