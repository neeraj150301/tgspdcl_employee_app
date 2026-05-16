import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:tgrpdcl_employee_app/features/attendance/presentation/widgets/coordinate_card.dart';
import 'package:tgrpdcl_employee_app/features/attendance/presentation/widgets/header_card.dart';
import '../../../../core/theme/app_theme.dart';
import '../provider/attendance_provider.dart';
import 'face_capture_screen.dart';

class AttendanceActionScreen extends ConsumerStatefulWidget {
  const AttendanceActionScreen({super.key});

  @override
  ConsumerState<AttendanceActionScreen> createState() =>
      _AttendanceActionScreenState();
}

class _AttendanceActionScreenState
    extends ConsumerState<AttendanceActionScreen> {
  @override
  void initState() {
    super.initState();
  _listenLocationErrors();
    Future.microtask(() {
      ref.read(attendanceProvider.notifier).fetchLocation();
    });
  }

  void _listenLocationErrors() {
  ref.listenManual(
    attendanceProvider,
    (previous, next) async {
      if (next.error == 'LOCATION_DISABLED') {
        _showLocationDialog();
      }
    },
  );
}

Future<void> _showLocationDialog() async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///
                /// ICON
                ///
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(
                      alpha: 0.10,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_off_rounded,
                    color: Colors.orange,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 22),

                ///
                /// TITLE
                ///
                Text(
                  'Enable Location',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),

                const SizedBox(height: 12),

                ///
                /// DESCRIPTION
                ///
                Text(
                  'Location access is required to mark attendance. Please enable device location services to continue.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                        color: AppTheme.onSurfaceVariant,
                      ),
                ),

                const SizedBox(height: 28),

                ///
                /// ENABLE BUTTON
                ///
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppTheme.primaryContainer,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                      ///
                      /// OPEN LOCATION SETTINGS
                      ///
                      await Geolocator.openLocationSettings();

                      ///
                      /// CHECK AGAIN
                      ///
                      final enabled =
                          await Geolocator
                              .isLocationServiceEnabled();

                      if (enabled && mounted) {
                        Navigator.pop(context);

                        ref
                            .read(
                              attendanceProvider
                                  .notifier,
                            )
                            .fetchLocation();
                      }
                    },
                    icon: const Icon(
                      Icons.my_location_rounded,
                    ),
                    label: const Text(
                      'Enable Location',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(attendanceProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Attendance Verification'),
        backgroundColor: AppTheme.background,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          ///
          /// HEADER CARD
          ///
          HeaderCard(
            title: state.checkedIn
                ? "Check Out Verfication"
                : "Check In Verification",
            subTitle: "Location and face verification is required",
            icon: Icons.fingerprint_rounded,
          ),

          const SizedBox(height: 18),

          ///
          /// LOCATION SECTION
          ///
          if (state.locationLoading)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Fetching current GPS location...'),
                ],
              ),
            )
          else if (state.locationCaptured)
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.green.withValues(alpha: 0.15)),
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
                  /// TOP ROW
                  ///
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.location_on_rounded,
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location Captured',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),

                            // const SizedBox(height: 4),
                            Text(
                              'GPS verified successfully',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppTheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  ///
                  /// ADDRESS
                  ///
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.apartment_rounded,
                          color: AppTheme.primaryContainer,
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            state.address ?? '',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  ///
                  /// COORDINATES
                  ///
                  Row(
                    children: [
                      Expanded(
                        child: CoordinateCard(
                          title: 'Latitude',
                          value: state.latitude!.toStringAsFixed(5),
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: CoordinateCard(
                          title: 'Longitude',
                          value: state.longitude!.toStringAsFixed(5),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  ///
                  /// MAP
                  ///
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      height: 220,
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(
                            state.latitude!,
                            state.longitude!,
                          ),
                          initialZoom: 15,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.tgspdcl.app',
                          ),

                          MarkerLayer(
                            markers: [
                              Marker(
                                point: LatLng(
                                  state.latitude!,
                                  state.longitude!,
                                ),
                                width: 60,
                                height: 60,
                                child: const Icon(
                                  Icons.location_pin,
                                  size: 45,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 18),

          ///
          /// FACE CAPTURE
          ///
          GestureDetector(
            onTap: () async {
              final file = await Navigator.push<File>(
                context,
                MaterialPageRoute(builder: (_) => const FaceCaptureScreen()),
              );

              if (file != null) {
                ref.read(attendanceProvider.notifier).setCapturedFace(file);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(22),
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
                children: [
                  if (state.capturedFace == null)
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryContainer.withValues(
                              alpha: 0.08,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 24,
                            color: AppTheme.primaryContainer,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Capture Face',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),

                        Text(
                          'Front camera verification is required',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppTheme.onSurfaceVariant),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.file(
                            state.capturedFace!,
                            height: 240,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green),

                            const SizedBox(width: 8),

                            Text(
                              'Face Captured Successfully',
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          ///
          /// VERIFYING LOADER
          ///
          if (state.verifying)
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  const CircularProgressIndicator(),

                  const SizedBox(height: 20),

                  Text(
                    'Verifying Face Identity...',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Text(
                    'Matching with employee records',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 18),

          ///
          /// SUBMIT BUTTON
          ///
          SizedBox(
            height: 58,
            child: ElevatedButton(
              onPressed: state.verifying
                  ? null
                  : () async {
                      final valid = ref
                          .read(attendanceProvider.notifier)
                          .validateAttendance();

                      if (!valid) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please capture location and face before submitting',
                            ),
                          ),
                        );

                        return;
                      }

                      await ref
                          .read(attendanceProvider.notifier)
                          .verifyAttendance();

                      if (context.mounted) {
                        showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          builder: (_) {
                            return Container(
                              padding: const EdgeInsets.all(28),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(32),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.green.withValues(
                                        alpha: 0.1,
                                      ),
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
                                    'Attendance Logged Successfully',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontWeight: FontWeight.w800),
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    'Your attendance has been verified successfully.',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppTheme.onSurfaceVariant,
                                        ),
                                  ),

                                  const SizedBox(height: 26),

                                  SizedBox(
                                    width: double.infinity,
                                    height: 56,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppTheme.primary,
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        context.pop();
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
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryContainer,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                state.checkedIn ? 'VERIFY & CHECK OUT' : 'VERIFY & CHECK IN',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}


