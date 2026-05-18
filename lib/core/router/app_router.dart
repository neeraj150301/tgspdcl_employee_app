import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgrpdcl_employee_app/features/employee_details/presentation/screens/employee_details_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/attendance/presentation/screens/attendance_action_screen.dart';
import '../../features/attendance/presentation/screens/attendance_calendar_screen.dart';
import '../../features/leave/presentation/screens/leave_management_screen.dart';
import '../../features/payslip/presentation/screens/payslip_screen.dart';
import '../../features/service_book/presentation/screens/service_book_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: 'attendance',
            name: 'attendanceAction',
            builder: (context, state) => const AttendanceActionScreen(),
          ),
          GoRoute(
            path: 'attendance-calendar',
            name: 'attendanceCalendar',
            builder: (context, state) => const AttendanceCalendarScreen(),
          ),
          GoRoute(
            path: 'leave',
            name: 'leaveManagement',
            builder: (context, state) => const LeaveManagementScreen(),
          ),
          GoRoute(
            path: 'payslip',
            name: 'payslip',
            builder: (context, state) => const PayslipScreen(),
          ),
          GoRoute(
            path: 'service-book',
            name: 'serviceBook',
            builder: (context, state) => const ServiceBookScreen(),
          ),
          GoRoute(
            path: 'employee-details',
            name: 'employeeDetails',
            builder: (context, state) => const EmployeeDetailsScreen(),
          ),
        ]
      ),
    ],
  );
});
