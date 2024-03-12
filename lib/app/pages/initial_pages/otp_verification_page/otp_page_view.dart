import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_textfield.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'package:pinput/pinput.dart';

import 'otp_page_controller.dart';

class OtpPageView extends GetView<OtpPageController> {
  const OtpPageView({super.key});

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.only(right: 9),
      width: 58,
      height: 60,
      textStyle: tsBodyMedium.copyWith(
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF808383).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(logoSecondary)
                ),

                const SizedBox(height: 30,),

                Text(
                  "Kode Verifikasi Email",
                  style: tsTitleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  "Kode akan dikirimkan melalui inbox email",
                  style: tsBodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),


                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Pinput(
                    length: 4,
                    controller: controller.otpNumberController,
                    defaultPinTheme: defaultPinTheme,
                    separatorBuilder: (index) =>
                    const SizedBox(width: 8),
                    validator: (value) {
                      // return value == '2222' ? null : 'Pin is incorrect';
                    },
                    // onClipboardFound: (value) {
                    //   pinController.setText(value);
                    // },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    // onCompleted: _forgotLoginState.onTacNumberChanged,
                    // onChanged: _forgotLoginState.onTacNumberChanged,
                    showCursor: true,
                    cursor: Center(
                      child: Container(
                          margin: const EdgeInsets.only(),
                          width: 1,
                          height: 22,
                          color: Colors.grey),
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!
                          .copyWith(
                        borderRadius:
                        BorderRadius.circular(12),
                        border: Border.all(color: primaryColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Kode akan hangus dalam", style: tsBodyMedium),

                    const SizedBox(width: 3,),

                    InkWell(
                      onTap: () => Get.toNamed(Routes.LOGIN_PAGE),
                      child: Text("00.00", style: tsBodyMedium.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),),
                    ),

                  ],
                ),

                const SizedBox(height: 30,),

                CommonButton(
                    text: "Verifikasi", onPressed: () => Get.toNamed(Routes.HOME_PAGE)
                ),

                const SizedBox(height: 10,),

                CommonButtonOutline(
                    text: "Kirim Ulang Email", onPressed: () => Get.toNamed(Routes.HOME_PAGE)
                ),

              ]
            ),
          )
      )
    );
  }
}




