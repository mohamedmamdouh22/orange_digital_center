import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc/business_logic/auth/signup/signup_cubit.dart';
import 'package:odc/presentation/constants/app_assets.dart';
import 'package:odc/presentation/screeens/login/login_screen.dart';
import 'package:odc/presentation/widgets/custom_text_form_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();

  List<DropdownMenuItem<String>> genderMenu = const [
    DropdownMenuItem(
      value: 'm',
      child: Text('Male'),
    ),
    DropdownMenuItem(
      value: 'f',
      child: Text('Female'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SignupCubit signupCubit = SignupCubit.get(context);
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 30),
              child: Form(
                key: signupCubit.signupKey,
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
                          'Signup',
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
                          return "Please Enter Your Name";
                        } else if (value.length > 32) {
                          return "Name Must be less than 32 characters";
                        }
                        ;
                      },
                      hintText: 'Name',
                      controller: signupCubit.nameController,
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Email';
                        } else if (!RegExp(
                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
                            .hasMatch(value)) {
                          return 'Please Enter Valid as example@gmail.com';
                        }
                      },
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: signupCubit.emailController,
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
                      isPassword: true,
                      hintText: 'Password',
                      controller: signupCubit.passwordController,
                      visibleText: signupCubit.visiblePassword,
                      onTap: () {
                        signupCubit.changePasswordVisibility();
                      },
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    CustomTextFormField(
                      isPassword: true,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter Your Confirm Password';
                        }
                      },
                      hintText: 'Confirm Password',
                      onTap: () {
                        signupCubit.changeConfirmPasswordVisibility();
                      },
                      visibleText: signupCubit.visibleConfirmPassword,
                      controller: signupCubit.confirmPasswordController,
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    CustomTextFormField(
                      validator: (val) {
                        if (val == null) {
                          return "Please Enter Your Phone Number";
                        } else if (val.length != 11) {
                          return "Phone Number must be 11 number";
                        }
                      },
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      controller: signupCubit.phoneNumberController,
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width / 4,
                          padding: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.orange,
                              )),
                          child: DropdownButton(
                            alignment: Alignment.center,
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            onChanged: (val) {
                              signupCubit.changeGender(val);
                            },
                            value: signupCubit.gender,
                            items: genderMenu,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (signupCubit.signupKey.currentState!.validate()) {
                          if (signupCubit.passwordController.text !=
                              signupCubit.confirmPasswordController.text) {
                            Fluttertoast.showToast(
                                msg: 'Password doesn\'t Match',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            signupCubit.postSignup(context);
                            signupCubit.nameController.clear();
                            signupCubit.emailController.clear();
                            signupCubit.passwordController.clear();
                            signupCubit.confirmPasswordController.clear();
                            signupCubit.phoneNumberController.clear();
                            showTopSnackBar(
                              context,
                              CustomSnackBar.success(message: 'Successfully Registered'),
                            );
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                    (route) => false);
                          }
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
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
                        signupCubit.nameController.clear();
                        signupCubit.emailController.clear();
                        signupCubit.passwordController.clear();
                        signupCubit.confirmPasswordController.clear();
                        signupCubit.phoneNumberController.clear();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) => LoginScreen(),), (
                            route) => false);
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
                  ],
                ),
              ),
            ));
      },
    );
  }
}
