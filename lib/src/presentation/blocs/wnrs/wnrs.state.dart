import 'package:app/src/data/models/prompt.model.dart';
import 'package:equatable/equatable.dart';

class WnrsState extends Equatable {
  const WnrsState(this.prompt, this.lvl, this.buffer);

  final Prompt prompt;
  final int lvl;
  final List<Prompt> buffer;

  const WnrsState.initial(
      {this.prompt = const Prompt(phrase: "", lvl: 1),
      this.lvl = 1,
      this.buffer = const []})
      : super();

  WnrsState copyWith({Prompt? prompt, int? lvl, List<Prompt>? buffer}) {
    return WnrsState(
      prompt ?? this.prompt,
      lvl ?? this.lvl,
      buffer ?? this.buffer,
    );
  }

  @override
  List<Object> get props => [prompt, lvl, buffer];
}
