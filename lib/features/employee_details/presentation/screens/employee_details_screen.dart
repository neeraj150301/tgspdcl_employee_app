import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tgrpdcl_employee_app/features/employee_details/presentation/widgets/section_card.dart';
import '../../../../core/theme/app_theme.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  const EmployeeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        title: const Text("Employee Details"),
        centerTitle: false,
      ),
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
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.18),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ///
                  /// PROFILE IMAGE
                  ///
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.30),
                        width: 2,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 52,
                      backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/handsome-indian-man-meditating-under-tree-27166536.jpg?w=576',
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  ///
                  /// NAME
                  ///
                  Text(
                    'Neeraj Sharma',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  ///
                  /// DESIGNATION
                  ///
                  Text(
                    'Line Inspector',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.82),
                    ),
                  ),

                  const SizedBox(height: 16),

                  ///
                  /// EMPLOYEE ID CHIP
                  ///
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'EMP ID • 1002045',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  // const SizedBox(height: 8),

                  // ///
                  // /// STATUS CHIP
                  // ///
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 14,
                  //     vertical: 8,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.green.withValues(alpha: 0.18),
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       const Icon(
                  //         Icons.check_circle,
                  //         color: Colors.white,
                  //         size: 18,
                  //       ),

                  //       const SizedBox(width: 8),

                  //       Text(
                  //         'Active Employee',
                  //         style: Theme.of(context).textTheme.bodySmall
                  //             ?.copyWith(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w700,
                  //             ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            ///
            /// PERSONAL DETAILS
            ///
            SectionCard(
              title: 'Personal Information',
              // icon: Icons.person_rounded,
              children: const [
                InfoTile(
                  label: 'Full Name',
                  value: 'Neeraj Sharma',
                  icon: Icons.badge_rounded,
                ),

                InfoTile(
                  label: 'Father Name',
                  value: 'Deepak Sharma',
                  icon: Icons.family_restroom,
                ),

                InfoTile(
                  label: 'Date of Birth',
                  value: '14 May 1992',
                  icon: Icons.cake_rounded,
                ),

                InfoTile(
                  label: 'Gender',
                  value: 'Male',
                  icon: Icons.male_rounded,
                ),

                InfoTile(
                  label: 'Blood Group',
                  value: 'B+',
                  icon: Icons.bloodtype_rounded,
                ),
              ],
            ),

            const SizedBox(height: 18),

            ///
            /// CONTACT DETAILS
            ///
            SectionCard(
              title: 'Contact Information',
              // icon: Icons.call_rounded,
              children: const [
                InfoTile(
                  label: 'Phone Number',
                  value: '+91 9876543210',
                  icon: Icons.phone_rounded,
                ),

                InfoTile(
                  label: 'Email Address',
                  value: 'neeraj.sharma@gmail.com',
                  icon: Icons.email_rounded,
                ),

                InfoTile(
                  label: 'Address',
                  value: 'Hyderabad, Telangana',
                  icon: Icons.location_on_rounded,
                ),
              ],
            ),

            const SizedBox(height: 18),

            ///
            /// EMPLOYMENT DETAILS
            ///
            SectionCard(
              title: 'Employment Details',
              // icon: Icons.work_rounded,
              children: const [
                InfoTile(
                  label: 'Department',
                  value: 'Operations',
                  icon: Icons.apartment_rounded,
                ),

                InfoTile(
                  label: 'Designation',
                  value: 'Line Inspector',
                  icon: Icons.work_outline,
                ),

                InfoTile(
                  label: 'Date of Joining',
                  value: '10 June 2018',
                  icon: Icons.calendar_today_rounded,
                ),

                InfoTile(
                  label: 'Date of Promotion',
                  value: '05 January 2024',
                  icon: Icons.trending_up_rounded,
                ),

                InfoTile(
                  label: 'Office',
                  value: 'TGSPDCL Circle Office',
                  icon: Icons.business_rounded,
                ),
              ],
            ),

            const SizedBox(height: 18),

            ///
            /// SERVICE DETAILS
            ///
            SectionCard(
              title: 'Service Information',
              // icon: Icons.verified_user_rounded,
              children: const [
                InfoTile(
                  label: 'Employee Type',
                  value: 'Permanent',
                  icon: Icons.workspace_premium,
                ),

                InfoTile(
                  label: 'Pay Scale',
                  value: '₹44,900 - ₹1,42,400',
                  icon: Icons.account_balance_wallet,
                ),

                InfoTile(
                  label: 'Service Years',
                  value: '8 Years',
                  icon: Icons.timelapse_rounded,
                ),

                InfoTile(
                  label: 'Reporting Officer',
                  value: 'Ramesh Kumar',
                  icon: Icons.groups_rounded,
                ),
              ],
            ),

            const SizedBox(height: 20),

            ///
            /// ACTION BUTTONS
            ///
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryContainer,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: const Icon(Icons.download_rounded),
                      label: const Text('Download ID'),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showLogoutDialog(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppTheme.error),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: const Icon(Icons.logout_rounded, color: Colors.red),
                      label: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showLogoutDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withValues(alpha: 0.08),
            //     blurRadius: 24,
            //     offset: const Offset(0, 10),
            //   ),
            // ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///
              /// ICON
              ///
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                  size: 30,
                ),
              ),

              const SizedBox(height: 18),

              ///
              /// TITLE
              ///
              Text(
                'Logout Account?',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 8),

              ///
              /// DESCRIPTION
              ///
              Text(
                'Are you sure you want to logout?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 18),

              ///
              /// BUTTONS
              ///
              Row(
                children: [
                  ///
                  /// CANCEL
                  ///
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: AppTheme.outline.withValues(alpha: 0.30),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  ///
                  /// LOGOUT
                  ///
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () async {
                          ///
                          /// CLOSE DIALOG
                          ///
                          Navigator.pop(context);

                          ///
                          /// CLEAR SESSION / TOKEN
                          ///
                          // await storage.deleteAll();

                          ///
                          /// NAVIGATE TO LOGIN
                          ///
                          context.goNamed('login');

                          ///
                          /// TEMP MESSAGE
                          ///
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Logged out successfully'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
