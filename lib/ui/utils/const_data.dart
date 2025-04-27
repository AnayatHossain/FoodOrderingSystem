

import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<OnboardingData> pages = [
  OnboardingData(
    title: "We serve incomparable delicacies",
    description: "All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!",
    image: "assets/images/onboarding1.png",
  ),
  OnboardingData(
    title: "We serve incomparable delicacies",
    description: "All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!",
    image: "assets/images/onboarding2.png",
  ),
  OnboardingData(
    title: "We serve incomparable delicacies",
    description: "All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!",
    image: "assets/images/onboarding2.png",
  ),
];