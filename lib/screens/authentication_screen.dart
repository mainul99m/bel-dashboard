import 'package:bel_dashboard/controllers/authenticator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  final AuthenticatorController controller = Get.put(AuthenticatorController());
  AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg-auth.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/Bengal Elasmo Lab Logo.png',
                  width: 100,
                  height: 100,
                ),
                Text(
                  'Bengal Elasmo Lab',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true
                        ),

                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: controller.login,
                        child: const Text('Login'),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
