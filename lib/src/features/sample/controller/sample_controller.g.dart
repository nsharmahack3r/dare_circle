// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SampleController)
final sampleControllerProvider = SampleControllerProvider._();

final class SampleControllerProvider
    extends $AsyncNotifierProvider<SampleController, SampleState> {
  SampleControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sampleControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sampleControllerHash();

  @$internal
  @override
  SampleController create() => SampleController();
}

String _$sampleControllerHash() => r'61e8c4144829966c40d5c72e92c71870c146d62b';

abstract class _$SampleController extends $AsyncNotifier<SampleState> {
  FutureOr<SampleState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SampleState>, SampleState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SampleState>, SampleState>,
              AsyncValue<SampleState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
