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
    required this.trackingData,
    required this.accounts,
    required this.trades,
    required this.targetAccountsMining,
    required this.targetAccountsGardening,
    required this.selectedAddress,
    required this.isLoading,
  });

  final List<HeroBoughtModel> heroesBought;
  final List<PayoutModel> lastPayouts;
  final List<TrackingDataModel> trackingData;
  final List<AccountModel> accounts;
  final List<TradeModel> trades;
  final int targetAccountsMining;
  final int targetAccountsGardening;
  final String selectedAddress;
  final bool isLoading;

  const DfkState.initial({
    this.heroesBought = const [],
    this.lastPayouts = const [],
    this.trackingData = const [],
    this.accounts = const [],
    this.trades = const [],
    this.targetAccountsMining = 0,
    this.targetAccountsGardening = 0,
    this.selectedAddress = "0xa691623968855b91A066661b0552a7D3764c9a64",
    this.isLoading = false,
  }) : super();

  DfkState copyWith({
    List<HeroBoughtModel>? heroesBought,
    List<PayoutModel>? lastPayouts,
    List<TrackingDataModel>? trackingData,
    List<AccountModel>? accounts,
    List<TradeModel>? trades,
    int? targetAccountsMining,
    int? targetAccountsGardening,
    String? selectedAddress,
    bool? isLoading,
  }) {
    return DfkState(
      heroesBought: heroesBought ?? this.heroesBought,
      lastPayouts: lastPayouts ?? this.lastPayouts,
      trackingData: trackingData ?? this.trackingData,
      accounts: accounts ?? this.accounts,
      trades: trades ?? this.trades,
      targetAccountsMining: targetAccountsMining ?? this.targetAccountsMining,
      targetAccountsGardening:
          targetAccountsGardening ?? this.targetAccountsGardening,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        heroesBought,
        lastPayouts,
        trackingData,
        accounts,
        trades,
        targetAccountsMining,
        targetAccountsGardening,
        selectedAddress,
        isLoading,
      ];
}
