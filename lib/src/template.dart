// import 'package:get_it/get_it.dart';
// import 'package:template/src/features/auth/data/remote/auth_services/auth_services.dart';
// import 'package:template/src/features/auth/data/repository/auth_repository.dart';
// import 'package:template/src/features/auth/domain/repository/auth_repository.dart';
// import 'package:template/template.dart';

// /// {@template template}
// /// Template package
// /// {@endtemplate}
// final getIt = GetIt.instance;

// class Template {
//   void init(
//     String dioInstanceName, {
//     String? baseUrl,
//   }) {
//     initService(
//       dioInstanceName,
//       baseUrl: baseUrl,
//     );
//     initRepo();
//     initUsecase();
//   }

//   static void initService(
//     String dioInstanceName, {
//     String? baseUrl,
//   }) {
//     getIt.registerFactory<AuthService>(
//       () => AuthService(),
//     );
//   }

//   static void initRepo() {
//     getIt.registerFactory<AuthRepository>(
//       () => AuthRepositoryImpl(
//         getIt(),
//       ),
//     );
//   }

//   static void initUsecase() {
//     getIt.registerFactory<AuthUsecase>(
//       () => AuthUsecase(
//         getIt(),
//       ),
//     );
//   }
// }
