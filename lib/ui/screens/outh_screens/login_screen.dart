import 'package:flutter/material.dart';
import 'package:food_ordering_system/ui/screens/outh_screens/signup_screen.dart';
import 'package:food_ordering_system/widgets_common/custom_text_field.dart';
import 'package:food_ordering_system/widgets_common/my_button.dart';
import 'package:get/get.dart';

import '../../../widgets_common/social_login_button.dart';
import '../../theme/theme.dart';
import 'forgot_password_bottomsheet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _obscurePassword = true;
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Login to your\naccount.',
                                style: TextStyle(
                                  fontSize: 32,
                                  height: 1.1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Please sign in to your account',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          CustomTextField(
                            label: "Email Address",
                            textHint: "Enter Email",
                            prefixIcon: Icons.email,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 4),
                          CustomTextField(
                            label: "Password",
                            textHint: "Enter Password",
                            controller: passwordController,
                            prefixIcon: Icons.lock,
                            isPassword: _obscurePassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppTheme.primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  builder: (context) {
                                    return ForgotPasswordBottomSheet(
                                      selectedOption: selectedOption,
                                      onOptionSelected: (option) {
                                        setState(() {
                                          selectedOption = option;
                                        });
                                      },
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),

                          MyButton(text: "Sign in", onPressed: () {}),

                          SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black54,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "Or sign in with",
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black54,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SocialLoginButton(
                                iconPath: 'assets/icons/google.png',
                                onPressed: () {},
                              ),
                              SizedBox(width: 16),
                              SocialLoginButton(
                                iconPath: 'assets/icons/facebook.png',
                                onPressed: () {},
                              ),
                              SizedBox(width: 16),
                              SocialLoginButton(
                                iconPath: 'assets/icons/apple.png',
                                onPressed: () {},
                              ),
                            ],
                          ),

                          SizedBox(height: 24),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => SignUpScreen());
                                  },
                                  child: Text("Register"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
