import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_cubit/service/ilogin_req_service.dart';

class LoginCubit extends Cubit<LoginState> {
  GlobalKey<FormState> formKey;
  TextEditingController usernameController;
  TextEditingController passwordController;

  bool isLoginFail = false;
  bool isLoading = false;

  final IloginService service;

  LoginCubit(this.formKey, this.usernameController, this.passwordController,
      {required this.service})
      : super(LoginInitial());

  Future<void> postUsersMode() async {
    if (formKey.currentState!.validate()) {
      changeLoading();

      await Future.delayed(Duration(seconds: 2));

      changeLoading();
      print("Bajarildi !");  
    } else {
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(LoginValidateState(isLoginFail));
  }
}

// * Statega ajratib chiqarishimiz mukin

abstract class LoginState {
  LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial();
}

class LoginValidateState extends LoginState {
  bool isLoginFail;
  LoginValidateState(this.isLoginFail);
}
