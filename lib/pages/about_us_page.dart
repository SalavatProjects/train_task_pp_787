import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';
import '../ui_kit/app_styles.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(Assets.icons.chevronLeft),
                          ),
                        ),
                        const SizedBox(width: 6,),
                        const Text('About us', style: AppStyles.displaySmall,),
                      ],
                    ),
                    const SizedBox(height: 32,),
                    Text('''The prohibited or acceptable use clause in your terms of use agreement outlines all rules your users must follow when accessing your services.
Here is where you can list and ban behaviors and activities like:
Obscene, crude, or violent posts
False or misleading content
Breaking the law
Spamming or scamming the service or other users
Hacking or tampering with your website or app
Violating copyright laws
Harassing other users
Stalking other users
If your website or app gives users a lot of control and freedom while using your services, consider putting multiple use clauses within your terms of use.  The prohibited or acceptable use clause in your terms of use agreement outlines all rules your users must follow when accessing your services.
Here is where you can list and ban behaviors and activities like:
Obscene, crude, or violent posts
False or misleading content
Breaking the law
Spamming or scamming the service or other users
Hacking or tampering with your website or app
Violating copyright laws
Harassing other users
Stalking other users
If your website or app gives users a lot of control and freedom while using your services, consider putting multiple use clauses within your terms of use.

The prohibited or acceptable use clause in your terms of use agreement outlines all rules your users must follow when accessing your services.
Here is where you can list and ban behaviors and activities like:
Obscene, crude, or violent posts
False or misleading content
Breaking the law
Spamming or scamming the service or other users
Hacking or tampering with your website or app
Violating copyright laws
Harassing other users
Stalking other users
If your website or app gives users a lot of control and freedom while using your services, consider putting multiple use clauses within your terms of use. 
                    ''', style: AppStyles.bodyMedium,)
                  ],
                ),
              )),
      ),
    );
  }
}
