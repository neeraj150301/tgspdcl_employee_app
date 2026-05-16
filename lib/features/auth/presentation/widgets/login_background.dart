import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildBackground() {
  return Stack(
    children: [
      Positioned(
        top: -120,
        left: -80,
        child: _blurCircle(size: 260, color: const Color(0xFF2563EB)),
      ),
      Positioned(
        bottom: -140,
        right: -100,
        child: _blurCircle(size: 300, color: const Color(0xFF1D4ED8)),
      ),
      Positioned(
        top: 250,
        right: -40,
        child: _blurCircle(
          size: 180,
          color: Colors.cyanAccent.withValues(alpha: 0.4),
        ),
      ),
    ],
  );
}

Widget _blurCircle({required double size, required Color color}) {
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color.withValues(alpha: 0.35),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
      child: const SizedBox(),
    ),
  );
}
