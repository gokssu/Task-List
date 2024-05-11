import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_list/repositories/task_repository/models/task_model.dart';

final isarSchemas = [
  TaskSchema,
];

final isarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();

  return Isar.open(
    isarSchemas,
    directory: dir.path,
  );
});
