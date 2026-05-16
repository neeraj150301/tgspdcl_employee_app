import 'dart:io';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tgrpdcl_employee_app/core/utils/location_service.dart';
import '../../data/models/attendance_state.dart';

final attendanceProvider =
    StateNotifierProvider<AttendanceNotifier, AttendanceState>(
  (ref) => AttendanceNotifier(),
);

class AttendanceNotifier extends StateNotifier<AttendanceState> {
  AttendanceNotifier() : super(const AttendanceState());

  Future<void> fetchLocation() async {
    try {
      state = state.copyWith(
        locationLoading: true,
        error: null,
      );

      final result = await LocationService.getCurrentLocation();

      state = state.copyWith(
        locationLoading: false,
        locationCaptured: true,
        latitude: result['latitude'],
        longitude: result['longitude'],
        address: result['address'],
      );
    } catch (e) {
      state = state.copyWith(
        locationLoading: false,
        error: e.toString(),
      );
    }
  }

  void setCapturedFace(File file) {
    state = state.copyWith(
      capturedFace: file,
    );
  }

  bool validateAttendance() {
    if (!state.locationCaptured) {
      return false;
    }

    if (state.capturedFace == null) {
      return false;
    }

    return true;
  }

  Future<void> verifyAttendance() async {
    state = state.copyWith(
      verifying: true,
    );

    await Future.delayed(const Duration(seconds: 3));

    final currentTime = _formattedTime();

    if (!state.checkedIn) {
      state = state.copyWith(
        verifying: false,
        success: true,
        checkedIn: true,
        faceMatched: true,
        checkInTime: currentTime,
      );
    } else {
      state = state.copyWith(
        verifying: false,
        success: true,
        checkOutTime: currentTime,
      );
    }
  }

  String _formattedTime() {
    final now = DateTime.now();

    final hour = now.hour > 12 ? now.hour - 12 : now.hour;

    final minute = now.minute.toString().padLeft(2, '0');

    final period = now.hour >= 12 ? 'PM' : 'AM';

    return '$hour:$minute $period';
  }
}