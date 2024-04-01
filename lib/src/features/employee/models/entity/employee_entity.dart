import '../response/employee_response.dart';

class EmployeeEntity {
  List<Details>? employee;

  EmployeeEntity({this.employee});

  EmployeeEntity.fromJson(List json) {
    employee = [];
    for (var v in json) {
      employee?.add(Details.fromJson(v));
    }
  }
}
