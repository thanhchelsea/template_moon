import 'package:template/src/features/auth/data/model/login_request/login_request_model.dart';
import 'package:template/src/features/auth/data/model/login_response/login_response.dart';
import 'package:template/src/features/auth/data/model/user_profile/user_profile.dart';
import 'package:template/src/features/auth/data/remote/auth_services/auth_services.dart';
import 'package:template/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._authService,
  );
  final AuthService _authService;
  @override
  Future<LoginResponse?> login({required LoginRequestModel loginRequest}) {
    return _authService.login(loginRequest);
  }

  @override
  Future<UserProfileModel?> getUserProfile({required String accessToken}) {
    return _authService.fetchUserProfile(accessToken: accessToken);
  }
}
