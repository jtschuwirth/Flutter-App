import 'package:app/src/presentation/viewmodels/dfk/tracking_data.viewmodel.dart';
import 'package:flutter/material.dart';

class TrackingDataPage extends StatelessWidget {
  static String pathName = '/dfk/tracking_data';
  const TrackingDataPage({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return const TrackingDataViewModel();
  }
}
