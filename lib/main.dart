import 'package:e_cubox_assesment/core/api_config/api_const.dart';
import 'package:flutter/material.dart';

import 'core/api_config/rest_client.dart';
import 'core/app_router/route_manager.dart';
import 'core/constant/global_const.dart';
import 'core/theme/app_theme.dart';
import 'src/features/employee/presentation/employee_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  RestClient.getInstance(baseUrl: ApiConst.baseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteManager.onGenerateRoute,
      title: "E-Cubix Assessment",
      theme: AppTheme.getAppTheme(),
      home: const EmployeeScreen(),
    );
  }
}
