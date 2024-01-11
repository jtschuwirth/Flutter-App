import 'package:app/src/data/models/tracking_data.model.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/views/dfk/tracking_data.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TrackingDataViewModel extends StatefulWidget {
  final String profession;
  const TrackingDataViewModel({
    required this.profession,
    super.key,
  });

  @override
  State<TrackingDataViewModel> createState() => TrackingDataViewModelState();
}

class TrackingDataViewModelState extends State<TrackingDataViewModel> {
  @override
  void initState() {
    BlocProvider.of<DfkBloc>(context).add(const DfkGetTrackingData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("Tracking Data")),
      ),
      backgroundColor: const Color(0xffde4545),
      body: BlocBuilder<DfkBloc, DfkState>(
        builder: (context, state) {
          final List<TrackingDataModel> twoWeekData = state.trackingData
              .where((element) =>
                  DateTime.fromMillisecondsSinceEpoch(
                          int.parse(element.time) * 1000)
                      .compareTo(
                          DateTime.now().subtract(const Duration(days: 14))) >=
                  0)
              .toList();
          final Map<String, Map<String, double>> trakingDataByDay = {};
          for (final trackingData in twoWeekData) {
            final String day = DateFormat("dd/MM").format(
                DateTime.fromMillisecondsSinceEpoch(
                    int.parse(trackingData.time) * 1000));
            if (trakingDataByDay.containsKey(day)) {
              trakingDataByDay[day]!["dailyRealAvgProfit"] =
                  trakingDataByDay[day]!["dailyRealAvgProfit"]! +
                      double.parse(widget.profession == "mining"
                          ? trackingData.dailyRealAvgMiningProfit
                          : trackingData.dailyRealAvgGardeningProfit);

              trakingDataByDay[day]!["dailyExpectedAvgProfit"] =
                  trakingDataByDay[day]!["dailyExpectedAvgProfit"]! +
                      double.parse(widget.profession == "mining"
                          ? trackingData.dailyExpectedAvgMiningProfit
                          : trackingData.dailyExpectedAvgGardeningProfit);

              trakingDataByDay[day]!["dailyAvgGasCost"] =
                  trakingDataByDay[day]!["dailyAvgGasCost"]! +
                      double.parse(widget.profession == "mining"
                          ? trackingData.dailyAvgMiningGasCost
                          : trackingData.dailyAvgGardeningGasCost);

              trakingDataByDay[day]!["uptime"] =
                  trakingDataByDay[day]!["uptime"]! +
                      double.parse(trackingData.uptime);

              trakingDataByDay[day]!["dataPoints"] =
                  trakingDataByDay[day]!["dataPoints"]! + 1;
            } else {
              trakingDataByDay[day] = {
                "dailyRealAvgProfit": double.parse(widget.profession == "mining"
                    ? trackingData.dailyRealAvgMiningProfit
                    : trackingData.dailyRealAvgGardeningProfit),
                "dailyExpectedAvgProfit": double.parse(
                    widget.profession == "mining"
                        ? trackingData.dailyExpectedAvgMiningProfit
                        : trackingData.dailyExpectedAvgGardeningProfit),
                "dailyAvgGasCost": double.parse(widget.profession == "mining"
                    ? trackingData.dailyAvgMiningGasCost
                    : trackingData.dailyAvgGardeningGasCost),
                "uptime": double.parse(trackingData.uptime),
                "dataPoints": 1
              };
            }
          }

          List<TrackingDataModel> sortedData =
              state.trackingData.where((element) => true).toList();
          sortedData.sort((a, b) => a.time.compareTo(b.time));

          return TrackingDataView(
            trackingData: sortedData.reversed.toList(),
            trackingDataByDay: trakingDataByDay,
            profession: widget.profession,
            isLoading: state.isLoading,
          );
        },
      ),
    );
  }
}
