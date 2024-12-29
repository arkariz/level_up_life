import 'package:level_up_life/data/services/database/objectbox/objectbox.g.dart';

class BaseBoxStore {
  BaseBoxStore({required this.boxStore, required this.temBoxStore});

  final Store boxStore;
  final Store temBoxStore;

  Future<T> create<T>(T model, bool isTemporary) async {
    if (isTemporary) {
      final tempBox = temBoxStore.box<T>();
      await tempBox.putAsync(model, mode: PutMode.insert);

      final box = boxStore.box<T>();
      return await box.putAndGetAsync(model, mode: PutMode.insert);
    } else {
      final box = boxStore.box<T>();
      return await box.putAndGetAsync(model, mode: PutMode.insert);
    }
  }

  Future<void> createMany<T>(List<T> models) async {
    final box = boxStore.box<T>();
    await box.putManyAsync(models, mode: PutMode.insert);
  }

  Future<T> read<T>({required Condition<T> query}) async {
    final box = boxStore.box<T>();
    final queryBuilder = box.query(query).build();
    final result = await queryBuilder.findFirstAsync(); 
    queryBuilder.close();
    return result!;
  }

  Future<List<T>> readMany<T>({required Condition<T> query}) async {
    final box = boxStore.box<T>();
    final queryBuilder = box.query(query).build();
    final result = queryBuilder.findAsync();
    queryBuilder.close();
    return result;
  }

  Future<List<T>> readAll<T>(bool isTemporary) async {
    if (isTemporary) {
      return await temBoxStore.box<T>().getAllAsync();
    }
    return await boxStore.box<T>().getAllAsync();
  }

  Future<T> update<T>({required T model, required Condition<T> query}) async {
    final box = boxStore.box<T>();
    final queryBuilder = box.query(query).build();
    await queryBuilder.removeAsync();
    queryBuilder.close();

    return box.putAndGetAsync(model, mode: PutMode.insert);
  }

  Future<void> updateAll<T>({required List<T> models,required Condition<T> query}) async {
    final box = boxStore.box<T>();
    final queryBuilder = box.query(query).build();
    await queryBuilder.removeAsync();
    queryBuilder.close();

    await box.putManyAsync(models, mode: PutMode.insert);
  }

  Future<void> delete<T>({required Condition<T> query}) async {
    final box = boxStore.box<T>();
    final queryBuilder = box.query(query).build();
    await queryBuilder.removeAsync();
    queryBuilder.close();
  }
}