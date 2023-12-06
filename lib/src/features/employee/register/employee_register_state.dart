enum EmployeeRegisterStateStatus { initial, success, error }

class EmployeeRegisterState {
  final EmployeeRegisterStateStatus status;
  final bool registerADM;
  final List<String> workdays;
  final List<int> workHours;

  EmployeeRegisterState.initial()
      : this(
          status: EmployeeRegisterStateStatus.initial,
          registerADM: false,
          workdays: <String>[],
          workHours: <int>[],
        );

  EmployeeRegisterState({
    required this.status,
    required this.registerADM,
    required this.workdays,
    required this.workHours,
  });

  EmployeeRegisterState copyWith({
    EmployeeRegisterStateStatus? status,
    bool? registerADM,
    List<String>? workdays,
    List<int>? workHours,
  }) {
    return EmployeeRegisterState(
      status: status ?? this.status,
      registerADM: registerADM ?? this.registerADM,
      workdays: workdays ?? this.workdays,
      workHours: workHours ?? this.workHours,
    );
  }
}
