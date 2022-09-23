import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/data/models/auth/login/login_model.dart';
import 'package:odc/data/remote/dio_helper.dart';
import 'package:odc/data/remote/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static LoginCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  bool visiblePassword = true;
  bool isLoading=false;

    void changePasswordVisibility(){
      visiblePassword = !visiblePassword;
      emit(PasswordVisibilityState());
    }
    void changeLoadingProgress(){
      isLoading= !isLoading;
      emit(LoginProgress());
    }

    void login({
    required String email,
    required String password,
    required  Function(String) loginError,
  }){
      emit(LoginLoading());
      DioHelper.postData(url: loginEndPoint, data: {
        'email' : email,
        'password' : password,
      }).then((value) {
        emit(LoginSuccess(loginModel: LoginModel.fromJson(value.data)));
      }).catchError((e){
        print(e);
        loginError('Email or Password is not correct!');
        emit(LoginFailure());
      });
    }
}
