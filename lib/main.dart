import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pp_787/bloc/reflection_bloc.dart';
import 'package:pp_787/bloc/trigger_state.dart';
import 'package:pp_787/navigation/routes.dart';
import 'package:pp_787/pages/check_in_page.dart';
import 'package:pp_787/pages/create_trigger_name_page.dart';
import 'package:pp_787/pages/main_page.dart';
import 'package:pp_787/pages/onboarding_page.dart';
import 'package:pp_787/pages/privacy_page.dart';
import 'package:pp_787/pages/reflection_page.dart';
import 'package:pp_787/pages/splash_page.dart';
import 'package:pp_787/pages/timeline_page.dart';
import 'package:pp_787/pages/trigger_emotions_page.dart';
import 'package:pp_787/pages/trigger_page.dart';
import 'package:pp_787/pages/trigger_records_page.dart';
import 'package:pp_787/remote_config.dart';
import 'package:pp_787/storages/isar.dart';
import 'package:pp_787/storages/shared_preferences.dart';
import 'package:pp_787/bloc/moods_bloc.dart';
import 'package:pp_787/ui_kit/app_colors.dart';

import 'bloc/mood_bloc.dart';
import 'bloc/trigger_bloc.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await RemoteConfigService.init();
  await AppSharedPrefernces.init();
  await AppIsarDatabase.init();

  final isFirstRun = AppSharedPrefernces.getIsFirstRun() ?? true;
  if (isFirstRun) await AppSharedPrefernces.setNotFirstRun();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
      AppInfo(
          data: await AppInfoData.get(),
          child: MyApp(isFirstRun: isFirstRun,)
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstRun});

  final bool isFirstRun;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoodsBloc(),
      child: _AppWidget(isFirstRun: isFirstRun),
    );
  }
}

class _AppWidget extends StatelessWidget {
  const _AppWidget({required this.isFirstRun});

  final bool isFirstRun;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<MoodsBloc>().getMoods(),
      builder: (context, snapshot) {
        return FutureBuilder(
          future: context.read<MoodsBloc>().getReflections(),
          builder: (context, snapshot) {
            return FutureBuilder(
              future: context.read<MoodsBloc>().getTriggers(),
              builder: (context, snapshot) {
                return MaterialApp(
                  title: '',
                  themeMode: ThemeMode.light,
                  theme: ThemeData(
                    primaryColor: AppColors.primary,
                    scaffoldBackgroundColor: AppColors.background,
                    brightness: Brightness.light
                  ),
                  onUnknownRoute: (settings) => CupertinoPageRoute(
                      builder: (context) => const MainPage()
                  ),
                  onGenerateRoute: (settings) => switch (settings.name) {
                    AppRoutes.onBoarding => CupertinoPageRoute(
                      settings: settings,
                      builder: (context) => const OnboardingPage(),
                    ),
                    AppRoutes.main => CupertinoPageRoute(
                      settings: settings,
                      builder: (context) => const MainPage(),
                    ),
                  AppRoutes.privacy => CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => const PrivacyPage(),
                  ),
                  AppRoutes.checkIn => CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => BlocProvider(
                      create: (context) => MoodBloc(),
                      child: const CheckInPage(),
                    ),
                  ),
                  AppRoutes.timeline => CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => const TimelinePage()
                  ),
                  AppRoutes.reflection => CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => BlocProvider(
                      create: (context) => ReflectionBloc(),
                      child: const ReflectionPage(),
                    )
                  ),
                  AppRoutes.trigger => CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => const TriggerPage(),
                  ),
                  AppRoutes.createTriggerName => CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => BlocProvider(
                      create: (context) => TriggerBloc(),
                      child: const CreateTriggerNamePage(),
                    ),
                  ),
                  AppRoutes.triggerRecords => CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => TriggerRecordsPage(trigger: settings.arguments as TriggerState,)
                  ),
                  AppRoutes.triggerEmotions => CupertinoPageRoute(
                    settings: settings,
                    builder: (context) => TriggerEmotionsPage(trigger: settings.arguments as TriggerState)
                  ),
                  _ => null,
                  },
                  home: SplashPage(isFirstRun: !isFirstRun),
                );
              }
            );
          }
        );
      }
    );
  }
}
