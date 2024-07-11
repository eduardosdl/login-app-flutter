import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/data/repositories/user_repository_impl.dart';
import 'package:login_app/views/components/custom_material_button.dart';
import 'package:login_app/views/components/custom_text_form_field.dart';
import 'package:login_app/views/screens/login/login_cubit.dart';
import 'package:login_app/views/screens/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(UserRepositoryImpl()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Erro no login")));
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: _usernameController,
                      labelText: "Username",
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o nome de usuário';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: "Senha",
                      obscureText: true,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe uma senha';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomMaterialButtom(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          final username = _usernameController.text;
                          final password = _passwordController.text;

                          context.read<LoginCubit>().login(username, password);
                        }
                      },
                      text: "Entrar",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFormField(
                  labelText: "Username",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe um nome de usuário';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: CustomTextFormField(
                    labelText: "Senha",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma senha';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: CustomMaterialButtom(
                    onPressed: () {},
                    text: "Entrar",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }*/
}
