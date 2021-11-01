import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nevina_infotech/app/constants/app_colors.dart';
import 'package:nevina_infotech/app/constants/app_errors.dart';
import 'package:nevina_infotech/app/constants/app_strings.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({Key? key, required this.controller}) : super(key: key);
  final kTextFieldBorderColor = AppColors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      validator: (e) {
        if (GetUtils.isEmail(e!))
          return null;
        else
          return AppErrors.emailIdTextError;
      },
      style: Get.textTheme.headline2!.copyWith(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        isDense: true,
        labelText: AppStrings.email,
        prefixStyle: Get.textTheme.headline2!.copyWith(
          fontSize: 18,
        ),
        labelStyle: Get.textTheme.headline6!.copyWith(
          color: kTextFieldBorderColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({Key? key, required this.controller})
      : super(key: key);
  final kTextFieldBorderColor = AppColors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      validator: (e) {
        if (e!.length > 3)
          return null;
        else
          return AppErrors.passwordTextError;
      },
      style: Get.textTheme.headline2!.copyWith(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        isDense: true,
        labelText: AppStrings.password,
        prefixStyle: Get.textTheme.headline2!.copyWith(
          fontSize: 18,
        ),
        labelStyle: Get.textTheme.headline6!.copyWith(
          color: kTextFieldBorderColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
