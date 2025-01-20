class User {
  final String userId;
  final int accounts;

  User(this.userId, this.accounts);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['userId'],
      json['accounts'],
    );
  }
}
