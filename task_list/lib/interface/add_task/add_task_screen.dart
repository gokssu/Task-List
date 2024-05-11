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

class AddTaskScreen extends HookConsumerWidget {
  const AddTaskScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNameCont = useTextEditingController();
    final taskName = useState<String>('');
    return BasePage(
      padding: const EdgeInsets.all(10),
      appBar: AppBarNav(
        title: 'add.title'.tr(),
        back: true,
      ),
      resizeToAvoidBottomInset: true,
      childBody: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: AppTextField(
            title: 'app.task_name'.tr(),
            controller: taskNameCont,
            onChanged: (value) {
              taskName.value = value;
            },
          ),
        ),
        Button(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(10),
          text: 'app.done'.tr(),
          color: Theme.of(context).colorScheme.primary,
          disabledColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          onPressed: taskName.value.isNotEmpty
              ? () async {
                  (await ref.read(tasksRepositoryProvider.future)).add(
                    Task()
                      ..title = taskNameCont.text
                      ..isDone = false,
                  );
                  if (context.mounted) {
                    context.go(Routes.main);
                  }
                }
              : null,
        )
      ]),
    );
  }
}
