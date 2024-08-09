import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingStateClass<T> {
  AsyncValue<T?> edit;
  AsyncValue<T?> add;
  AsyncValue<T?> delete;

  ///
  static LoadingStateClass<T> initialData<T>() {
    return LoadingStateClass(
      edit: const AsyncData(null),
      add: const AsyncData(null),
      delete: const AsyncData(null),
    );
  }

  ///
  LoadingStateClass({
    required this.edit,
    required this.add,
    required this.delete,
  });

  LoadingStateClass<T> copyWith({
    AsyncValue<T?>? edit,
    AsyncValue<T?>? add,
    AsyncValue<T?>? delete,
  }) {
    return LoadingStateClass(
      edit: edit ?? this.edit,
      add: add ?? this.add,
      delete: delete ?? this.delete,
    );
  }
}
