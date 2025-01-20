import 'package:app/src/data/models/account.model.dart';
import 'package:flutter/material.dart';

class AccountsView extends StatelessWidget {
  final int targetAccountsMining;
  final int targetAccountsGardening;
  final List<AccountModel> accounts;
  final bool isLoading;

  const AccountsView({
    required this.targetAccountsMining,
    required this.targetAccountsGardening,
    required this.accounts,
    required this.isLoading,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (accounts.isEmpty) {
      return const Center(
        child: Text("No Accounts"),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: mediaSize.height * 0.2,
          child: Card(
            color: Colors.blue,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Accounts Mining: ${accounts.where((element) => element.profession == 'mining').length}"),
                const SizedBox(height: 5),
                Text(
                    "Accounts Gardening: ${accounts.where((element) => element.profession == 'gardening').length}"),
                const SizedBox(height: 5),
              ],
            )),
          ),
        ),
        SizedBox(
          height: mediaSize.height * 0.65,
          child: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: mediaSize.height * 0.18,
                child: Card(
                  child: ListTile(
                      title: Text("Address: ${accounts[index].address}"),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Manager: ${accounts[index].manager} "),
                          Text("Profession: ${accounts[index].profession} "),
                          Text("Enabled: ${accounts[index].enabled} "),
                        ],
                      )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
