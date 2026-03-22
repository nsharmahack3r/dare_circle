import 'package:dare_circle/src/common/provider/common_providers.dart';
import 'package:dare_circle/src/common/repository/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'init.g.dart';

@Riverpod()
Future<void> init(Ref ref) async {
  final initController = InitController(ref: ref);
  await initController.init();
}

class InitController {
  final Ref ref;

  InitController({required this.ref});

  Future<void> init() async {
    final auth = await ref.read(sharedPreferencesRepositoryProvider).getAuth();
    if (auth != null) {
      ref.read(authTokenProvider.notifier).setToken(auth.token);
      ref.read(currentUserProvider.notifier).setUser(auth.user);
    }
  }
}
