class EmployeeResponse {
  List<Status>? status;
  List<Details>? details;
  dynamic lstDrAdditionCityDetails;
  dynamic lstDrAdditionHospitalDetails;
  dynamic lstDrRequestList;
  dynamic lstChemistRequestList;

  EmployeeResponse(
      {this.status,
      this.details,
      this.lstDrAdditionCityDetails,
      this.lstDrAdditionHospitalDetails,
      this.lstDrRequestList,
      this.lstChemistRequestList});

  EmployeeResponse.fromJson(Map<String, dynamic> json) {
    if (json['Status'] != null) {
      status = <Status>[];
      json['Status'].forEach((v) {
        status!.add(Status.fromJson(v));
      });
    }
    if (json['Details'] != null) {
      details = <Details>[];
      json['Details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
    lstDrAdditionCityDetails = json['lstDrAdditionCityDetails'];
    lstDrAdditionHospitalDetails = json['lstDrAdditionHospitalDetails'];
    lstDrRequestList = json['lstDrRequestList'];
    lstChemistRequestList = json['lstChemistRequestList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['Status'] = status!.map((v) => v.toJson()).toList();
    }
    if (details != null) {
      data['Details'] = details!.map((v) => v.toJson()).toList();
    }
    data['lstDrAdditionCityDetails'] = lstDrAdditionCityDetails;
    data['lstDrAdditionHospitalDetails'] = lstDrAdditionHospitalDetails;
    data['lstDrRequestList'] = lstDrRequestList;
    data['lstChemistRequestList'] = lstChemistRequestList;
    return data;
  }
}

class Status {
  bool? isValid;
  String? message;

  Status({this.isValid, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isValid'] = isValid;
    data['Message'] = message;
    return data;
  }
}

class Details {
  String? varDrName;
  String? varCategory;
  String? varSpeciality;
  String? varCity;
  String? varReqDate;
  String? varStatus;
  String? varAppDate;
  String? varLatestStatus;
  String? varStatusUpdatedBy;
  String? varEmpCode;
  String? varEmpName;
  String? varReqRemarks;
  String? varAppRemarks;
  String? varMobileNo;
  String? varDrReqCode;
  String? varRejectReason;

  Details({
    this.varDrName,
    this.varCategory,
    this.varSpeciality,
    this.varCity,
    this.varReqDate,
    this.varStatus,
    this.varAppDate,
    this.varLatestStatus,
    this.varStatusUpdatedBy,
    this.varEmpCode,
    this.varEmpName,
    this.varReqRemarks,
    this.varAppRemarks,
    this.varMobileNo,
    this.varDrReqCode,
    this.varRejectReason,
  });

  Details.fromJson(Map<String, dynamic> json) {
    varDrName = json['varDrName'];
    varCategory = json['varCategory'];
    varSpeciality = json['varSpeciality'];
    varCity = json['varCity'];
    varReqDate = json['varReqDate'];
    varStatus = json['varStatus'];
    varAppDate = json['varAppDate'];
    varLatestStatus = json['varLatestStatus'];
    varStatusUpdatedBy = json['varStatusUpdatedBy'];
    varEmpCode = json['varEmpCode'];
    varEmpName = json['varEmpName'];
    varReqRemarks = json['varReqRemarks'];
    varAppRemarks = json['varAppRemarks'];
    varMobileNo = json['varMobileNo'];
    varDrReqCode = json['varDrReqCode'];
    varRejectReason = json['varRejectReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['varDrName'] = varDrName;
    data['varCategory'] = varCategory;
    data['varSpeciality'] = varSpeciality;
    data['varCity'] = varCity;
    data['varReqDate'] = varReqDate;
    data['varStatus'] = varStatus;
    data['varAppDate'] = varAppDate;
    data['varLatestStatus'] = varLatestStatus;
    data['varStatusUpdatedBy'] = varStatusUpdatedBy;
    data['varEmpCode'] = varEmpCode;
    data['varEmpName'] = varEmpName;
    data['varReqRemarks'] = varReqRemarks;
    data['varAppRemarks'] = varAppRemarks;
    data['varMobileNo'] = varMobileNo;
    data['varDrReqCode'] = varDrReqCode;
    data['varRejectReason'] = varRejectReason;
    return data;
  }
}
