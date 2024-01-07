import 'package:app/src/data/models/account.model.dart';
import 'package:app/src/data/models/hero_bought.model.dart';
import 'package:app/src/data/models/payout.model.dart';
import 'package:app/src/data/models/tracking_data.model.dart';
import 'package:app/src/data/models/trade.model.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.event.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DfkBloc extends Bloc<DfkEvent, DfkState> {
  DfkBloc() : super(const DfkState.initial()) {
    on<DfkGetHeroesBought>(_onGetHeroesBought);
    on<DfkGetLastPayouts>(_onGetLastPayouts);
    on<DfkGetTrackingData>(_onGetTrackingData);
    on<DfkGetAccounts>(_onGetAccounts);
    on<DfkGetTrades>(_onGetTrades);
    on<DfkGetTargetAccounts>(_onGetTargetAccounts);
  }

  Future<void> _onGetTargetAccounts(
    DfkGetTargetAccounts event,
    Emitter<DfkState> emit,
  ) async {
    try {
      final response = await http.get(Uri.parse(
          '${dotenv.env["ENDPOINT"]}/dfk/target_accounts/${event.managerAddress}'));
      if (response.statusCode == 200) {
        int targetAccounts = int.parse(response.body);

        emit(
          state.copyWith(
            targetAccounts: targetAccounts,
          ),
        );
      } else {
        throw Exception('Failed to get target accounts');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onGetAccounts(
    DfkGetAccounts event,
    Emitter<DfkState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await http.get(Uri.parse(
          '${dotenv.env["ENDPOINT"]}/dfk/accounts/${event.managerAddress}'));
      if (response.statusCode == 200) {
        List<AccountModel> accounts = [];
        for (final entry in jsonDecode(response.body)) {
          final AccountModel newAccount = AccountModel.fromJson(entry);
          accounts.add(newAccount);
        }
        emit(
          state.copyWith(
            accounts: accounts,
          ),
        );
      } else {
        throw Exception('Failed to get accounts');
      }
    } catch (e) {
      print(e);
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onGetTrackingData(
    DfkGetTrackingData event,
    Emitter<DfkState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await http
          .get(Uri.parse('${dotenv.env["ENDPOINT"]}/dfk/seller/tracking_data'));
      if (response.statusCode == 200) {
        List<TrackingDataModel> trackingData = [];
        for (final entry in jsonDecode(response.body)) {
          trackingData.add(TrackingDataModel.fromJson(entry));
        }
        emit(
          state.copyWith(
            trackingData: trackingData,
          ),
        );
      } else {
        throw Exception('Failed to load tracking data');
      }
    } catch (e) {
      print(e);
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onGetLastPayouts(
    DfkGetLastPayouts event,
    Emitter<DfkState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await http.get(Uri.parse(
          '${dotenv.env["ENDPOINT"]}/dfk/seller/last_payouts/${event.managerAddress}'));
      if (response.statusCode == 200) {
        List<PayoutModel> lastPayouts = [];
        for (final entry in jsonDecode(response.body)) {
          lastPayouts.add(PayoutModel.fromJson(entry));
        }
        emit(
          state.copyWith(
            lastPayouts: lastPayouts,
          ),
        );
      } else {
        throw Exception('Failed to load last payouts');
      }
    } catch (e) {
      print(e);
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onGetHeroesBought(
    DfkGetHeroesBought event,
    Emitter<DfkState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await http
          .get(Uri.parse('${dotenv.env["ENDPOINT"]}/dfk/buyer/heroes_bought'));

      if (response.statusCode == 200) {
        List<HeroBoughtModel> heroesBought = [];
        for (final entry in jsonDecode(response.body)) {
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

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onGetTrades(
    DfkGetTrades event,
    Emitter<DfkState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await http
          .get(Uri.parse('${dotenv.env["ENDPOINT"]}/dfk/trader/trades'));

      if (response.statusCode == 200) {
        List<TradeModel> trades = [];
        for (final entry in jsonDecode(response.body)) {
          trades.add(TradeModel.fromJson(entry));
        }
        emit(
          state.copyWith(
            trades: trades,
          ),
        );
      } else {
        throw Exception('Failed to load trades');
      }
    } catch (e) {
      print(e);
    }

    emit(state.copyWith(isLoading: false));
  }
}
