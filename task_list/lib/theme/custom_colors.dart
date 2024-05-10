import 'package:flutter/material.dart';

CustomColors lightCustomColors = const CustomColors(
  successColor: Colors.green,
  moreInfo: Color(0xff5E5B67),
);

CustomColors darkCustomColors = const CustomColors(
  successColor: Color(0xff6DFA72),
  moreInfo: Color(0xff5E5B67),
);

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.successColor,
    required this.moreInfo,
  });

  final Color? successColor;

  final Color? moreInfo;

  @override
  CustomColors copyWith({
    Color? successColor,
    Color? moreInfo,
  }) {
    return CustomColors(
      successColor: successColor ?? this.successColor,
      moreInfo: moreInfo ?? this.moreInfo,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      successColor: Color.lerp(successColor, other.successColor, t),
      moreInfo: Color.lerp(moreInfo, other.moreInfo, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
