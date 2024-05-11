import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list/providers/router_provider.dart';
import 'package:task_list/repositories/task_repository/models/task_model.dart';
import 'package:task_list/repositories/task_repository/provider.dart';
import 'package:task_list/theme/app_images.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            child: task.isDone
                ? const Image(
                    image: AppImages.done,
                    width: 32,
                  )
                : const Image(
                    image: AppImages.circle,
                    width: 32,
                  ),
            onTap: () async {
              (await ref.read(tasksRepositoryProvider.future)).add(
                Task()
                  ..id = task.id
                  ..title = task.title
                  ..isDone = !task.isDone,
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                task.title,
                style: task.isDone
                    ? TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Theme.of(context).colorScheme.outline,
                        decorationThickness: 1.0,
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 18,
                      )
                    : Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
              ),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
            ),
            child: SizedBox(
              width: 30,
              child: Text(
                'home.edit'.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: () {
              context.go('${Routes.editTask}/${task.id}');
            },
          ),
        ],
      ),
    );
  }
}
