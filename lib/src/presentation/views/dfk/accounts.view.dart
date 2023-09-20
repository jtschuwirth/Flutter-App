import 'package:app/src/data/models/account.model.dart';
import 'package:flutter/material.dart';

class AccountsView extends StatelessWidget {
  final List<AccountModel> accounts;
  final bool isLoading;

  const AccountsView({
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
                Text("Accounts: ${accounts.length}"),
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
                height: mediaSize.height * 0.13,
                child: Card(
                  child: ListTile(
                      title: Text("Address: ${accounts[index].address}"),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Manager: ${accounts[index].manager} "),
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
