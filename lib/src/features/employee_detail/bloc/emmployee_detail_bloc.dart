import 'package:e_cubox_assesment/core/base/base_bloc.dart';
import 'package:e_cubox_assesment/src/features/employee/models/response/employee_response.dart';
import 'package:e_cubox_assesment/src/features/employee_detail/state/emp_detail_state.dart';
import 'package:e_cubox_assesment/src/repository/app_repository.dart';
import 'package:rxdart/rxdart.dart';

class EmployeeDetailBloc extends BaseBloc {
  final _repo = AppRepository();

  final empDetailState = BehaviorSubject<EmpDetailState>();

  String? validateFields(String? value, {required String fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter $fieldName";
    }
    return null;
  }

  void updateEmp(Details newData) {
    subscriptions.add(_repo
        .updateEmp(newData: newData)
        .map((event) => EmpDetailState.completed(event))
        .startWith(EmpDetailState.loading())
        .onErrorReturnWith((error, stackTrace) => EmpDetailState.error(error))
        .listen((event) {
      empDetailState.add(event);
    }));
  }

  void deleteEmp(String id) {
    subscriptions.add(_repo
        .deleteEmp(id: id)
        .map((event) => EmpDetailState.completed(event))
        .startWith(EmpDetailState.loading())
        .onErrorReturnWith((error, stackTrace) => EmpDetailState.error(error))
        .listen((event) {
      empDetailState.add(event);
    }));
  }

  @override
  void dispose() {
    super.dispose();
    empDetailState.close();
  }
}
