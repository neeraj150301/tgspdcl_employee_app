import 'package:flutter/material.dart';
import 'package:tgrpdcl_employee_app/core/theme/app_theme.dart';

///
/// SECTION CARD
///
class SectionCard extends StatelessWidget {
  final String title;
  // final IconData icon;
  final List<Widget> children;

  const SectionCard({
    super.key,
    required this.title,
    // required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          /// HEADER
          ///
          Row(
            children: [
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     color: AppTheme.primaryContainer.withValues(alpha: 0.08),
              //     borderRadius: BorderRadius.circular(14),
              //   ),
              //   // child: Icon(icon, color: AppTheme.primaryContainer),
              // ),
              // const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),

          const SizedBox(height: 22),

          ...children,
        ],
      ),
    );
  }
}

///
/// INFO TILE
///
class InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const InfoTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///
          /// ICON
          ///
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryContainer, size: 22),
          ),

          const SizedBox(width: 16),

          ///
          /// CONTENT
          ///
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
