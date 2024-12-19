import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../gen/assets.gen.dart';
import '../navigation/routes.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';
import '../utils/constants.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _currentPage = 0;
  String _btnText = 'Next';

  void _nextPage() {
    if (_currentPage == 2) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.main);
    } else {
      setState(() {
        _currentPage++;
        if (_currentPage == 2) {
          _btnText = 'Start';
        }
      });
      _controller.nextPage(
          duration: AppConstants.duration200,
          curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]
    );
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark
        )
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(Assets.images.onboarding1.path), fit: BoxFit.fill)
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 90,),
                      Text('Your personal wellbeing journal', style: AppStyles.displayLarge,),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.images.onboarding2.path), fit: BoxFit.fill)
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 90,),
                      Text('Express your feelings your way', style: AppStyles.displayLarge,),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.images.onboarding3.path), fit: BoxFit.fill)
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 90,),
                      Text('Emotional intelligence tools and exercises', style: AppStyles.displayLarge,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _ThreeDots(currentPage: _currentPage),
                  const SizedBox(height: 12,),
                  _NextBtn(onTap: _nextPage, text: _btnText),
                  const SizedBox(height: 18,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NextBtn extends StatelessWidget {
  void Function() onTap;
  String text;
  _NextBtn({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 343,
        height: 54,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: AppColors.primary
        ),
        child: Center(
          child: Text(text, style: AppStyles.bodyMedium.copyWith(color: AppColors.white),),
        ),
      ),
    );
  }
}

class _ThreeDots extends StatelessWidget {
  int currentPage;

  _ThreeDots({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i <= 2; i++)
            AnimatedContainer(
              duration: AppConstants.duration200,
              curve: Curves.easeInOut,
              width: 32,
              height: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: i == currentPage ? AppColors.white : AppColors.white.withOpacity(0.3)
              ),
            )
        ],
      ),
    );
  }
}