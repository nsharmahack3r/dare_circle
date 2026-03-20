import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_repository.g.dart';

class SampleRepository {
  Future<int> fetchInitialCount() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }
}

@riverpod
SampleRepository sampleRepository(Ref ref) {
  return SampleRepository();
}
