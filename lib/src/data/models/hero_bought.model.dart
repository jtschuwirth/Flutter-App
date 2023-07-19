class HeroBoughtModel {
  String price;
  String heroId;
  String time;
  bool filter;

  HeroBoughtModel(
      {required this.price,
      required this.heroId,
      required this.time,
      required this.filter});

  factory HeroBoughtModel.fromJson(Map<String, dynamic> json) {
    return HeroBoughtModel(
        price: json['price'],
        heroId: json['heroId_'],
        time: json['time_'],
        filter: json['filter'] ?? false);
  }
}
