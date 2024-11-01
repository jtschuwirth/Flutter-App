import 'package:app/src/data/models/account.model.dart';
import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:app/src/data/models/payout.model.dart';
import 'package:app/src/data/models/tracking_data.model.dart';
import 'package:app/src/data/models/trade.model.dart';
import 'package:equatable/equatable.dart';

class DfkState extends Equatable {
  const DfkState({
    required this.heroesBought,
    required this.lastPayouts,
    required this.lastFees,
    required this.trackingData,
    required this.accounts,
    required this.trades,
    required this.targetAccountsMining,
    required this.targetAccountsGardening,
    required this.selectedUser,
    required this.isLoading,
  });

  final List<HeroBoughtModel> heroesBought;
  final List<PayoutModel> lastPayouts;
  final List<PayoutModel> lastFees;
  final List<TrackingDataModel> trackingData;
  final List<AccountModel> accounts;
  final List<TradeModel> trades;
  final int targetAccountsMining;
  final int targetAccountsGardening;
  final String selectedUser;
  final bool isLoading;

  const DfkState.initial({
    this.heroesBought = const [],
    this.lastPayouts = const [],
    this.lastFees = const [],
    this.trackingData = const [],
    this.accounts = const [],
    this.trades = const [],
    this.targetAccountsMining = 0,
    this.targetAccountsGardening = 0,
    this.selectedUser = "auth0|67030c8285bebf97ea0b5c95",
    this.isLoading = false,
  }) : super();

  DfkState copyWith({
    List<HeroBoughtModel>? heroesBought,
    List<PayoutModel>? lastPayouts,
    List<PayoutModel>? lastFees,
    List<TrackingDataModel>? trackingData,
    List<AccountModel>? accounts,
    List<TradeModel>? trades,
    int? targetAccountsMining,
    int? targetAccountsGardening,
    String? selectedUser,
    bool? isLoading,
  }) {
    return DfkState(
      heroesBought: heroesBought ?? this.heroesBought,
      lastPayouts: lastPayouts ?? this.lastPayouts,
      lastFees: lastFees ?? this.lastFees,
      trackingData: trackingData ?? this.trackingData,
      accounts: accounts ?? this.accounts,
      trades: trades ?? this.trades,
      targetAccountsMining: targetAccountsMining ?? this.targetAccountsMining,
      targetAccountsGardening:
          targetAccountsGardening ?? this.targetAccountsGardening,
      selectedUser: selectedUser ?? this.selectedUser,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        heroesBought,
        lastPayouts,
        lastFees,
        trackingData,
        accounts,
        trades,
        targetAccountsMining,
        targetAccountsGardening,
        selectedUser,
        isLoading,
      ];
}
