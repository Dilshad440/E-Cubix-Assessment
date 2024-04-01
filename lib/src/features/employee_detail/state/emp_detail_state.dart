import 'package:e_cubox_assesment/core/base/base_ui_state.dart';

class EmpDetailState extends BaseUiState<int> {
  EmpDetailState.loading() : super.loading();

  EmpDetailState.completed(int data) : super.completed(data: data);

  EmpDetailState.error(super.error) : super.error();
}
