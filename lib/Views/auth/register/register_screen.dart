import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Widgets/custom_back_button.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBackButton(context: context),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/CA.png'),
                          radius: 70,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'if you have any account go to back and login. or, don’t have any account flap the gap. and create account',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'First Name',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintText: 'Enter you first name',
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 2, color: primary),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 2, color: Colors.blue)),
                                      ),
                                    )
                                  ],
                                )),
                                const SizedBox(width: 5,),
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Last Name',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintText: 'Enter you Last name',
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 2, color: primary),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 2, color: Colors.blue)),
                                      ),
                                    )
                                  ],
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Username',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                ),
                                hintText: 'Enter your username',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(25),
                                //   borderSide: BorderSide(
                                //     width: 2,
                                //     color: Colors.white,
                                //   ),
                                // ),
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
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Email',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                ),
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(25),
                                //   borderSide: BorderSide(
                                //     width: 2,
                                //     color: Colors.white,
                                //   ),
                                // ),
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
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Password',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIconColor: Colors.white70,
                                suffixIcon: const Icon(Icons.visibility),
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(25),
                                //   borderSide: BorderSide(
                                //     width: 2,
                                //     color: Colors.white,
                                //   ),
                                // ),
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
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Re-type Password',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(height: 7),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIconColor: Colors.white70,
                                suffixIcon: const Icon(Icons.visibility),
                                hintText: 'Re-type your password',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(25),
                                //   borderSide: BorderSide(
                                //     width: 2,
                                //     color: Colors.white,
                                //   ),
                                // ),
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        customButton(
                            buttonName: 'Register',
                            buttonColor: primary,
                            context: context)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
