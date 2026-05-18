import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tgrpdcl_employee_app/core/theme/app_theme.dart';

///
/// HEADER
///
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('employeeDetails');
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.primary, AppTheme.primaryContainer],
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppTheme.primary.withValues(alpha: 0.18),
          //     blurRadius: 50,
          //     offset: const Offset(0, 10),
          //   ),
          // ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: AppTheme.primary, size: 32),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi 👋',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    'Neeraj Sharma',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Line Inspector • EMP 1002045',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.82),
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white.withValues(alpha: 0.12),
            //     borderRadius: BorderRadius.circular(16),
            //   ),
            //   child: IconButton(
            //     onPressed: () {
            //       context.goNamed('login');
            //     },
            //     icon: const Icon(Icons.logout_rounded, color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
