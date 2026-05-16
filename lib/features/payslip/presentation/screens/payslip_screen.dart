import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class PayslipScreen extends StatefulWidget {
  const PayslipScreen({super.key});

  @override
  State<PayslipScreen> createState() => _PayslipScreenState();
}

class _PayslipScreenState extends State<PayslipScreen> {
  String selectedMonth = 'April 2026';

  final List<String> months = [
    'April 2026',
    'March 2026',
    'February 2026',
    'January 2026',
    'December 2025',
  ];

  bool isDownloading = false;

  Future<void> downloadPayslip() async {
    setState(() {
      isDownloading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isDownloading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Payslip for $selectedMonth downloaded successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Payslip'),
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
                //     blurRadius: 14,
                //     offset: const Offset(0, 5),
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
                          Icons.receipt_long_rounded,
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
                              'Neeraj Sharma',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),

                            Text(
                              'Payroll & salary summary',
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
                  /// NET SALARY CARD
                  ///
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        // Text(
                        //   'Net Salary',
                        //   style: Theme.of(context).textTheme.bodyMedium
                        //       ?.copyWith(
                        //         color: Colors.white.withValues(alpha: 0.82),
                        //       ),
                        // ),

                        // const SizedBox(height: 12),
                        Text(
                          '₹ 62,400',
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                        ),

                        const SizedBox(height: 5),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 18,
                              ),

                              const SizedBox(width: 8),

                              Text(
                                'Salary Credited',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            ///
            /// EMPLOYEE INFO
            ///
            // Container(
            //   padding: const EdgeInsets.all(22),
            //   decoration: _cardDecoration(),
            //   child: Row(
            //     children: [
            //       CircleAvatar(
            //         radius: 34,
            //         backgroundColor: AppTheme.primaryContainer.withValues(
            //           alpha: 0.10,
            //         ),
            //         child: const Icon(
            //           Icons.person,
            //           color: AppTheme.primaryContainer,
            //           size: 36,
            //         ),
            //       ),

            //       const SizedBox(width: 18),

            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'John Doe',
            //               style: Theme.of(context).textTheme.titleMedium
            //                   ?.copyWith(fontWeight: FontWeight.w800),
            //             ),

            //             const SizedBox(height: 6),

            //             Text(
            //               'Line Inspector',
            //               style: Theme.of(context).textTheme.bodyMedium
            //                   ?.copyWith(color: AppTheme.onSurfaceVariant),
            //             ),

            //             const SizedBox(height: 6),

            //             Text(
            //               'EMP ID • 1002045',
            //               style: Theme.of(context).textTheme.bodySmall
            //                   ?.copyWith(
            //                     fontWeight: FontWeight.w700,
            //                     color: AppTheme.primaryContainer,
            //                   ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // const SizedBox(height: 20),

            ///
            /// MONTH SELECTOR
            ///
            Container(
              padding: const EdgeInsets.all(18),
              decoration: _cardDecoration(),
              child: DropdownButtonFormField<String>(
                initialValue: selectedMonth,
                decoration: const InputDecoration(
                  labelText: 'Select Month',
                  prefixIcon: Icon(Icons.calendar_month_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                items: months
                    .map(
                      (month) =>
                          DropdownMenuItem(value: month, child: Text(month)),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedMonth = value;
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 18),

            ///
            /// SALARY ANALYTICS
            ///
            Row(
              children: [
                Expanded(
                  child: _AnalyticsCard(
                    title: 'Gross',
                    value: '₹71.5K',
                    icon: Icons.account_balance_wallet,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _AnalyticsCard(
                    title: 'Deduction',
                    value: '₹9.1K',
                    icon: Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _AnalyticsCard(
                    title: 'Net',
                    value: '₹62.4K',
                    icon: Icons.payments_rounded,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            ///
            /// EARNINGS
            ///
            _SalarySection(
              title: 'Earnings',
              titleColor: Colors.green,
              items: const [
                _SalaryItem(label: 'Basic Pay', value: '₹ 45,000'),

                _SalaryItem(label: 'Dearness Allowance', value: '₹ 15,000'),

                _SalaryItem(label: 'HRA', value: '₹ 9,000'),

                _SalaryItem(label: 'Other Allowances', value: '₹ 2,500'),
              ],
            ),

            const SizedBox(height: 18),

            ///
            /// DEDUCTIONS
            ///
            _SalarySection(
              title: 'Deductions',
              titleColor: Colors.red,
              items: const [
                _SalaryItem(label: 'Provident Fund', value: '₹ 5,400'),

                _SalaryItem(label: 'Professional Tax', value: '₹ 200'),

                _SalaryItem(label: 'Income Tax', value: '₹ 3,500'),
              ],
            ),

            const SizedBox(height: 18),

            ///
            /// FINAL SUMMARY
            ///
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [AppTheme.primary, AppTheme.primaryContainer],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Final Salary Credited',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.82),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '₹ 62,400',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 8),

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
                      'Slip ID • PSL-APR-2026-1024',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            ///
            /// DOWNLOAD BUTTON
            ///
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton.icon(
                onPressed: isDownloading ? null : downloadPayslip,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryContainer,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                icon: isDownloading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                    : const Icon(Icons.download_rounded),
                label: Text(
                  isDownloading ? 'Downloading...' : 'Download PDF',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(26),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withValues(alpha: 0.04),
      //     blurRadius: 18,
      //     offset: const Offset(0, 8),
      //   ),
      // ],
    );
  }
}

///
/// ANALYTICS CARD
///
class _AnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _AnalyticsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),

          const SizedBox(height: 8),

          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

///
/// SALARY SECTION
///
class _SalarySection extends StatelessWidget {
  final String title;
  final Color titleColor;
  final List<_SalaryItem> items;

  const _SalarySection({
    required this.title,
    required this.titleColor,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: titleColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  title == 'Earnings' ? Icons.trending_up : Icons.trending_down,
                  color: titleColor,
                ),
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: titleColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          ...items,
        ],
      ),
    );
  }
}

class _SalaryItem extends StatelessWidget {
  final String label;
  final String value;

  const _SalaryItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.onSurfaceVariant,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
