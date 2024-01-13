abstract class DfkEvent {
  const DfkEvent();
}

class DfkGetHeroesBought extends DfkEvent {
  final String profession;
  const DfkGetHeroesBought({required this.profession});
}

class DfkGetLastPayouts extends DfkEvent {
  const DfkGetLastPayouts();
}

class DfkGetTrackingData extends DfkEvent {
  const DfkGetTrackingData();
}

class DfkGetAccounts extends DfkEvent {
  const DfkGetAccounts();
}

class DfkGetTrades extends DfkEvent {
  const DfkGetTrades();
}

class DfkGetTargetAccounts extends DfkEvent {
  const DfkGetTargetAccounts();
}

class DfkChangeSelectedAddress extends DfkEvent {
  final String selectedAddress;
  const DfkChangeSelectedAddress({
    required this.selectedAddress,
  });
}
