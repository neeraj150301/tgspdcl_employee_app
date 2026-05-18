import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tgrpdcl_employee_app/core/theme/app_theme.dart';

///
/// ATTENDANCE CARD
///
class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppTheme.outlineVariant.withValues(alpha: 0.5),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withValues(alpha: 0.04),
        //     blurRadius: 22,
        //     offset: const Offset(0, 8),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          /// TOP ROW
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppTheme.primaryContainer.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.fingerprint_rounded,
                  color: AppTheme.primaryContainer,
                  size: 25,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Attendance',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primary,
                      ),
                    ),

                    Text(
                      'Checked In at 09:12 AM',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Present',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// TIME BOXES
          Row(
            children: [
              Expanded(
                child: _TimeInfoCard(
                  title: 'Check In',
                  value: '09:12 AM',
                  icon: Icons.login_rounded,
                  color: Colors.green,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: _TimeInfoCard(
                  title: 'Check Out',
                  value: '-- : --',
                  icon: Icons.logout_rounded,
                  color: Colors.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// ACTION BUTTONS
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.goNamed('attendanceAction');
                  },
                  icon: const Icon(Icons.login_rounded),
                  label: const Text('Check In'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryContainer,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    context.goNamed('attendanceAction');
                  },
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Check Out'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.primaryContainer,
                    side: const BorderSide(color: AppTheme.primaryContainer),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///
/// TIME CARD
///
class _TimeInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _TimeInfoCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),

          const SizedBox(height: 10),

          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.onSurfaceVariant),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppTheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
