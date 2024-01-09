class AccountModel {
  String address;
  String manager;
  bool enabled;
  String? jewelBalance;
  String? profession;

  AccountModel({
    required this.address,
    required this.manager,
    required this.enabled,
    required this.profession,
    this.jewelBalance,
  });

  AccountModel copyWith({
    String? address,
    String? manager,
    bool? enabled,
    String? jewelBalance,
    String? profession,
  }) {
    return AccountModel(
      address: address ?? this.address,
      manager: manager ?? this.manager,
      enabled: enabled ?? this.enabled,
      jewelBalance: jewelBalance ?? this.jewelBalance,
      profession: profession ?? this.profession,
    );
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      address: json['address'],
      manager: json['manager'],
      enabled: json['enabled'],
      profession: json['profession'],
    );
  }
}
