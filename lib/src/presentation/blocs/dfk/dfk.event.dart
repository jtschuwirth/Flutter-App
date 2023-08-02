abstract class DfkEvent {
  const DfkEvent();
}

class DfkGetHeroesBought extends DfkEvent {
  const DfkGetHeroesBought();
}

class DfkGetLastPayouts extends DfkEvent {
  const DfkGetLastPayouts();
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
