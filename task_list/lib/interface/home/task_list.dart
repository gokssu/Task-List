import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list/interface/home/task_card.dart';
import 'package:task_list/repositories/task_repository/provider.dart';

class TaskList extends HookConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);
    return taskList.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, s) => Text(e.toString()),
      data: (data) {
        return (data.isEmpty)
            ? Center(
                child: Text(
                  'home.no_task'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return TaskCard(
                    task: item,
                  );
                },
              );
      },
    );
  }
}
