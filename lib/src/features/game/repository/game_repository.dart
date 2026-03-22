import 'package:dare_circle/src/features/game/repository/endpoints.dart';
import 'package:dare_circle/src/features/network/repository.dart';
import 'package:dare_circle/src/features/network/types.dart';
import 'package:dare_circle/src/model/game.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@Riverpod()
GameRepository gameRepository(Ref ref) {
  final networkRepository = ref.watch(networkRepositoryProvider);
  return GameRepository(networkRepository: networkRepository);
}

class GameRepository {
  final NetworkRepository _networkRepository;

  GameRepository({required NetworkRepository networkRepository})
    : _networkRepository = networkRepository;

  FutureEither<Game> createGameRoom({required String name}) async {
    final body = {"name": name};
    final result = await _networkRepository.postRequest(
      url: GameEndpoints.createGameRoom,
      data: body,
    );

    return result.fold((failure) => Left(failure), (response) {
      return Right(Game.fromJson(response.data));
    });
  }
}
