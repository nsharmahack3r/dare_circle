import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/sample_controller.dart';
import '../widget/sample_widget.dart';

class SampleView extends ConsumerWidget {
  const SampleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(sampleControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Feature'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: stateAsync.when(
          data: (state) => SampleWidget(
            count: state.counter,
            onIncrement: () =>
                ref.read(sampleControllerProvider.notifier).increment(),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
