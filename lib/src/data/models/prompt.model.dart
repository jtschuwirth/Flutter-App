class Prompt {
  const Prompt({required this.phrase, required this.lvl});

  final String phrase;
  final int lvl;

  factory Prompt.fromJson(Map<String, dynamic> json) {
    return Prompt(phrase: json['phrase'], lvl: json['lvl']);
  }
}
