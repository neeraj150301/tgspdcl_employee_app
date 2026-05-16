import 'dart:io';

class AttendanceState {
  final bool loading;
  final bool locationLoading;
  final bool verifying;
  final bool success;

  final double? latitude;
  final double? longitude;
  final String? address;

  final File? capturedFace;

  final bool faceMatched;
  final bool locationCaptured;

  final bool checkedIn;
  final String? checkInTime;
  final String? checkOutTime;

  final String? error;

  const AttendanceState({
    this.loading = false,
    this.locationLoading = false,
    this.verifying = false,
    this.success = false,
    this.latitude,
    this.longitude,
    this.address,
    this.capturedFace,
    this.faceMatched = false,
    this.locationCaptured = false,
    this.checkedIn = false,
    this.checkInTime,
    this.checkOutTime,
    this.error,
  });

  AttendanceState copyWith({
    bool? loading,
    bool? locationLoading,
    bool? verifying,
    bool? success,
    double? latitude,
    double? longitude,
    String? address,
    File? capturedFace,
    bool? faceMatched,
    bool? locationCaptured,
    bool? checkedIn,
    String? checkInTime,
    String? checkOutTime,
    String? error,
  }) {
    return AttendanceState(
      loading: loading ?? this.loading,
      locationLoading: locationLoading ?? this.locationLoading,
      verifying: verifying ?? this.verifying,
      success: success ?? this.success,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      capturedFace: capturedFace ?? this.capturedFace,
      faceMatched: faceMatched ?? this.faceMatched,
      locationCaptured: locationCaptured ?? this.locationCaptured,
      checkedIn: checkedIn ?? this.checkedIn,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      error: error ?? this.error,
    );
  }
}