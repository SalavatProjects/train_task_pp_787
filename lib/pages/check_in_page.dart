import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pp_787/navigation/routes.dart';
import 'package:pp_787/ui_kit/app_colors.dart';
import 'package:pp_787/ui_kit/app_styles.dart';
import 'package:pp_787/utils/constants.dart';

import '../bloc/mood_bloc.dart';
import '../bloc/mood_state.dart';
import '../bloc/moods_bloc.dart';
import '../gen/assets.gen.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {

  late ScrollController _scrollController;
  final double _scrollPosition = 0.0;
  bool _isPreMade = false;
  bool _isCheckedIn = false;
  final TextEditingController _frustrationTextController = TextEditingController();
  final TextEditingController _triggeredByTextController = TextEditingController();
  Color _sliderColor = AppConstants.generalFeelings[1].$3;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollPosition);
    });
    context.read<MoodBloc>().updateStrength(2);
    context.read<MoodBloc>().updateDate(DateUtils.dateOnly(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
                child: Row(
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
                    const Text('Check in', style: AppStyles.displaySmall,)
                  ],
                ),
              ),
              if (!_isCheckedIn)
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32,),
                      if (!_isPreMade)
                        Column(
                          children: [
                            Center(
                              child: BlocSelector<MoodBloc, MoodState, String?>(
                                selector: (state) => state.iconPath,
                                builder: (context, iconPath) {
                                  return Wrap(
                                    spacing: 32,
                                    runSpacing: 32,
                                    children: List.generate(
                                        AppConstants.customEmotions.length, (index)
                                    => _EmotionCard(
                                        iconPath: AppConstants.customEmotions[index],
                                        isSelected: AppConstants.customEmotions[index] == iconPath,
                                        onTap: () => context.read<MoodBloc>().updateIconPath(AppConstants.customEmotions[index])
                                    )
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 32,),
                                  const Text('Name that emotion', style: AppStyles.labelMedium,),
                                  const SizedBox(height: 8,),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 42,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.surface,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 16,
                                              offset: const Offset(0, 4)
                                          )
                                        ]
                                    ),
                                    child: TextFormField(
                                      controller: _frustrationTextController,
                                      style: AppStyles.bodyMedium,
                                      onChanged: (String value) {
                                        context.read<MoodBloc>().updateName(value);
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                          hintText: 'Frustration',
                                          hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 32,),
                                  _UseEmotionBtn(
                                      text: 'Use pre-made emotions',
                                      onPressed: () {
                                        setState(() {
                                          _isPreMade = true;
                                        });
                                        _frustrationTextController.clear();
                                        context.read<MoodBloc>().setIconPathToNull();
                                        context.read<MoodBloc>().setNameToNull();
                                      })
                                ],
                              ),
                            ),
                          ],
                        ) else
                        Column(
                          children: [
                            BlocSelector<MoodBloc, MoodState, String?>(
                              selector: (state) => state.iconPath,
                              builder: (context, iconPath) {
                                return Center(
                                  child: Wrap(
                                    spacing: 32,
                                    runSpacing: 32,
                                    children: List.generate(
                                        AppConstants.preMadeEmotions.length, (index)
                                    => _EmotionCard(
                                        iconPath: AppConstants.preMadeEmotions[index].$1,
                                        isSelected: AppConstants.preMadeEmotions[index].$1 == iconPath,
                                        text: AppConstants.preMadeEmotions[index].$2,
                                        onTap: () {
                                          context.read<MoodBloc>().updateIconPath(AppConstants.preMadeEmotions[index].$1);
                                          context.read<MoodBloc>().updateName(AppConstants.preMadeEmotions[index].$2);
                                        }
                                    )
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 32,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: _UseEmotionBtn(
                                  text: 'Use custom emotion',
                                  onPressed: () {
                                    setState(() {
                                      _isPreMade = false;
                                    });
                                    context.read<MoodBloc>().setIconPathToNull();
                                  }),
                            )
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 32,),
                            BlocSelector<MoodBloc, MoodState, int?>(
                              selector: (state) => state.generallyFeeling,
                              builder: (context, generallyFeeling) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      AppConstants.generalFeelings.length,
                                          (index) => _GenerallyFeelingCard(
                                          imagePath: AppConstants.generalFeelings[index].$1,
                                          text: AppConstants.generalFeelings[index].$2,
                                          isSelected: AppConstants.generalFeelings[index].$4 == generallyFeeling,
                                          onTap: () {
                                            context.read<MoodBloc>().updateGenerallyFilled(AppConstants.generalFeelings[index].$4);
                                            setState(() {
                                              _sliderColor = AppConstants.generalFeelings[index].$3;
                                            });
                                          })
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 32,),
                            const Text('How strong is that feeling', style: AppStyles.bodyMedium,),
                            const SizedBox(height: 32,),
                            BlocSelector<MoodBloc, MoodState, int>(
                              selector: (state) => state.strength,
                              builder: (context, strength) {
                                return SliderTheme(
                                    data: SliderThemeData(
                                      thumbColor: _sliderColor,
                                      activeTrackColor: _sliderColor,
                                    ),
                                    child: Slider(
                                        value: strength.toDouble(),
                                        divisions: 5,
                                        max: 5,
                                        onChanged: (double value) => context.read<MoodBloc>().updateStrength(value.toInt()))
                                );
                              },
                            ),
                            const SizedBox(height: 32,),
                            const Text('What was this emotion triggered by', style: AppStyles.labelMedium,),
                            const SizedBox(height: 8,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 42,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.surface,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 16,
                                        offset: const Offset(0, 4)
                                    )
                                  ]
                              ),
                              child: TextFormField(
                                controller: _triggeredByTextController,
                                style: AppStyles.bodyMedium,
                                onChanged: (String value) {
                                  context.read<MoodBloc>().updateTriggeredBy(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: 'A conversation I had',
                                    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,)
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ) else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 32,),
                      const Text('You are checked in', style: AppStyles.displayLarge,),
                      const SizedBox(height: 32,),
                      Image(image: AssetImage(Assets.images.checkedIn.path), fit: BoxFit.fitHeight,),
                    ],
                  ),
                ),
              ],
          )
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: BlocBuilder<MoodBloc, MoodState>(
              builder: (context, state) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Opacity(
                    opacity:
                    state.iconPath != null && (_isPreMade ? true : state.name != null) &&
                    state.generallyFeeling != null && state.triggeredBy != null
                    ? 1 : 0.65,
                    child: CupertinoButton(
                        color: AppColors.primary,
                        disabledColor: AppColors.primary,
                        borderRadius: BorderRadius.circular(64),
                        onPressed: state.iconPath != null && (_isPreMade ? true : state.name != null) &&
                            state.generallyFeeling != null && state.triggeredBy != null
                            ?
                            () {
                          if (!_isCheckedIn) {
                            setState(() {
                              _isCheckedIn = true;
                            });
                          } else {
                            context.read<MoodsBloc>().addMood(state);
                            Navigator.of(context).pop();
                          }

                        } : null,
                        child: Text(_isCheckedIn ? 'Save' : 'Submit', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                  ),
                );
              },
            ),
          )
      ),
    );
  }
}

