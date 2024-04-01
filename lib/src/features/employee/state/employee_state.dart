import '../../../../core/base/base_ui_state.dart';
import '../models/entity/employee_entity.dart';

class EmployeeState extends BaseUiState<EmployeeEntity> {
  EmployeeState.loading() : super.loading();

  EmployeeState.completed(EmployeeEntity data) : super.completed(data: data);

  EmployeeState.error(super.error) : super.error();
}
