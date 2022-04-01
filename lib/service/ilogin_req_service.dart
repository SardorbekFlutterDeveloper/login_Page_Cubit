import 'package:dio/dio.dart';

abstract class IloginService {
  final Dio dio;
  IloginService(this.dio);

  final String loginPath = ILoginSrervicePath.Login.rawValue;

  Future postUserLogin(model);

}

enum ILoginSrervicePath { Login }

extension ILoginServiceExtension on ILoginSrervicePath {
  String get rawValue {
    switch (this) {
      case ILoginSrervicePath.Login:
        return '/login';
    }
  }
}
