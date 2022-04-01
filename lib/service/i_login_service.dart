import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login_page_cubit/models/login_model_request.dart';
import 'package:login_page_cubit/service/ilogin_req_service.dart';

class LoginService extends IloginService {
  LoginService(Dio dio) : super(dio);

 

  @override
  Future postUserLogin(model) async {
    final Response response = await dio.post(loginPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else {
      return null;
    }
  }
}
