import 'package:app/src/presentation/blocs/wnrs/wnrs.bloc.dart';
import 'package:app/src/presentation/blocs/wnrs/wnrs.event.dart';
import 'package:app/src/presentation/blocs/wnrs/wnrs.state.dart';
import 'package:app/src/presentation/views/wnrs.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WnrsViewModel extends StatefulWidget {
  const WnrsViewModel({super.key});

  @override
  State<WnrsViewModel> createState() => WnrsViewModelState();
}

class WnrsViewModelState extends State<WnrsViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Center(child: Text("We are not really strangers")),
      ),
      backgroundColor: const Color(0xffde4545),
      body: BlocBuilder<WnrsBloc, WnrsState>(
        builder: (context, state) {
          return WnrsView(
            changePrompt: () =>
                context.read<WnrsBloc>().add(WnrsNewPrompt(state.prompt)),
            changeLevel: (int lvl) =>
                context.read<WnrsBloc>().add(WnrsNewLvl(lvl)),
            prompt: state.prompt,
            lvl: state.lvl,
          );
        },
      ),
    );
  }
}
