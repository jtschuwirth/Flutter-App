import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/wnrs/wnrs.bloc.dart';
import 'package:app/src/presentation/pages/dfk/accounts.page.dart';
import 'package:app/src/presentation/pages/dfk/bought_heroes.page.dart';
import 'package:app/src/presentation/pages/dfk/last_payouts.page.dart';
import 'package:app/src/presentation/pages/dfk/main_dfk.page.dart';
import 'package:app/src/presentation/pages/dfk/tracking_data.page.dart';
import 'package:app/src/presentation/pages/dfk/trades.page.dart';
import 'package:app/src/presentation/pages/home.page.dart';
import 'package:app/src/presentation/pages/wnrs.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/wnrs',
      builder: (BuildContext context, GoRouterState state) {
        return const WnrsPage();
      },
    ),
    GoRoute(
      path: '/dfk',
      builder: (BuildContext context, GoRouterState state) {
        return const MainDfkPage();
      },
    ),
    GoRoute(
      path: '/dfk/bought_heroes',
      builder: (BuildContext context, GoRouterState state) {
        String profession = state.extra as String;
        return BoughtHeroesPage(profession: profession);
      },
    ),
    GoRoute(
      path: '/dfk/last_payouts',
      builder: (BuildContext context, GoRouterState state) {
        return const LastPayoutsPage();
      },
    ),
    GoRoute(
      path: '/dfk/tracking_data',
      builder: (BuildContext context, GoRouterState state) {
        String profession = state.extra as String;
        return TrackingDataPage(profession: profession);
      },
    ),
    GoRoute(
      path: '/dfk/accounts',
      builder: (BuildContext context, GoRouterState state) {
        return const AccountsPage();
      },
    ),
    GoRoute(
      path: '/dfk/trades',
      builder: (BuildContext context, GoRouterState state) {
        return const TradesPage();
      },
    ),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => WnrsBloc(),
          ),
          BlocProvider(
            create: (BuildContext context) => DfkBloc(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: _router,
        ));
  }
}
