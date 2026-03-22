import 'package:dare_circle/src/features/auth/repository/endpoints.dart';
import 'package:dare_circle/src/features/network/repository.dart';
import 'package:dare_circle/src/features/network/types.dart';
import 'package:dare_circle/src/model/auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(networkRepository: ref.read(networkRepositoryProvider));
}

class AuthRepository {
  final NetworkRepository _networkRepository;

  AuthRepository({required NetworkRepository networkRepository})
    : _networkRepository = networkRepository;

  FutureEither<Auth> login({
    required String email,
    required String password,
  }) async {
    final body = {"email": email, "password": password};

    final result = await _networkRepository.postRequest(
      url: AuthEndpoints.login,
      data: body,
    );

    return result.fold(
      (failure) {
        return Left(failure);
      },
      (response) {
        return Right(Auth.fromJson(response.data));
      },
    );
  }

  FutureEither<Auth> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final body = {"name": name, "email": email, "password": password};

    final result = await _networkRepository.postRequest(
      url: AuthEndpoints.signup,
      data: body,
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(Auth.fromJson(response.data));
    });
  }
}
