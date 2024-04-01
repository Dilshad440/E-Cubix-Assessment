import 'package:e_cubox_assesment/src/features/employee/models/entity/employee_entity.dart';

import '../../core/local/database_helper.dart';
import '../features/employee/models/response/employee_response.dart';

class LocalDatasource extends SqfLiteService {
  Stream<EmployeeEntity> insertIntoDB(EmployeeEntity emp) {
    return Stream.fromFuture(insertIntoDb(emp));
  }

  Stream<EmployeeEntity> getEmpFromDb() {
    return Stream.fromFuture(getFromDb());
  }

  Stream<EmployeeEntity> searchEmp(String? val) {
    return Stream.fromFuture(onSearchInDb(val: val));
  }

  Stream<int> updateEmp({required Details newData}) {
    return Stream.fromFuture(updateInDb(newData: newData));
  }

  Stream<int> deleteEmp({required String id}) {
    return Stream.fromFuture(deleteInDb(id: id));
  }
}
