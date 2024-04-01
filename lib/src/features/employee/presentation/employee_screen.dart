import 'package:e_cubox_assesment/core/components/app_textfield.dart';
import 'package:e_cubox_assesment/core/components/common_appbbar.dart';
import 'package:e_cubox_assesment/src/features/employee/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_router/route_consts.dart';
import '../../../../core/constant/global_const.dart';
import '../state/employee_state.dart';
import '../widgets/employee_tile.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  late EmployeeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = EmployeeBloc();
    _bloc.getEmpFromLocal();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Employee List",
        actions: [
          IconButton(
            onPressed: () {
              _bloc.getEmployee();
            },
            icon: const Icon(Icons.refresh, size: 35),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppTextField(
              hintText: "Search By Name",
              prefix: const Icon(Icons.search),
              onChanged: (val) {
                _bloc.getEmpOnSearch(val);
              },
            ),
            Expanded(
              child: StreamBuilder<EmployeeState>(
                stream: _bloc.employee,
                builder: (context, snapshot) {
                  final EmployeeState? state = snapshot.data;
                  if (state?.isLoading ?? false) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state?.isError ?? false) {
                    return const Center(
                      child: Text("Error Occurred"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state?.data?.employee?.length ?? 0,
                    itemBuilder: (context, index) {
                      final employee = state?.data?.employee?[index];
                      return EmployeeTile(
                        title: employee?.varDrName ?? "",
                        subtitle: employee?.varCity ?? "",
                        onTap: () async {
                          final result = await push(RouteConsts.employeeDetail, arg: employee);
                          if (result == true) {
                            _bloc.getEmpFromLocal();
                          }
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
