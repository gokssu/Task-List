import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:task_list/providers/isar_provider.dart';
import 'package:task_list/repositories/task_repository/models/task_model.dart';
import 'package:task_list/repositories/task_repository/task_repository.dart';

final tasksRepositoryProvider = FutureProvider.autoDispose((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return TasksRepository(isar);
});

final taskProvider = FutureProvider.autoDispose.family<Task?, int>((ref, id) async {
  final tasksRepository = await ref.watch(tasksRepositoryProvider.future);
  return tasksRepository.task(id);
});

final taskListProvider = StreamProvider.autoDispose<List<Task>>((ref) async* {
  final tasksRepository = await ref.watch(tasksRepositoryProvider.future);
  yield* tasksRepository.taskList();
});
