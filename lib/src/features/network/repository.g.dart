// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkRepository)
final networkRepositoryProvider = NetworkRepositoryProvider._();

final class NetworkRepositoryProvider
    extends
        $FunctionalProvider<
          NetworkRepository,
          NetworkRepository,
          NetworkRepository
        >
    with $Provider<NetworkRepository> {
  NetworkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkRepositoryHash();

  @$internal
  @override
  $ProviderElement<NetworkRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NetworkRepository create(Ref ref) {
    return networkRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkRepository>(value),
    );
  }
}

String _$networkRepositoryHash() => r'aafe8d75ca8ff1958b69633402613a56521c79cd';
