import 'dart:convert';

import 'package:e_cubox_assesment/core/api_config/api_const.dart';
import 'package:e_cubox_assesment/core/api_config/rest_client.dart';
import 'package:e_cubox_assesment/core/constant/app_constant.dart';

import '../features/employee/models/response/employee_response.dart';

class RemoteSource {
  final _client = RestClient.getInstance();

  Stream<EmployeeResponse> getEmployee() {
    var data = {
      'fk_EmpGLCode': AppConstant.empGlCode,
      'varClientName': AppConstant.clientName,
    };
    return Stream.fromFuture(_client.dio.post(ApiConst.getEmployee, data: data)).map(
      (event) => EmployeeResponse.fromJson(jsonDecode(event.data)),
    );
  }
}
