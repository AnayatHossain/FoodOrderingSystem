import 'package:flutter/material.dart';
import 'package:food_ordering_system/ui/screens/onboarding_screen.dart';
import 'package:food_ordering_system/ui/theme/theme.dart';
import 'package:get/get.dart';

class FoodOrderingSystem extends StatelessWidget {
  const FoodOrderingSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Ordering System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: OnboardingScreen(),
    );
  }
}
