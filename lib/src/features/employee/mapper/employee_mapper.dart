import 'package:e_cubox_assesment/core/base/base_mapper.dart';
import 'package:e_cubox_assesment/src/features/employee/models/entity/employee_entity.dart';
import 'package:e_cubox_assesment/src/features/employee/models/response/employee_response.dart';

class EmployeeMapper extends BaseMapper<EmployeeResponse, EmployeeEntity> {
  @override
  EmployeeEntity map(EmployeeResponse v) {
    return EmployeeEntity(
        employee: v.details!
            .map((e) => Details(
                  varAppDate: e.varAppDate,
                  varAppRemarks: e.varAppRemarks,
                  varCategory: e.varCategory,
                  varCity: e.varCity,
                  varDrName: e.varDrName,
                  varDrReqCode: e.varDrReqCode,
                  varEmpCode: e.varEmpCode,
                  varEmpName: e.varEmpName,
                  varLatestStatus: e.varLatestStatus,
                  varMobileNo: e.varMobileNo,
                  varRejectReason: e.varRejectReason,
                  varReqDate: e.varReqDate,
                  varReqRemarks: e.varReqRemarks,
                ))
            .toList());
  }
// @override
// List<Details> map(EmployeeResponse v) {
//   return v.details!
//       .map((e) => Details(
//             varAppDate: e.varAppDate,
//             varAppRemarks: e.varAppRemarks,
//             varCategory: e.varCategory,
//             varCity: e.varCity,
//             varDrName: e.varDrName,
//             varDrReqCode: e.varDrReqCode,
//             varEmpCode: e.varEmpCode,
//             varEmpName: e.varEmpName,
//             varLatestStatus: e.varLatestStatus,
//             varMobileNo: e.varMobileNo,
//             varRejectReason: e.varRejectReason,
//             varReqDate: e.varReqDate,
//             varReqRemarks: e.varReqRemarks,
//           ))
//       .toList();
// }
}
