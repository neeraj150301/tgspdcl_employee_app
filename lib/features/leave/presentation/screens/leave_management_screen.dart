import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tgrpdcl_employee_app/features/attendance/presentation/widgets/header_card.dart';
import '../../../../core/theme/app_theme.dart';

class LeaveManagementScreen extends StatefulWidget {
  const LeaveManagementScreen({super.key});

  @override
  State<LeaveManagementScreen> createState() => _LeaveManagementScreenState();
}

class _LeaveManagementScreenState extends State<LeaveManagementScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _leaveType;

  DateTime? _startDate;
  DateTime? _endDate;

  final _reasonController = TextEditingController();

  File? _selectedFile;
  String? _selectedFileName;

  bool _isSubmitting = false;

  final List<String> _leaveTypes = [
    'Sick Leave',
    'Casual Leave',
    'Earned Leave',
    'Special Leave',
  ];

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _pickDocument() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        _selectedFileName = result.files.single.name;
      });
    }
  }

  Future<void> _pickStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      setState(() {
        _startDate = date;

        if (_endDate != null && _endDate!.isBefore(_startDate!)) {
          _endDate = null;
        }
      });
    }
  }

  Future<void> _pickEndDate() async {
    if (_startDate == null) return;

    final date = await showDatePicker(
      context: context,
      initialDate: _startDate!,
      firstDate: _startDate!,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      setState(() {
        _endDate = date;
      });
    }
  }

  Future<void> _submitLeaveRequest() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_startDate == null || _endDate == null) {
      _showError('Please select leave dates');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isSubmitting = false;
    });

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(28),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///
              /// SUCCESS ICON
              ///
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 58,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Leave Request Submitted',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 10),

              Text(
                'Your leave request has been sent to your reporting manager.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 26),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryContainer,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Back To Dashboard'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  int get _totalDays {
    if (_startDate == null || _endDate == null) {
      return 0;
    }

    return _endDate!.difference(_startDate!).inDays + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Leave'),
        centerTitle: false,
        backgroundColor: AppTheme.background,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          ///
          /// HEADER
          ///
          const HeaderCard(
            title: "Leave Management",
            subTitle: "Apply and manage leaves",
            icon: Icons.event_note_rounded,
          ),

          const SizedBox(height: 18),

          ///
          /// LEAVE BALANCE
          ///
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
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
                  'Leave Balances',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 12),

                const Row(
                  children: [
                    Expanded(
                      child: _BalanceCard(
                        title: 'SL',
                        value: '08',
                        color: Colors.blue,
                      ),
                    ),

                    SizedBox(width: 14),

                    Expanded(
                      child: _BalanceCard(
                        title: 'CL',
                        value: '15',
                        color: Colors.orange,
                      ),
                    ),

                    SizedBox(width: 14),

                    Expanded(
                      child: _BalanceCard(
                        title: 'EL',
                        value: '10',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          ///
          /// FORM
          ///
          Form(
            key: _formKey,
            child: Column(
              children: [
                ///
                /// LEAVE TYPE
                ///
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: _cardDecoration(),
                  child: DropdownButtonFormField<String>(
                    initialValue: _leaveType,
                    decoration: const InputDecoration(
                      labelText: 'Select Leave Type',
                      prefixIcon: Icon(Icons.category_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: AppTheme.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    items: _leaveTypes
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _leaveType = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select leave type';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 18),

                ///
                /// DATE RANGE
                ///
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: _cardDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leave Duration',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Expanded(
                            child: _DateCard(
                              label: 'From Date',
                              value: _startDate == null
                                  ? 'Select'
                                  : '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
                              icon: Icons.calendar_month,
                              onTap: _pickStartDate,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: _DateCard(
                              label: 'To Date',
                              value: _endDate == null
                                  ? 'Select'
                                  : '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
                              icon: Icons.event_available_rounded,
                              onTap: _pickEndDate,
                            ),
                          ),
                        ],
                      ),

                      if (_totalDays > 0) ...[
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryContainer.withValues(
                              alpha: 0.08,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.timelapse_rounded,
                                color: AppTheme.primaryContainer,
                              ),

                              const SizedBox(width: 10),

                              Text(
                                '$_totalDays Day(s) Leave Selected',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: _reasonController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: 'Reason for Leave',
                          hintText: 'Describe your leave reason...',
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.edit_note_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter reason';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      GestureDetector(
                        onTap: _pickDocument,
                        child: Center(
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //     color: AppTheme.outline.withValues(alpha: 0.4),
                            //   ),
                            // ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryContainer.withValues(
                                      alpha: 0.08,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    _selectedFile == null
                                        ? Icons.upload_file_rounded
                                        : Icons.check_circle,
                                    color: _selectedFile == null
                                        ? AppTheme.primaryContainer
                                        : Colors.green,
                                    size: 28,
                                  ),
                                ),

                                const SizedBox(height: 18),

                                Text(
                                  _selectedFileName ??
                                      'Upload Supporting Document',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'PDF, JPG, PNG supported',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: AppTheme.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // ///
                // /// REASON
                // ///
                // Container(
                //   padding: const EdgeInsets.all(22),
                //   decoration: _cardDecoration(),
                //   child: TextFormField(
                //     controller: _reasonController,
                //     maxLines: 5,
                //     decoration: const InputDecoration(
                //       labelText: 'Reason for Leave',
                //       hintText: 'Describe your leave reason...',
                //       alignLabelWithHint: true,
                //       prefixIcon: Padding(
                //         padding: EdgeInsets.only(bottom: 80),
                //         child: Icon(Icons.edit_note_rounded),
                //       ),
                //     ),
                //     validator: (value) {
                //       if (value == null || value.trim().isEmpty) {
                //         return 'Please enter reason';
                //       }
                //       return null;
                //     },
                //   ),
                // ),

                // const SizedBox(height: 20),

                ///
                /// DOCUMENT UPLOAD
                ///
                // GestureDetector(
                //   onTap: _pickDocument,
                //   child: Container(
                //     padding: const EdgeInsets.all(22),
                //     decoration: _cardDecoration(),
                //     child: Column(
                //       children: [
                //         Container(
                //           padding: const EdgeInsets.all(18),
                //           decoration: BoxDecoration(
                //             color: AppTheme.primaryContainer
                //                 .withValues(alpha: 0.08),
                //             shape: BoxShape.circle,
                //           ),
                //           child: Icon(
                //             _selectedFile == null
                //                 ? Icons.upload_file_rounded
                //                 : Icons.check_circle,
                //             color: _selectedFile == null
                //                 ? AppTheme.primaryContainer
                //                 : Colors.green,
                //             size: 38,
                //           ),
                //         ),

                //         const SizedBox(height: 18),

                //         Text(
                //           _selectedFileName ?? 'Upload Supporting Document',
                //           textAlign: TextAlign.center,
                //           style: Theme.of(context).textTheme.titleSmall
                //               ?.copyWith(fontWeight: FontWeight.w700),
                //         ),

                //         const SizedBox(height: 8),

                //         Text(
                //           'PDF, JPG, PNG supported',
                //           style: Theme.of(context).textTheme.bodyMedium
                //               ?.copyWith(color: AppTheme.onSurfaceVariant),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // const SizedBox(height: 20),

                ///
                /// SUMMARY
                ///
                if (_leaveType != null && _totalDays > 0)
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: _cardDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Leave Summary',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),

                        const SizedBox(height: 18),

                        _SummaryRow(label: 'Leave Type', value: _leaveType!),

                        _SummaryRow(
                          label: 'Duration',
                          value: '$_totalDays Day(s)',
                        ),

                        _SummaryRow(
                          label: 'Document',
                          value: _selectedFileName ?? 'Not Attached',
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 30),

                ///
                /// SUBMIT BUTTON
                ///
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitLeaveRequest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryContainer,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text(
                            'Submit Leave Request',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }
}

///
/// BALANCE CARD
///
class _BalanceCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _BalanceCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

///
/// DATE CARD
///
class _DateCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _DateCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.primaryContainer),

            const SizedBox(height: 12),

            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppTheme.onSurfaceVariant),
            ),

            const SizedBox(height: 6),

            Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// SUMMARY ROW
///
class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.onSurfaceVariant),
          ),

          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
