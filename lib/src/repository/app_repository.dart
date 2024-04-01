import 'package:e_cubox_assesment/src/data_source/local_data_source.dart';
import 'package:e_cubox_assesment/src/data_source/remote_data_source.dart';

import '../features/employee/mapper/employee_mapper.dart';
import '../features/employee/models/entity/employee_entity.dart';
import '../features/employee/models/response/employee_response.dart';

class AppRepository {
  final _remoteSource = RemoteSource();
  final _localSource = LocalDatasource();
  final _empMapper = EmployeeMapper();

  Stream<EmployeeEntity> getEmployee() {
    return _remoteSource.getEmployee().map((event) => _empMapper.map(event));
  }

  Stream<EmployeeEntity> insertIntoDB(EmployeeEntity emp) {
    return _localSource.insertIntoDB(emp);
  }

  Stream<EmployeeEntity> getEmpFromDB() {
    return _localSource.getEmpFromDb();
  }

  Stream<EmployeeEntity> searchEmp({required String query}) {
    return _localSource.searchEmp(query);
  }

  Stream<int> updateEmp({required Details newData}) {
    return _localSource.updateEmp(newData: newData);
  }

  Stream<int> deleteEmp({required String id}) {
    return _localSource.deleteEmp(id: id);
  }
}
