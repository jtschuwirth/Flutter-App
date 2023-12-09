class TrackingDataModel {
  String time;
  String dailyAvgEarning;
  String dailyAvgGasCost;
  String dailyExpectedAvgProfit;
  String dailyRealAvgProfit;
  String averageGasPrice;
  String uptime;

  TrackingDataModel({
    required this.time,
    required this.dailyAvgEarning,
    required this.dailyAvgGasCost,
    required this.dailyExpectedAvgProfit,
    required this.dailyRealAvgProfit,
    required this.averageGasPrice,
    required this.uptime,
  });

  factory TrackingDataModel.fromJson(Map<String, dynamic> json) {
    return TrackingDataModel(
      time: json['time_'],
      dailyAvgEarning: json['daily_avg_earnings'] ?? "0.0",
      dailyAvgGasCost: json['daily_avg_gas_cost'] ?? "0.0",
      dailyExpectedAvgProfit: json['daily_expected_avg_profit'] ?? "0.0",
      dailyRealAvgProfit: json['daily_real_avg_profit'] ?? "0.0",
      averageGasPrice: json['avg_gas_price'] ?? "0.0",
      uptime: json['uptime'] ?? "0.0",
    );
  }
}
