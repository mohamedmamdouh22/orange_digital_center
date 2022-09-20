import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:odc/data/remote/dio_helper.dart';
import 'package:odc/data/remote/end_points.dart';
import 'package:odc/presentation/screeens/login/login_screen.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String gender = 'm';

  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  bool visiblePassword = true;
  bool visibleConfirmPassword = true;

  // function to change visibility of password
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    emit(VisibleConfirmPasswordState());
  }

  void changeGender (val){
    gender = val;
    emit(ChangeGenderState());
  }

  Future postSignup(context) async {
    var json = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "phoneNumber": phoneNumberController.text,
      // "gender": gender == 'male' ? 'm' : 'f',
      'gender':'f',

    };


    DioHelper.postData(url: registerEndPoint, data: json).then((value) {

      if (value.statusCode == 200) {
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
        Fluttertoast.showToast(
            msg: "Successfully Signup",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      }
      emit(GetSignupSuccessState());

    }).catchError((e){
      print(e);
      emit(GetSignupErrorState());
    });
  }
}
