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

class DfkGetLastFees extends DfkEvent {
  const DfkGetLastFees();
}

class DfkGetTrackingData extends DfkEvent {
  const DfkGetTrackingData();
}

class DfkGetAccounts extends DfkEvent {
  const DfkGetAccounts();
}

class DfkGetEnrolledUsers extends DfkEvent {
  const DfkGetEnrolledUsers();
}

class DfkGetTrades extends DfkEvent {
  const DfkGetTrades();
}

class DfkGetTargetAccounts extends DfkEvent {
  const DfkGetTargetAccounts();
}

class DfkChangeSelectedUser extends DfkEvent {
  final String selectedUser;
  const DfkChangeSelectedUser({
    required this.selectedUser,
  });
}
