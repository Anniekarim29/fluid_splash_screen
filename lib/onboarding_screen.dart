import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:onboarding_screens/widgets/onboarding_item_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Discover Hidden Gems',
      'description': 'Explore the world\'s most breathtaking landscapes and find beauty in the unexpected.',
      'image': 'assets/picture1.jpg',
    },
    {
      'title': 'Step Back in Time',
      'description': 'Visit iconic landmarks and historical treasures that tell the story of our world.',
      'image': 'assets/picture2.jpg',
    },
    {
      'title': 'Connect with Nature',
      'description': 'Experience tranquil beauty in every corner, from rolling hills to serene rice terraces.',
      'image': 'assets/picture3.jpg',
    },
    {
      'title': 'Escape to Paradise',
      'description': 'Sun, sand, and serenity await you in the most exotic and peaceful destinations.',
      'image': 'assets/picture4.jpg',
    },
    {
      'title': 'Start Your Journey',
      'description': 'Your next great adventure begins here. Let us guide you to your dream destination.',
      'image': 'assets/picture5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Navigate to Home or Login when reaching the end of the swipe?
    // LiquidSwipe doesn't have an "end" callback easily without using a controller listener.
    // For now, we will just let it serve as the visual onboarding.
    
    final pages = _onboardingData.map((data) {
      return OnboardingItemWidget(
        title: data['title']!,
        description: data['description']!,
        imagePath: data['image']!,
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: LiquidSwipe(
        pages: pages,
        enableLoop: false,
        fullTransitionValue: 600, // Smooth transition duration
        slideIconWidget: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        positionSlideIcon: 0.8, // 80% down the screen
        enableSideReveal: true, // "Tease" the next page
        waveType: WaveType.liquidReveal,
        ignoreUserGestureWhileAnimating: true,
      ),
    );
  }
}
