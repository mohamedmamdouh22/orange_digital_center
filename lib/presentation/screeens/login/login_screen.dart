import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/auth/login/login_cubit.dart';
import 'package:odc/data/local/cache_helper.dart';
import 'package:odc/presentation/constants/app_assets.dart';
import 'package:odc/presentation/screeens/app_layout/app_layout.dart';
import 'package:odc/presentation/screeens/signup/signup_screen.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/widgets/custom_text_form_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        if (state is LoginSuccess) {
          token = state.loginModel.accessToken!;
          CacheHelper.put(key: tokenKey, value: token).then((value) {
            showTopSnackBar(
                context, CustomSnackBar.success(message: 'Welcome Back !'));
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AppLayout(),
              ),
              (route) => false);
              loginCubit.changeLoadingProgress();
              loginCubit.emailController.clear();
              loginCubit.passwordController.clear();

        }
      },
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return ModalProgressHUD(
          blur: 5,
          inAsyncCall: loginCubit.isLoading,
          child: Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 30),
            child: Form(
              key: loginCubit.loginKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 30),
                    child: Image.asset(
                      odcImagePng,
                      height: size.height / 11,
                      width: size.width / 1.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
                          .hasMatch(value)) {
                        return 'Please Enter Valid as example@gmail.com';
                      }
                    },
                    hintText: 'Email',
                    controller: loginCubit.emailController,
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  CustomTextFormField(
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                    hintText: 'Password',
                    isPassword: true,
                    visibleText: loginCubit.visiblePassword,
                    onTap:(){
                      loginCubit.changePasswordVisibility();
                    } ,
                    controller:loginCubit.passwordController ,
        
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginCubit.changeLoadingProgress();
                      Duration(seconds: 1);
                      if (loginCubit.loginKey.currentState!.validate()) {
                        loginCubit.login(
                            email: loginCubit.emailController.value.text.trim(),
                            password: loginCubit.passwordController.value.text.trim(),
                            loginError: (String msg) {
                              showTopSnackBar(
                                  context, CustomSnackBar.error(message: msg));
                                  loginCubit.changeLoadingProgress();
                            });
        
                      }
                      //loginCubit.changeLoadingProgress();
        
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width / 50),
                        child: const Text('OR'),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ));
                    },
                    child: const Text(
                      'Sign Up',
                      style:TextStyle(
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
