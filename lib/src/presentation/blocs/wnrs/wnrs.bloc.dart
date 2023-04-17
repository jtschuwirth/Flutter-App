import 'package:app/src/data/models/prompt.model.dart';
import 'package:app/src/presentation/blocs/wnrs/wnrs.event.dart';
import 'package:app/src/presentation/blocs/wnrs/wnrs.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WnrsBloc extends Bloc<WnrsEvent, WnrsState> {
  WnrsBloc() : super(const WnrsState.initial()) {
    on<WnrsNewPrompt>(_onNewPrompt);
    on<WnrsNewLvl>(_onNewLvl);
  }

  void _onNewPrompt(WnrsNewPrompt event, Emitter<WnrsState> emit) async {
    if (state.buffer.isEmpty || event.prompt.lvl != state.lvl) {
      final response = await http.get(Uri.parse(
          'https://59fxcxkow4.execute-api.us-east-1.amazonaws.com/dev/icebreakers/phrases?n=31&level=${state.lvl}'));
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            prompt: Prompt.fromJson(jsonDecode(response.body)[0]),
            buffer: List<Prompt>.from(
              jsonDecode(response.body)
                  .skip(1)
                  .map((value) => Prompt.fromJson(value))
                  .toList(),
            ),
          ),
        );
      } else {
        throw Exception('Failed to load new buffer');
      }
    } else {
      List<Prompt> newBuffer = state.buffer;
      newBuffer.removeAt(0);
      emit(state.copyWith(prompt: state.buffer[0], buffer: newBuffer));
    }
  }

  void _onNewLvl(WnrsNewLvl event, Emitter<WnrsState> emit) {
    emit(state.copyWith(lvl: event.lvl, buffer: []));
  }
}
