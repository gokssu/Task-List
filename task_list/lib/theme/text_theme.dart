import 'package:flutter/material.dart';

const defaultTextSize = 14.0;

final lightTextTheme = ThemeData.light().textTheme.copyWith(
      headlineLarge: const TextStyle(
        fontSize: defaultTextSize * 2,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleLarge: const TextStyle(
        fontSize: defaultTextSize * 1.3,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleMedium: const TextStyle(
        fontSize: defaultTextSize,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: const TextStyle(
        fontSize: defaultTextSize - 2,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: const TextStyle(
        fontSize: defaultTextSize,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: const TextStyle(
        fontSize: defaultTextSize - 2,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: const TextStyle(
        fontSize: defaultTextSize,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelSmall: const TextStyle(
        fontSize: defaultTextSize - 2,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );

final darkTextTheme = ThemeData.dark().textTheme.copyWith(
      headlineLarge: const TextStyle(
        fontSize: defaultTextSize * 2,
        fontWeight: FontWeight.w600,
        color: Colors.blueAccent,
      ),
      titleLarge: const TextStyle(
        fontSize: defaultTextSize * 1.3,
        fontWeight: FontWeight.w600,
        color: Colors.blueAccent,
      ),
      titleMedium: const TextStyle(
        fontSize: defaultTextSize,
        height: 1.5,
        color: Colors.blueAccent,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: const TextStyle(
        fontSize: defaultTextSize - 2,
        color: Colors.blueAccent,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: const TextStyle(
        fontSize: defaultTextSize,
        color: Colors.blueAccent,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: const TextStyle(
        fontSize: defaultTextSize - 2,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: const TextStyle(
        fontSize: defaultTextSize,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelSmall: const TextStyle(
        fontSize: defaultTextSize - 2,
        color: Colors.blueAccent,
        fontWeight: FontWeight.w500,
      ),
    );
