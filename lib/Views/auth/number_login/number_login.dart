
import 'package:chats_app/Utils/app_text.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../Controllers/auth/num_login_controller.dart';

class NumberLoginScreen extends StatelessWidget {
  NumberLoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(NumberLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Enter your phone number',
                    style: TextStyle(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    '$appName will need to verify your account',
                    style: TextStyle(color: Colors.white, fontSize: 16.5),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InternationalPhoneNumberInput(
                    textFieldController: controller.inputNumberController,
                    textStyle: const TextStyle(color: Colors.white),
                    validator: (number) {
                      if (number!.isEmpty) {
                        return 'Enter Phone number';
                      }
                      return null;
                    },
                    selectorTextStyle: const TextStyle(color: Colors.white),
                    autoFocusSearch: true,
                    hintText: "Enter your phone number",
                    onInputChanged: (PhoneNumber number) {
                      controller.countryCodeController.text = number.dialCode!;
                    },
                    cursorColor: primary,
                    scrollPadding: const EdgeInsets.all(8),
                    textAlign: TextAlign.left,
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      showFlags: true,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  controller.sendCode();
                },
                child: customButton(
                  buttonName: 'Next',
                  buttonColor: primary,
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