class _EmotionCard extends StatelessWidget {
  final String? text;
  final String iconPath;
  bool isSelected;
  void Function() onTap;

  _EmotionCard({
    super.key,
    this.text,
    required this.iconPath,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.surface,
                border: isSelected ? Border.all(color: AppColors.primary, width: 4) : null,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4)
                  )
                ]
              ),
              child: Image(image: AssetImage(iconPath)),
            ),
          ),
          if (text != null)
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(text!, style: AppStyles.bodyMedium, textAlign: TextAlign.center,),
            )
        ],
      ),
    );
  }
}

class _UseEmotionBtn extends StatelessWidget {
  final String text;
  void Function() onPressed;

  _UseEmotionBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 54,
      child: CupertinoButton(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(64),
        onPressed: onPressed,
        child: Text(text, style: AppStyles.bodyMedium,)),
    );
  }
}

class _GenerallyFeelingCard extends StatelessWidget {
  final String imagePath;
  final String text;
  bool isSelected;
  void Function() onTap;

  _GenerallyFeelingCard({
    super.key,
    required this.imagePath,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 70,
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: AppColors.primary, width: 4) : null,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)
        ),
        child: Center(
          child: Text(text, style: AppStyles.bodyMedium.copyWith(color: AppColors.white),),
        ),
      ),
    );
  }
}
