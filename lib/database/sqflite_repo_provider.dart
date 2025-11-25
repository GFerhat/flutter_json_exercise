import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/database/sqflite_repo.dart';

final Provider<SqfliteRepo> refRepoSqflite = Provider((ref) {
  return SqfliteRepo();
});
