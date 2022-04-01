import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_cubit/core/componentes/input_comp.dart';
import 'package:login_page_cubit/screens/login/view_model/login_cubit.dart';
import 'package:login_page_cubit/service/i_login_service.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String baseUrl = "https://reqres.in/api";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        formKey,
        usernameController,
        passwordController,
        service: LoginService(
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
            ),
          ),
        ),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildScaffoldMethod(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffoldMethod(BuildContext context, LoginState state) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login View"),
        leading: Visibility(
          visible: context.watch<LoginCubit>().isLoading,
          child: const CircularProgressIndicator(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: state is LoginValidateState
              ? (state.isLoginFail
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction)
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputComp.myDecoration(
                  "Username",
                  "Username Kiriting...",
                ),
                validator: (v) =>
                    (v ?? '').length > 6 ? null : "Username Kam kiritildi",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                controller: passwordController,
                decoration:
                    InputComp.myDecoration("Password", "Password Kiriting..."),
                validator: (v) =>
                    (v ?? '').length > 6 ? null : "Password Kam kiritildi",
              ),
              ElevatedButton(
                child: const Text("Sign In"),
                onPressed:   context.watch<LoginCubit>().isLoading ? null:  () {
                  context.read<LoginCubit>().postUsersMode();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
