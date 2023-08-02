class AccountModel {
  String address;
  String manager;
  bool enabled;
  String? jewelBalance;

  AccountModel(
      {required this.address,
      required this.manager,
      required this.enabled,
      this.jewelBalance});

  AccountModel copyWith({
    String? address,
    String? manager,
    bool? enabled,
    String? jewelBalance,
  }) {
    return AccountModel(
      address: address ?? this.address,
      manager: manager ?? this.manager,
      enabled: enabled ?? this.enabled,
      jewelBalance: jewelBalance ?? this.jewelBalance,
    );
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      address: json['address'],
      manager: json['manager'],
      enabled: json['enabled'],
    );
  }
}
