import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DfkBloc extends Bloc<DfkEvent, DfkState> {
  DfkBloc() : super(const DfkState.initial()) {
    on<DfkGetHeroesBought>(_onGetHeroesBought);
  }

  void _onGetHeroesBought(
    DfkGetHeroesBought event,
    Emitter<DfkState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      final response = await http.get(Uri.parse(
          'https://59fxcxkow4.execute-api.us-east-1.amazonaws.com/dev/dfk/buyer/heroes_bought'));

      if (response.statusCode == 200) {
        List<HeroBoughtModel> heroesBought = [];
        for (final entry in jsonDecode(response.body)["heroes"]) {
          heroesBought.add(HeroBoughtModel.fromJson(entry));
        }
        emit(
          state.copyWith(
            heroesBought: heroesBought,
          ),
        );
      } else {
        throw Exception('Failed to load heroes bought');
      }
    } catch (e) {
      print(e);
    }

    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }
}
