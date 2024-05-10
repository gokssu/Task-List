import 'package:flutter/material.dart';

T themeExtension<T>(BuildContext context) => Theme.of(context).extension<T>() ?? (throw Error());
