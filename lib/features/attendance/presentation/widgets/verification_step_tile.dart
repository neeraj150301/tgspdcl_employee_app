import 'package:flutter/material.dart';
import 'package:tgrpdcl_employee_app/core/theme/app_theme.dart';

///
/// VERIFICATION TILE
///
class VerificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool success;

  const VerificationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: success
              ? Colors.green.withValues(alpha: 0.2)
              : AppTheme.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: success
                  ? Colors.green.withValues(alpha: 0.1)
                  : AppTheme.primaryContainer.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              success ? Icons.check : icon,
              color: success ? Colors.green : AppTheme.primaryContainer,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
