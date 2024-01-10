class TradeModel {
  String time;
  String amount;
  String price;
  String item;
  String model;
  String strategy;
  String operation;
  String expectedProfit;

  TradeModel({
    required this.time,
    required this.amount,
    required this.price,
    required this.item,
    required this.model,
    required this.strategy,
    required this.operation,
    required this.expectedProfit,
  });

  factory TradeModel.fromJson(Map<String, dynamic> json) {
    return TradeModel(
      time: json['time_'] ?? "0",
      amount: json['amount'] ?? "0.0",
      price: json['price'] ?? "0.0",
      item: json['item'] ?? "",
      model: json['model'] ?? "",
      strategy: json['strategy'] ?? "",
      operation: json['operation'] ?? "",
      expectedProfit: json['expected_profit'] ?? "0.0",
    );
  }
}
