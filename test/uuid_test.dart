import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('uuid-Test', () {
  final uuid = Uuid();
  final id1 = uuid.v4();
  final id2 = uuid.v4();
  expect(id1 != id2, true);
  });
}