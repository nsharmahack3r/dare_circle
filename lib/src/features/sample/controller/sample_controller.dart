import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/sample_state.dart';
import '../repository/sample_repository.dart';

part 'sample_controller.g.dart';

@riverpod
class SampleController extends _$SampleController {
  @override
  FutureOr<SampleState> build() async {
    final repo = ref.watch(sampleRepositoryProvider);
    final count = await repo.fetchInitialCount();
    return SampleState(counter: count);
  }

  void increment() {
    state = const AsyncLoading();
    // Simulate some work, then update state
    Future.delayed(const Duration(milliseconds: 500), () {
      final currentCount = state.value?.counter ?? 0;
      state = AsyncData(SampleState(counter: currentCount + 1));
    });
  }
}
