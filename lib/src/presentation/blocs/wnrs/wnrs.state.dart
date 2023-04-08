import 'package:app/src/data/models/prompt.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WnrsState extends Equatable {
  const WnrsState(
      {required this.prompt, required this.lvl, required this.buffer});

  final Prompt prompt;
  final int lvl;
  final List<Prompt> buffer;

  const WnrsState.initial()
      : this(
            prompt: const Prompt(phrase: "", lvl: 1), lvl: 1, buffer: const []);
  const WnrsState.newPrompt(Prompt newPrompt, int lvl, List<Prompt> newBuffer)
      : this(prompt: newPrompt, lvl: lvl, buffer: newBuffer);
  const WnrsState.newLvl(Prompt prompt, int newLvL)
      : this(prompt: prompt, lvl: newLvL, buffer: const []);

  @override
  List<Object> get props => [prompt, lvl];
}
