import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/auth/authentication_service.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_textfield.dart';
import 'package:limatrack_genetic/app/pages/global_component/loading_overlay.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

import 'login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
          child: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(logoSecondary)
                    ),

                    const SizedBox(height: 20,),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Selamat Datang \nKembali di Lima",
                            style: tsTitleMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "Track.",
                            style: tsTitleMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50,),

                    CommonTextField(
                      controller: controller.emailController,
                      hintText: "Email",
                      prefixIcon: icMail,
                    ),

                    CommonTextField(
                      controller: controller.passwordController,
                      hintText: "Kata Sandi",
                      prefixIcon: icLockOutline,
                      isObscure: true,
                    ),

                    const SizedBox(height: 25,),

                    CommonButton(
                      text: "Masuk",
                      onPressed: () {
                        controller.login();
                      },
                      height: 45 ,
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      child: Text("atau lanjutkan dengan", style: tsLabelLarge.copyWith(
                          color: greyColor
                      ),),
                    ),

                    const CommonButtonGoogle(),

                    const SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pengguna Baru?", style: tsBodyMedium),

                        const SizedBox(width: 3,),

                        InkWell(
                          onTap: () => Get.toNamed(Routes.REGISTER_PAGE),
                          child: Text("Daftar", style: tsBodyMedium.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),),
                        ),

                      ],
                    ),

                    const Spacer(),


                  ]
              ),
            ),
          ))
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}




