import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/constants/app_sized.dart';
import 'package:movies/core/constants/asset_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/snack.dart';
import 'package:movies/core/validators/app_validator.dart';
import 'package:movies/features/auth/presentations/view/customs/customElevatedButton.dart';
import 'package:movies/features/auth/presentations/view/customs/customTextformfield.dart';
import 'package:movies/features/auth/presentations/view_model/forgetpass/cubit/forget_pass_cubit.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    //  TextEditingController _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSized.width * 0.09),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(80.h),
                  SizedBox(
                    width: 220.w,
                    height: 220.h,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AssetConstants.forgetAsset),
                    ),
                  ),
                  Gap(30.h),
                  Customtextformfield(
                    username: AppConstants.email,
                    validator: AppValidator.emailValidationStatus,
                    controller: _emailController,
                  ),

                  Gap(80.h),
                  BlocConsumer<ForgetPassCubit, ForgetPassState>(
                    listener: (context, state) {
                      if (state is ForgetPassSuccess) {
                        Snack.snack(
                          context: context,
                          textColor: AppColors.textPrimary,
                          text: AppConstants.checkYouEmail,
                        );
                        context.pop();
                      }
                      if (state is ForgetPassFailure) {
                        Snack.snack(
                          context: context,
                          textColor: AppColors.error,
                          text: AppConstants.authFailure,
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is ForgetPassLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.myBlue,
                              ),
                            )
                          : Customelevatedbutton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<ForgetPassCubit>().resetPassword(
                                    email: _emailController.text,
                                  );
                                }
                              },
                              text: AppConstants.password,
                              width: 257.w,
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
