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
    required this.targetAccounts,
    required this.isLoading,
  });

  final List<HeroBoughtModel> heroesBought;
  final List<PayoutModel> lastPayouts;
  final List<TrackingDataModel> trackingData;
  final List<AccountModel> accounts;
  final List<TradeModel> trades;
  final int targetAccounts;
  final bool isLoading;

  const DfkState.initial({
    this.heroesBought = const [],
    this.lastPayouts = const [],
    this.trackingData = const [],
    this.accounts = const [],
    this.trades = const [],
    this.targetAccounts = 0,
    this.isLoading = false,
  }) : super();

  DfkState copyWith({
    List<HeroBoughtModel>? heroesBought,
    List<PayoutModel>? lastPayouts,
    List<TrackingDataModel>? trackingData,
    List<AccountModel>? accounts,
    List<TradeModel>? trades,
    int? targetAccounts,
    bool? isLoading,
  }) {
    return DfkState(
      heroesBought: heroesBought ?? this.heroesBought,
      lastPayouts: lastPayouts ?? this.lastPayouts,
      trackingData: trackingData ?? this.trackingData,
      accounts: accounts ?? this.accounts,
      trades: trades ?? this.trades,
      targetAccounts: targetAccounts ?? this.targetAccounts,
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
        targetAccounts,
        isLoading,
      ];
}
