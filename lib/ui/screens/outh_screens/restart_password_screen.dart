import 'package:flutter/material.dart';
import 'package:food_ordering_system/ui/screens/outh_screens/password_changed_bottomsheet.dart';
import 'package:food_ordering_system/widgets_common/custom_text_field.dart';
import 'package:food_ordering_system/widgets_common/my_button.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

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
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    "Reset Password",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 48), // Empty space for balance
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 32,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your new password must be different from the\npreviously used password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 40),

                          // New Password Field
                          CustomTextField(
                            label: "New Password",
                            textHint: "Enter New Password",
                            controller: newPasswordController,
                            prefixIcon: Icons.lock,
                            isPassword: _obscureNewPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureNewPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppTheme.primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureNewPassword = !_obscureNewPassword;
                                });
                              },
                            ),
                          ),


                          const SizedBox(height: 4),

                          // Confirm Password Field
                          CustomTextField(
                            label: "Confirm Password",
                            textHint: "Re-enter Password",
                            controller: confirmPasswordController,
                            prefixIcon: Icons.lock_outline,
                            isPassword: _obscureConfirmPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppTheme.primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword = !_obscureConfirmPassword;
                                });
                              },
                            ),
                          ),

                          const SizedBox(height: 40),

                          // Verify Account Button
                          MyButton(
                            text: "Verify Account",
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => PasswordChangedBottomSheet(),
                              );
                            },
                          ),

                          const SizedBox(height: 30),
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
