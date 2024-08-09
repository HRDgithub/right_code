import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:right_code_app/src/app/storage_tips/data/storage_tips_repository.dart';

//* Providers
final myStorageTipsRepositoryProvider = Provider<BaseStorageTipsRepo>((ref) {
  return StorageTipsRepoImplement();
});
