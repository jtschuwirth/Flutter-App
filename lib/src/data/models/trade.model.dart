class TradeModel {
  String time;
  String amount;
  String expectedProfit;
  String realProfit;
  String item;
  String model;
  String strategy;

  TradeModel({
    required this.time,
    required this.amount,
    required this.expectedProfit,
    required this.realProfit,
    required this.item,
    required this.model,
    required this.strategy,
  });

  factory TradeModel.fromJson(Map<String, dynamic> json) {
    return TradeModel(
      time: json['time_'] ?? "0",
      amount: json['amount'] ?? "0.0",
      item: json['item'] ?? "",
      model: json['model'] ?? "",
      strategy: json['strategy'] ?? "",
      realProfit: json['real_profit'] ?? "0.0",
      expectedProfit: json['expected_profit'] ?? "0.0",
    );
  }
}
