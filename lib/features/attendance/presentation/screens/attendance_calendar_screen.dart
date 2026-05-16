import 'package:flutter/material.dart';
import 'package:tgrpdcl_employee_app/features/attendance/presentation/widgets/legend_chip.dart';
import '../../../../core/theme/app_theme.dart';

class AttendanceCalendarScreen extends StatefulWidget {
  const AttendanceCalendarScreen({super.key});

  @override
  State<AttendanceCalendarScreen> createState() =>
      _AttendanceCalendarScreenState();
}

class _AttendanceCalendarScreenState extends State<AttendanceCalendarScreen> {
  int selectedDay = 12;

  final List<String> weekDays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  final Map<int, String> attendanceStatus = {
    1: 'present',
    2: 'present',
    3: 'present',
    4: 'present',
    5: 'absent',
    6: 'present',
    7: 'holiday',
    8: 'leave',
    9: 'present',
    10: 'present',
    11: 'present',
    12: 'present',
    13: 'present',
    14: 'holiday',
    15: 'present',
    16: 'present',
    17: 'present',
    18: 'present',
    19: 'present',
    20: 'leave',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Calendar'),
        centerTitle: false,
        backgroundColor: AppTheme.background,
      ),
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          children: [
            ///
            /// HEADER
            ///
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppTheme.primary, AppTheme.primaryContainer],
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: AppTheme.primary.withValues(alpha: 0.18),
                //     blurRadius: 24,
                //     offset: const Offset(0, 10),
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  ///
                  /// TOP ROW
                  ///
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attendance History',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),

                            Text(
                              'Monthly attendance overview',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.82),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  ///
                  /// MONTH SELECTOR
                  ///
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _MonthButton(icon: Icons.chevron_left, onTap: () {}),

                        Text(
                          'May 2026',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                        ),

                        _MonthButton(icon: Icons.chevron_right, onTap: () {}),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  ///
                  /// ATTENDANCE %
                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Attendance Rate',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.82),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Text(
                        '92%',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            ///
            /// SUMMARY CARDS
            ///
            Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    title: 'Present',
                    value: '22',
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _SummaryCard(
                    title: 'Absent',
                    value: '02',
                    icon: Icons.cancel_rounded,
                    color: Colors.red,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _SummaryCard(
                    title: 'Leave',
                    value: '03',
                    icon: Icons.event_busy_rounded,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 14),

                Expanded(
                  child: _SummaryCard(
                    title: 'Holiday',
                    value: '01',
                    icon: Icons.festival,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            ///
            /// CALENDAR
            ///
            Container(
              padding: const EdgeInsets.all(18),
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
                children: [
                  ///
                  /// WEEK DAYS
                  ///
                  Row(
                    children: weekDays
                        .map(
                          (day) => Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              day,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: AppTheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 16),

                  ///
                  /// GRID
                  ///
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 31,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      final day = index + 1;

                      final status = attendanceStatus[day];

                      final isSelected = selectedDay == day;

                      Color bgColor = AppTheme.surfaceContainerLow;

                      Color textColor = AppTheme.onSurfaceVariant;

                      // Color dotColor = Colors.grey;

                      if (status == 'present') {
                        bgColor = Colors.green.withValues(alpha: 0.10);

                        textColor = Colors.green.shade800;

                        // dotColor = Colors.green;
                      } else if (status == 'absent') {
                        bgColor = Colors.red.withValues(alpha: 0.10);

                        textColor = Colors.red.shade700;

                        // dotColor = Colors.red;
                      } else if (status == 'leave') {
                        bgColor = Colors.blue.withValues(alpha: 0.10);

                        textColor = Colors.blue.shade700;

                        // dotColor = Colors.blue;
                      } else if (status == 'holiday') {
                        bgColor = Colors.orange.withValues(alpha: 0.10);

                        textColor = Colors.orange.shade700;

                        // dotColor = Colors.orange;
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.primaryContainer
                                : bgColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppTheme.primaryContainer
                                          .withValues(alpha: 0.22),
                                      blurRadius: 16,
                                      offset: const Offset(0, 6),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                day.toString(),
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : textColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),

                              // const SizedBox(height: 6),
                              // Container(
                              //   height: 4,
                              //   width: 4,
                              //   decoration: BoxDecoration(
                              //     color: isSelected ? Colors.white : dotColor,
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            ///
            /// SELECTED DAY DETAILS
            ///
            Container(
              padding: const EdgeInsets.all(18),
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
                  Text(
                    '$selectedDay May 2026',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const _AttendanceDetailRow(
                    label: 'Check In',
                    value: '09:12 AM',
                    icon: Icons.login_rounded,
                    color: Colors.green,
                  ),

                  SizedBox(height: 12),

                  const _AttendanceDetailRow(
                    label: 'Check Out',
                    value: '06:04 PM',
                    icon: Icons.logout_rounded,
                    color: Colors.orange,
                  ),

                  SizedBox(height: 12),

                  const _AttendanceDetailRow(
                    label: 'Working Hours',
                    value: '8h 52m',
                    icon: Icons.timelapse_rounded,
                    color: Colors.blue,
                  ),

                  SizedBox(height: 12),

                  const _AttendanceDetailRow(
                    label: 'Status',
                    value: 'Present',
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            ///
            /// LEGEND
            ///
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: const [
                LegendChip(label: 'Present', color: Colors.green),

                LegendChip(label: 'Absent', color: Colors.red),

                LegendChip(label: 'Leave', color: Colors.blue),

                LegendChip(label: 'Holiday', color: Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///
/// MONTH BUTTON
///
class _MonthButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _MonthButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

///
/// SUMMARY CARD
///
class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),

          const SizedBox(height: 5),

          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),

          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

///
/// ATTENDANCE DETAIL ROW
///
class _AttendanceDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _AttendanceDetailRow({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.onSurfaceVariant),
          ),
        ),

        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
