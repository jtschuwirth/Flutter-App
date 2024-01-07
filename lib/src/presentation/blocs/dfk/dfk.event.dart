abstract class DfkEvent {
  const DfkEvent();
}

class DfkGetHeroesBought extends DfkEvent {
  const DfkGetHeroesBought();
}

class DfkGetLastPayouts extends DfkEvent {
  final String managerAddress;
  const DfkGetLastPayouts({
    required this.managerAddress,
  });
}

class DfkGetTrackingData extends DfkEvent {
  const DfkGetTrackingData();
}

class DfkGetAccounts extends DfkEvent {
  final String managerAddress;
  const DfkGetAccounts({
    required this.managerAddress,
  });
}

class DfkGetTrades extends DfkEvent {
  const DfkGetTrades();
}

class DfkGetTargetAccounts extends DfkEvent {
  final String managerAddress;
  const DfkGetTargetAccounts({
    required this.managerAddress,
  });
}
