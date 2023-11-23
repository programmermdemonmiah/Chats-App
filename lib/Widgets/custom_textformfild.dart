
import 'package:chats_app/Controllers/password_secure_state_controllers.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class CustomTextFormField extends StatelessWidget {
//   final String? boldLabel;
//   final TextEditingController? controller;
//   final Key? filedKey;
//   final String? hintText;
//   final bool? isPasswordField;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon1;
//   final IconData? suffixIcon2;
//   final FormFieldSetter<String>? onSaved;
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String>? onFieldSubmitted;
//   final TextInputType? inputType;
//
//   const CustomTextFormField(
//       {super.key,
//         this.boldLabel,
//         this.controller,
//         this.filedKey,
//         this.hintText,
//         this.isPasswordField,
//         this.prefixIcon,
//         this.suffixIcon1,
//         this.suffixIcon2,
//         this.onSaved,
//         this.validator,
//         this.onFieldSubmitted,
//         this.inputType});
//
//   @override
//   Widget build(BuildContext context) {
//     final isSecureController = Get.put(PasswordSecureState());
//
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             boldLabel!,
//             style: const TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
//           ),
//           const SizedBox(height: 7),
//           Obx(() => TextFormField(
//             validator: validator,
//             style: const TextStyle(color: Colors.white),
//             obscureText: isPasswordField == true
//                 ? isSecureController.isSecure.value
//                 : false,
//             decoration: InputDecoration(
//               prefixIcon: Icon(prefixIcon),
//               suffixIcon: InkWell(
//                   onTap: () {
//                     isSecureController.showPassword();
//                   },
//                   child: Icon(
//                     isSecureController.isSecure.value == true
//                         ? suffixIcon1
//                         : suffixIcon2,
//                     color: Colors.white.withOpacity(0.7),
//                   )),
//               hintText: hintText,
//               hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
//               // border: OutlineInputBorder(
//               //   borderRadius: BorderRadius.circular(25),
//               //   borderSide: BorderSide(
//               //     width: 2,
//               //     color: Colors.white,
//               //   ),
//               // ),
//               enabled: true,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(25),
//                 borderSide: const BorderSide(
//                   width: 2,
//                   color: primary,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(25),
//                 borderSide: const BorderSide(
//                   width: 2,
//                   color: Colors.blue,
//                 ),
//               ),
//               focusColor: primary,
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }


Widget customTextFormField({
  required String boldLabel,
  required TextEditingController? controller,
  final Key? filedKey,
  required String? hintText,
  final bool? isPasswordField,
  final IconData? prefixIcon,
  final IconData? suffixIcon1,
  final IconData? suffixIcon2,
  final FormFieldSetter<String>? onSaved,
  final FormFieldValidator<String>? validator,
  final ValueChanged<String>? onFieldSubmitted,
  final TextInputType? keyBoardInputType,
  final FocusNode ? focusNode,
}){
  final isSecureController = Get.put(PasswordSecureState());

  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          boldLabel,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(height: 7),
        Obx(() => TextFormField(
          autofocus: false,
          focusNode: focusNode,
          controller: controller,
          keyboardType: keyBoardInputType,
          key: filedKey,
          validator: validator,
          style: const TextStyle(color: Colors.white),
          obscureText: isPasswordField == true
              ? isSecureController.isSecure.value
              : false,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            suffixIcon: InkWell(
                onTap: () {
                  isSecureController.showPassword();
                },
                child: Icon(
                  isSecureController.isSecure.value == true
                      ? suffixIcon1
                      : suffixIcon2,
                  color: Colors.white.withOpacity(0.7),
                )),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.white,
              ),
            ),
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                width: 2,
                color: primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.blue,
              ),
            ),
            focusColor: primary,
          ),
        ))
      ],
    ),
  );
}