import 'package:isar/isar.dart';
import 'package:task_list/repositories/task_repository/models/task_model.dart';

class TasksRepository {
  TasksRepository(
    this._db,
  );
  final Isar _db;
  Stream<List<Task>> taskList() async* {
    yield* _db.tasks.where().watch(fireImmediately: true);
  }

  Future<int> add(Task event) async {
    return _db.writeTxnSync<int>(() => _db.tasks.putSync(event));
  }

  Future<Task?> task(int id) async {
    final task = await _db.tasks.get(id);
    return task;
  }
}
