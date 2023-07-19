import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:equatable/equatable.dart';

class DfkState extends Equatable {
  const DfkState({
    required this.heroesBought,
    required this.isLoading,
  });

  final List<HeroBoughtModel> heroesBought;
  final bool isLoading;

  const DfkState.initial({
    this.heroesBought = const [],
    this.isLoading = false,
  }) : super();

  DfkState copyWith({
    List<HeroBoughtModel>? heroesBought,
    bool? isLoading,
  }) {
    return DfkState(
      heroesBought: heroesBought ?? this.heroesBought,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        heroesBought,
        isLoading,
      ];
}
