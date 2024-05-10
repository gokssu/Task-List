import 'package:task_list/interface/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
      resizeToAvoidBottomInset: true,
      padding: const EdgeInsets.all(10),
      childBody: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ]),
    );
  }
}
