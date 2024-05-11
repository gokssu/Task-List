import 'package:go_router/go_router.dart';
import 'package:task_list/interface/home/pro_card.dart';
import 'package:task_list/interface/home/profile_card.dart';
import 'package:task_list/interface/home/task_list.dart';
import 'package:task_list/interface/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list/providers/router_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        onPressed: () {
          context.push(Routes.addTask);
        },
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
      ),
      resizeToAvoidBottomInset: true,
      childBody: const Column(children: [
        ProfileCard(),
        ProCard(),
        Expanded(
          child: TaskList(),
        )
      ]),
    );
  }
}
