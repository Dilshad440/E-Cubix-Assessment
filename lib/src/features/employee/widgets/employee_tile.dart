import 'package:e_cubox_assesment/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: AppTextStyle.title.medium.regular),
      subtitle: Text(subtitle, style: AppTextStyle.body.medium.regular),
      onTap: onTap,
    );
  }
}
