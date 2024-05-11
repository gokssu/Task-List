import 'package:flutter/material.dart';

CustomColors lightCustomColors = const CustomColors(
  proColor: Color(0xffCDE53D),
  proColorBorder: Color(0xff9EB031),
  moneyColor: Color(0xffF2C94C),
);

CustomColors darkCustomColors = const CustomColors(
  proColor: Color(0xffCDE53D),
  proColorBorder: Color(0xff9EB031),
  moneyColor: Color(0xffF2C94C),
);

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.proColor,
    required this.proColorBorder,
    required this.moneyColor,
  });

  final Color? proColor;

  final Color? proColorBorder;
  final Color? moneyColor;

  @override
  CustomColors copyWith({
    Color? proColor,
    Color? proColorBorder,
    Color? moneyColor,
  }) {
    return CustomColors(
      proColor: proColor ?? this.proColor,
      proColorBorder: proColorBorder ?? this.proColorBorder,
      moneyColor: proColorBorder ?? this.moneyColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      proColor: Color.lerp(proColor, other.proColor, t),
      moneyColor: Color.lerp(proColor, other.moneyColor, t),
      proColorBorder: Color.lerp(proColorBorder, other.proColorBorder, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
