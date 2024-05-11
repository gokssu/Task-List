import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.text,
    required this.onPressed,
    super.key,
    this.color,
    this.disabledColor,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.symmetric(vertical: 16),
  });
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: padding ?? const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            shadowColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: color ?? Theme.of(context).colorScheme.primary,
            backgroundColor: color ?? Theme.of(context).colorScheme.primaryContainer,
            disabledForegroundColor: disabledColor ?? Theme.of(context).colorScheme.outline,
            disabledBackgroundColor: disabledColor ?? Theme.of(context).colorScheme.outline,
          ),
          onPressed: onPressed,
          child: SizedBox(
            width: double.maxFinite,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
            ),
          ),
        ),
      );
}
