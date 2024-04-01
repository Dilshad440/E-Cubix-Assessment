import 'package:e_cubox_assesment/core/components/app_buttons.dart';
import 'package:e_cubox_assesment/core/components/app_textfield.dart';
import 'package:e_cubox_assesment/core/components/common_appbbar.dart';
import 'package:e_cubox_assesment/core/constant/global_const.dart';
import 'package:e_cubox_assesment/core/theme/app_colors.dart';
import 'package:e_cubox_assesment/src/features/employee/models/response/employee_response.dart';
import 'package:e_cubox_assesment/src/features/employee_detail/bloc/emmployee_detail_bloc.dart';
import 'package:e_cubox_assesment/src/features/employee_detail/state/emp_detail_state.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen({super.key, required this.details});

  final Details details;

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _categoryController;
  late TextEditingController _specialityController;
  late TextEditingController _mobileController;
  late TextEditingController _remarkController;

  final _formKey = GlobalKey<FormState>();
  late EmployeeDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = EmployeeDetailBloc();
    _initialize();
  }

  void _initialize() {
    final detail = widget.details;
    _nameController = TextEditingController(text: detail.varDrName);
    _categoryController = TextEditingController(text: detail.varCategory);
    _specialityController = TextEditingController(text: detail.varSpeciality);
    _mobileController = TextEditingController(text: detail.varMobileNo);
    _remarkController = TextEditingController(text: detail.varReqRemarks);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _categoryController.dispose();
    _specialityController.dispose();
    _mobileController.dispose();
    _remarkController.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Employee Details"),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            AppTextField(
              hintText: "Name",
              controller: _nameController,
              validator: (val) {
                return _bloc.validateFields(val, fieldName: "Name");
              },
            ),
            const SizedBox(height: 5),
            AppTextField(
              hintText: "Category",
              controller: _categoryController,
              validator: (val) {
                return _bloc.validateFields(val, fieldName: "Category");
              },
            ),
            const SizedBox(height: 5),
            AppTextField(
              hintText: "Speciality",
              controller: _specialityController,
              validator: (val) {
                return _bloc.validateFields(val, fieldName: "Speciality");
              },
            ),
            const SizedBox(height: 5),
            AppTextField(
              hintText: "Mobile",
              controller: _mobileController,
              validator: (val) {
                return _bloc.validateFields(val, fieldName: "Mobile");
              },
            ),
            const SizedBox(height: 5),
            AppTextField(
              hintText: "Remark",
              maxLines: 4,
              controller: _remarkController,
              validator: (val) {
                return _bloc.validateFields(val, fieldName: "Remark");
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StreamBuilder<EmpDetailState>(
                  stream: _bloc.empDetailState,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    return deleteButton(state);
                  },
                ),
                const SizedBox(width: 25),
                StreamBuilder<EmpDetailState>(
                  stream: _bloc.empDetailState,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    return updateButton(state);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget updateButton(EmpDetailState? state) {
    if (state?.isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state?.isCompleted == true) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        pop(arg: true);
      });
    }
    if (state?.isError == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state?.error?.toString() ?? ""),
        ),
      );
    }
    return AppButton(
      text: "Update",
      width: 100,
      onPressed: () => _onUpdate(),
    );
  }

  Widget deleteButton(EmpDetailState? state) {
    if (state?.isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state?.isCompleted == true) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        pop(arg: true);
      });
    }
    if (state?.isError == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state?.error?.toString() ?? ""),
        ),
      );
    }
    return AppButton(
      text: "Delete",
      width: 100,
      backgroundColor: AppColors.red,
      onPressed: () => _onDelete(),
    );
  }

  void _onUpdate() {
    if (isValidate) {
      final empDetail = widget.details;
      empDetail.varDrName = _nameController.text.trim();
      empDetail.varMobileNo = _mobileController.text.trim();
      empDetail.varReqRemarks = _remarkController.text.trim();
      empDetail.varSpeciality = _specialityController.text.trim();
      empDetail.varCategory = _categoryController.text.trim();
      _bloc.updateEmp(empDetail);
    }
  }

  void _onDelete() {
    _bloc.deleteEmp(widget.details.varEmpCode!);
  }

  bool get isValidate => _formKey.currentState!.validate();
}
