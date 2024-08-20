class TrackingDataModel {
  String time;
  String uptime;
  String uptimeMining;
  String uptimeGardening;

  String dailyAvgMiningEarning;
  String dailyAvgMiningGasCost;
  String dailyExpectedAvgMiningProfit;
  String dailyRealAvgMiningProfit;
  String averageMiningGasPrice;

  String dailyAvgGardeningEarning;
  String dailyAvgGardeningGasCost;
  String dailyExpectedAvgGardeningProfit;
  String dailyRealAvgGardeningProfit;
  String averageGardeningGasPrice;

  TrackingDataModel({
    required this.time,
    required this.uptime,
    required this.uptimeMining,
    required this.uptimeGardening,
    required this.dailyAvgMiningEarning,
    required this.dailyAvgMiningGasCost,
    required this.dailyExpectedAvgMiningProfit,
    required this.dailyRealAvgMiningProfit,
    required this.averageMiningGasPrice,
    required this.dailyAvgGardeningEarning,
    required this.dailyAvgGardeningGasCost,
    required this.dailyExpectedAvgGardeningProfit,
    required this.dailyRealAvgGardeningProfit,
    required this.averageGardeningGasPrice,
  });

  factory TrackingDataModel.fromJson(Map<String, dynamic> json) {
    return TrackingDataModel(
      time: json['time_'],
      uptime: json['uptime'] ?? "0.0",
      uptimeMining: json['uptime_mining'] ?? "0.0",
      uptimeGardening: json['uptime_gardening'] ?? "0.0",
      dailyAvgMiningEarning: json['daily_avg_mining_earnings'] ?? "0.0",
      dailyAvgMiningGasCost: json['daily_avg_mining_gas_cost'] ?? "0.0",
      dailyExpectedAvgMiningProfit:
          json['daily_expected_avg_mining_profit'] ?? "0.0",
      dailyRealAvgMiningProfit: json['daily_real_avg_mining_profit'] ?? "0.0",
      averageMiningGasPrice: json['avg_mining_gas_price'] ?? "0.0",
      dailyAvgGardeningEarning: json['daily_avg_gardening_earnings'] ?? "0.0",
      dailyAvgGardeningGasCost: json['daily_avg_gardening_gas_cost'] ?? "0.0",
      dailyExpectedAvgGardeningProfit:
          json['daily_expected_avg_gardening_profit'] ?? "0.0",
      dailyRealAvgGardeningProfit:
          json['daily_real_avg_gardening_profit'] ?? "0.0",
      averageGardeningGasPrice: json['avg_gardening_gas_price'] ?? "0.0",
    );
  }
}
