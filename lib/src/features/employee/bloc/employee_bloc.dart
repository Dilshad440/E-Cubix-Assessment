import 'package:e_cubox_assesment/core/base/base_bloc.dart';
import 'package:e_cubox_assesment/src/features/employee/models/entity/employee_entity.dart';
import 'package:e_cubox_assesment/src/repository/app_repository.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:rxdart/rxdart.dart';

import '../state/employee_state.dart';

class EmployeeBloc extends BaseBloc {
  final _repository = AppRepository();

  final employee = BehaviorSubject<EmployeeState>();

  void getEmployee() {
    subscriptions.add(
      _repository
          .getEmployee()
          .map((event) => EmployeeState.completed(event))
          .startWith(EmployeeState.loading())
          .onErrorReturnWith((error, stackTrace) => EmployeeState.error(error))
          .listen(
        (event) {
          employee.add(event);
          if (event.isCompleted && event.data != null) {
            _insertIntoDB(event.data!);
          }
        },
      ),
    );
  }

  void _insertIntoDB(EmployeeEntity emp) {
    subscriptions.add(_repository
        .insertIntoDB(emp)
        .map((event) => EmployeeState.completed(event))
        .startWith(EmployeeState.loading())
        .onErrorReturnWith((error, stackTrace) => EmployeeState.error(error))
        .listen((event) {
      employee.add(event);
    }));
  }

  void getEmpFromLocal() {
    subscriptions.add(_repository
        .getEmpFromDB()
        .map((event) => EmployeeState.completed(event))
        .startWith(EmployeeState.loading())
        .onErrorReturnWith((error, stackTrace) => EmployeeState.error(stackTrace))
        .listen((event) {
      employee.add(event);
      if (isDataExistInDB(event)) {
        getEmployee();
      }
    }));
  }

  bool isDataExistInDB(EmployeeState event) =>
      event.isCompleted && (event.data?.employee == null) || (event.data?.employee?.isEmpty ?? false);

  void getEmpOnSearch(String query) {
    final Debouncer debouncer = Debouncer();
    debouncer.debounce(
      duration: const Duration(milliseconds: 600),
      onDebounce: () {
        subscriptions.add(_repository
            .searchEmp(query: query)
            .map((event) => EmployeeState.completed(event))
            .startWith(EmployeeState.loading())
            .onErrorReturnWith((error, stackTrace) => EmployeeState.error(error))
            .listen((event) {
          employee.add(event);
        }));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    employee.close();
  }
}
