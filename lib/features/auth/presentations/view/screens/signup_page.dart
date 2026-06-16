import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/constants/asset_constants.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/snack.dart';
import 'package:movies/core/validators/app_validator.dart';
import 'package:movies/features/auth/presentations/view/customs/customElevatedButton.dart';
import 'package:movies/features/auth/presentations/view/customs/customTextformfield.dart';
import 'package:movies/features/auth/presentations/view_model/signup/signup_cubit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                    backgroundImage: AssetImage(AssetConstants.signupAsset),
                  ),
                ),
                Gap(90.h),
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
                BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      Snack.snack(
                        context: context,
                        textColor: AppColors.textPrimary,
                        text: AppConstants.authSuscess,
                      );
                      context.pop();
                    }
                    if (state is SignupFailure) {
                      Snack.snack(
                        context: context,
                        textColor: AppColors.error,
                        text: AppConstants.authFailure,
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is SignupLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.myBlue,
                            ),
                          )
                        : Customelevatedbutton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignupCubit>().signup(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                            text: AppConstants.signup,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
