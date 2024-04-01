import 'package:e_cubox_assesment/core/app_router/route_consts.dart';
import 'package:e_cubox_assesment/src/features/employee/models/response/employee_response.dart';
import 'package:e_cubox_assesment/src/features/employee_detail/presentation/employee_details_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConsts.employeeDetail:
        final details = settings.arguments as Details;
        return MyCustomRoute(
          builder: (context) => EmployeeDetailsScreen(details: details),
        );
    }
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('404!!\nRoutes not found:=> ${settings.name}', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({required super.builder, super.settings, this.transition}) : super(fullscreenDialog: false);
  final Widget? transition;

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return transition ?? FadeTransition(opacity: animation, child: child);
  }
}
