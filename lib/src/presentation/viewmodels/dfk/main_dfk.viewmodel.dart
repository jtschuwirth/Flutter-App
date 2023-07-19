import 'package:app/src/presentation/blocs/dfk/dfk.bloc.dart';
import 'package:app/src/presentation/blocs/dfk/dfk.state.dart';
import 'package:app/src/presentation/pages/dfk/bought_heroes.page.dart';
import 'package:app/src/presentation/views/dfk/main_dfk.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainDfkViewModel extends StatefulWidget {
  const MainDfkViewModel({super.key});

  @override
  State<MainDfkViewModel> createState() => MainDfkViewModelState();
}

class MainDfkViewModelState extends State<MainDfkViewModel> {
  void _onGoToBoughtHeroes(context) {
    GoRouter.of(context).push(BoughtHeroesPage.pathName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("Defi Kingdoms Main View")),
      ),
      backgroundColor: const Color(0xffde4545),
      body: BlocBuilder<DfkBloc, DfkState>(
        builder: (context, state) {
          return MainDfkView(
            onGoToBoughtHeroes: _onGoToBoughtHeroes,
          );
        },
      ),
    );
  }
}
