import 'package:app/src/presentation/blocs/wnrs/wnrs.bloc.dart';
import 'package:app/src/presentation/blocs/wnrs/wnrs.state.dart';
import 'package:app/src/presentation/pages/wnrs.page.dart';
import 'package:app/src/presentation/views/home.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewModel extends StatefulWidget {
  const HomeViewModel({super.key});

  @override
  State<HomeViewModel> createState() => HomeViewModelState();
}

class HomeViewModelState extends State<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("Home")),
      ),
      body: BlocBuilder<WnrsBloc, WnrsState>(
        builder: (context, state) {
          return HomeView(
            onGoToNhie: _onGoToNhie,
            onGoToWnrs: _onGoToWnrs,
          );
        },
      ),
    );
  }

  void _onGoToWnrs(context) {
    GoRouter.of(context).go(WnrsPage.pathName);
  }

  void _onGoToNhie(context) {
    // GoRouter.of(context).go(NhiePage.pathName);
  }
}
