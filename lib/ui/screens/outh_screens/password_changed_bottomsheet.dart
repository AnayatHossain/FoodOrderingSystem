import 'package:flutter/material.dart';
import 'package:food_ordering_system/ui/screens/outh_screens/login_screen.dart';
import 'package:food_ordering_system/widgets_common/my_button.dart';
import 'package:get/get.dart';

class PasswordChangedBottomSheet extends StatelessWidget {
  const PasswordChangedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          // Image/Icon
          Image.asset(
            'assets/icons/congratulation_icon.png',
            height: 120,
          ),
          const SizedBox(height: 20),
          Text(
            'Password Changed',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Password changed successfully, you can login\nagain with a new password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 30),
          MyButton(
            text: "Verify Account",
            onPressed: () {
              Get.to(() => LoginScreen());
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
