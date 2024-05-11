import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.text,
    this.onChanged,
    required this.title,
    this.controller,
  });

  final String? text;
  final String title;
  final TextEditingController? controller;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
      borderSide: BorderSide(
        width: 2,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          TextFormField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            initialValue: text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface, //
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: border,
              enabledBorder: border,
              focusedBorder: border,
            ),
            onChanged: (value) {
              if (null != onChanged) {
                onChanged?.call(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
