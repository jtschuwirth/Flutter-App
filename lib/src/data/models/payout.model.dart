class PayoutModel {
  String address;
  String amount;
  String time;
  String timeDelta;

  PayoutModel({
    required this.address,
    required this.amount,
    required this.time,
    required this.timeDelta,
  });

  factory PayoutModel.fromJson(Map<String, dynamic> json) {
    return PayoutModel(
        address: json['address_'],
        amount: json['amount_'],
        time: json['time_'],
        timeDelta: json['time_delta'] ?? false);
  }
}
