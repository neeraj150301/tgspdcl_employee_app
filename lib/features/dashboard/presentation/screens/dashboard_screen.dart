import 'package:flutter/material.dart';
import 'package:tgrpdcl_employee_app/features/dashboard/presentation/widgets/attendance_card.dart';
import 'package:tgrpdcl_employee_app/features/dashboard/presentation/widgets/dash_header.dart';
import 'package:tgrpdcl_employee_app/features/dashboard/presentation/widgets/dash_item.dart';
import 'package:tgrpdcl_employee_app/features/dashboard/presentation/widgets/notice_card.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              const DashboardHeader(),

              const SizedBox(height: 18),

              /// ATTENDANCE CARD
              const AttendanceCard(),

              const SizedBox(height: 18),

              /// QUICK SERVICES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Services',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppTheme.primary,
                    ),
                  ),
                  // TextButton(onPressed: () {}, child: const Text('View All')),
                ],
              ),

              const SizedBox(height: 16),

              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.08,
                ),
                children: dashboardItems,
              ),

              const SizedBox(height: 28),

              /// RECENT NOTICE
              const NoticeCard(),
            ],
          ),
        ),
      ),
    );
  }
}

///
/// DASHBOARD ITEMS
///
final List<Widget> dashboardItems = [
  DashboardItem(
    title: 'Attendance',
    subtitle: 'Daily logs',
    icon: Icons.how_to_reg_rounded,
    color: Colors.blue,
    routeName: 'attendanceCalendar',
  ),
  DashboardItem(
    title: 'Leave',
    subtitle: 'Apply leave',
    icon: Icons.event_note_rounded,
    color: Colors.orange,
    routeName: 'leaveManagement',
  ),
  DashboardItem(
    title: 'Payslip',
    subtitle: 'Salary details',
    icon: Icons.receipt_long_rounded,
    color: Colors.green,
    routeName: 'payslip',
  ),
  DashboardItem(
    title: 'Service Book',
    subtitle: 'Employee record',
    icon: Icons.menu_book_rounded,
    color: Colors.purple,
    routeName: 'serviceBook',
  ),
  DashboardItem(
    title: 'Memo / GOs',
    subtitle: 'Office circulars',
    icon: Icons.campaign_rounded,
    color: Colors.red,
  ),
  DashboardItem(
    title: 'Grievances',
    subtitle: 'Raise issue',
    icon: Icons.report_problem_rounded,
    color: Colors.teal,
  ),
];
