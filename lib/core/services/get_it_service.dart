import 'package:get_it/get_it.dart';

import '../../Features/Auth/data/repos/auth_repo_impl.dart';
import '../../Features/Auth/domain/repos/auth_repo.dart';
import 'firebase_auth_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
