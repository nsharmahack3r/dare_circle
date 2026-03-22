// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_status_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InternetStatusController)
final internetStatusControllerProvider = InternetStatusControllerProvider._();

final class InternetStatusControllerProvider
    extends $StreamNotifierProvider<InternetStatusController, InternetStatus> {
  InternetStatusControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internetStatusControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internetStatusControllerHash();

  @$internal
  @override
  InternetStatusController create() => InternetStatusController();
}

String _$internetStatusControllerHash() =>
    r'8aab764511172c96ea9cea4a40557f1ecc999912';

abstract class _$InternetStatusController
    extends $StreamNotifier<InternetStatus> {
  Stream<InternetStatus> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<InternetStatus>, InternetStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<InternetStatus>, InternetStatus>,
              AsyncValue<InternetStatus>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
