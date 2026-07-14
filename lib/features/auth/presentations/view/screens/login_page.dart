import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/constants/asset_constants.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/snack.dart';
import 'package:movies/core/validators/app_validator.dart';
import 'package:movies/features/auth/presentations/view/customs/customElevatedButton.dart';
import 'package:movies/features/auth/presentations/view/customs/customTextformfield.dart';
import 'package:movies/features/auth/presentations/view_model/signin/cubit/signin_cubit.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Gap(150.h),
                SizedBox(
                  width: 220.w,
                  height: 220.h,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(AssetConstants.loginAsset),
                  ),
                ),
                Gap(70.h),
                Customtextformfield(
                  username: AppConstants.email,
                  validator: AppValidator.emailValidationStatus,
                  controller: _emailController,
                ),
                Gap(20.h),
                Customtextformfield(
                  username: AppConstants.password,
                  validator: AppValidator.PasswordValidationStatus,
                  controller: _passwordController,
                ),

                Gap(50.h),
                BlocConsumer<SigninCubit, SigninState>(
                  listener: (context, state) {
                    if (state is SigninSuccess) {
                      Snack.snack(
                        context: context,
                        textColor: AppColors.textPrimary,
                        text: AppConstants.authSuscess,
                      );
                      context.go(RoutesConstants.bottomNavigationPath);
                    }
                    if (state is SigninFailure) {
                      Snack.snack(
                        context: context,
                        textColor: AppColors.error,
                        text: AppConstants.authFailure,
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is SigninLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.myBlue,
                            ),
                          )
                        : Customelevatedbutton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SigninCubit>().signin(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                            text: AppConstants.login,
                          );
                  },
                ),
                Gap(50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppConstants.suggest,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.textSecondary,
                    ),
                    GestureDetector(
                      onTap: () => context.push(RoutesConstants.signupPath),
                      child: CustomText(
                        text: AppConstants.click,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.myBlue,
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppConstants.forgetPassword,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.textSecondary,
                    ),

                    GestureDetector(
                      onTap: () =>
                          context.push(RoutesConstants.forgetPasswordPath),
                      child: CustomText(
                        text: AppConstants.click,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.myBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
