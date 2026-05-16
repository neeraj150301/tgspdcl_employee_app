import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tgrpdcl_employee_app/core/theme/app_theme.dart';

///
/// SUCCESS BOTTOM SHEET
///
class SuccessBottomSheet extends StatelessWidget {
  final bool checkedIn;

  const SuccessBottomSheet({super.key, required this.checkedIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
              size: 60,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            checkedIn ? 'Attendance Logged' : 'Check Out Successful',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 8),

          Text(
            checkedIn
                ? 'Your attendance has been marked successfully.'
                : 'Your work session has been closed successfully.',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.onSurfaceVariant),
          ),

          const SizedBox(height: 26),

          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context.pop();
              },
              child: const Text('Back to Dashboard'),
            ),
          ),
        ],
      ),
    );
  }
}
