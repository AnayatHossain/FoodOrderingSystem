import 'package:flutter/material.dart';
import 'package:food_ordering_system/widgets_common/my_button.dart';
import 'package:get/get.dart';
import 'forgot_password_screen.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  final int selectedOption;
  final Function(int) onOptionSelected;

  const ForgotPasswordBottomSheet({
    super.key,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  State<ForgotPasswordBottomSheet> createState() => _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  late RxInt selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selectedOption.obs; // Make it observable
  }

  void selectOption(int index) {
    selected.value = index;
    widget.onOptionSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
          Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Select which contact details should we use to reset your password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 30),

          Obx(() => OptionTile(
            icon: Icons.phone,
            title: 'Send via WhatsApp',
            subtitle: '+12 8347 2838 28',
            isSelected: selected.value == 0,
            onTap: () => selectOption(0),
          )),
          const SizedBox(height: 16),

          Obx(() => OptionTile(
            icon: Icons.email,
            title: 'Send via Email',
            subtitle: 'Albertstevano@gmail.com',
            isSelected: selected.value == 1,
            onTap: () => selectOption(1),
          )),
          const SizedBox(height: 30),
          MyButton(
            text: "Continue",
            onPressed: () {
              if (selected.value == -1) {
                Get.snackbar('Warning', 'Please select an option');
              } else {
                Get.to(() => ForgotPasswordScreen());
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.orange : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.orange.withOpacity(0.1) : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.orange),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      )),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
