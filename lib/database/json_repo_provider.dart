import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/database/repo_json.dart';

final Provider<RepoJson> refRepoJson = Provider((ref) {
  return RepoJson();
});
