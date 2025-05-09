import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list/interface/widgets/app_bar.dart';
import 'package:task_list/interface/widgets/app_text_field.dart';
import 'package:task_list/interface/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list/interface/widgets/button.dart';
import 'package:task_list/providers/router_provider.dart';
import 'package:task_list/repositories/task_repository/models/task_model.dart';
import 'package:task_list/repositories/task_repository/provider.dart';

class EditTaskScreen extends HookConsumerWidget {
  const EditTaskScreen({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editTaskName = useState<String>('');
    final task = ref.watch(taskProvider(id));
    return BasePage(
        padding: const EdgeInsets.all(10),
        appBar: AppBarNav(
          title: 'edit.title'.tr(),
          back: true,
        ),
        resizeToAvoidBottomInset: true,
        childBody: task.when(
          data: (data) {
            return data != null
                ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: AppTextField(
                      text: data.title,
                      title: 'app.task_name'.tr(),
                      onChanged: (value) {
                        editTaskName.value = value;
                      },
                    )),
                    Button(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      text: 'app.done'.tr(),
                      color: Theme.of(context).colorScheme.primary,
                      disabledColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                      onPressed: editTaskName.value.isNotEmpty
                          ? () async {
                              (await ref.read(tasksRepositoryProvider.future)).add(
                                Task()
                                  ..id = data.id
                                  ..title = editTaskName.value
                                  ..isDone = data.isDone,
                              );
                              if (context.mounted) {
                                context.go(Routes.main);
                              }
                            }
                          : null,
                    )
                  ])
                : Text('error.common'.tr());
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (e, s) => Text('error.common'.tr()),
        ));
  }
}
