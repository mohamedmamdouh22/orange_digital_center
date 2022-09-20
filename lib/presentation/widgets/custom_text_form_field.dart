
import 'package:flutter/material.dart';
import 'package:odc/presentation/styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.visibleText = false,
    this.onTap,
    this.isPassword = false,
    this.keyboardType=TextInputType.text
  }) : super(key: key);

  final String hintText;
  TextEditingController controller;
   final Function validator;

  bool visibleText;
  bool isPassword;
  TextInputType keyboardType;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        return validator(val);
      },
      keyboardType: keyboardType,
      controller: controller,
      obscureText: visibleText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor),
        ),
        suffixIcon:isPassword? InkWell(
          onTap:onTap ,
          child: Icon(
            !visibleText ? Icons.visibility : Icons.visibility_off ,
            color: primaryColor,
          ),
        ): SizedBox(),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
