import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_787/ui_kit/app_colors.dart';
import 'package:pp_787/utils/constants.dart';

import '../bloc/moods_bloc.dart';
import '../bloc/reflection_bloc.dart';
import '../bloc/reflection_state.dart';
import '../gen/assets.gen.dart';
import '../ui_kit/app_styles.dart';

class ReflectionPage extends StatefulWidget {
  const ReflectionPage({super.key});

  @override
  State<ReflectionPage> createState() => _ReflectionPageState();
}

class _ReflectionPageState extends State<ReflectionPage> {
  final PageController _pageController = PageController();
  final TextEditingController _firstWordController = TextEditingController();
  final TextEditingController _secondWordController = TextEditingController();
  final TextEditingController _thirdWordController = TextEditingController();
  final TextEditingController _feelSameThingWordController = TextEditingController();
  final TextEditingController _describeAnotherPersonWordController = TextEditingController();
  final TextEditingController _emotionInfluenceActionsWordController = TextEditingController();
  final TextEditingController _emotionInBodyWordController = TextEditingController();
  int _currentPage = 0;
  String _btnText = 'Next';

  void _nextPage() {
    setState(() {
        _currentPage++;
        if (_currentPage == 2) {
          _btnText = 'Submit';
        }
      });
    _pageController.nextPage(
          duration: AppConstants.duration200,
          curve: Curves.easeInOut);
  }

  void _previousPage() {
    setState(() {
      _currentPage--;
    });
    _pageController.previousPage(
        duration: AppConstants.duration200,
        curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();
    context.read<ReflectionBloc>().updateDate(DateUtils.dateOnly(DateTime.now()));
  }
  
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _firstWordController.dispose();
    _secondWordController.dispose();
    _thirdWordController.dispose();
    _feelSameThingWordController.dispose();
    _describeAnotherPersonWordController.dispose();
    _emotionInfluenceActionsWordController.dispose();
    _emotionInBodyWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                    const Text('Reflection exercise', style: AppStyles.displaySmall,),
                  ],
                ),
              ),
              const SizedBox(height: 32,),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('Describe what you feel in three words',style: AppStyles.displayLarge,),
                          ),
                          const SizedBox(height: 32,),
                          BlocBuilder<ReflectionBloc, ReflectionState>(
                            builder: (context, state) {
                              return Center(
                                child: SizedBox(
                                  width: 200,
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      _ReflectionCircle(
                                        color: AppColors.blue,
                                        isWordFilled: state.firstWord != null && state.firstWord != '',
                                      ),
                                      _ReflectionCircle(
                                        color: AppColors.orange,
                                        isWordFilled: state.secondWord != null && state.secondWord != '',
                                      ),
                                      _ReflectionCircle(
                                        color: AppColors.red,
                                        isWordFilled: state.thirdWord != null && state.thirdWord != '',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 32,),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 32,
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
                                controller: _firstWordController,
                                style: AppStyles.bodyMedium,
                                onChanged: (String value) {
                                  context.read<ReflectionBloc>().updateFirstWord(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: 'First word',
                                    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 32,
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
                                controller: _secondWordController,
                                style: AppStyles.bodyMedium,
                                onChanged: (String value) {
                                  context.read<ReflectionBloc>().updateSecondWord(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: 'Second word',
                                    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 32,
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
                                controller: _thirdWordController,
                                style: AppStyles.bodyMedium,
                                onChanged: (String value) {
                                  context.read<ReflectionBloc>().updateThirdWord(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: 'Third word',
                                    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: BlocBuilder<ReflectionBloc, ReflectionState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Opacity(
                                    opacity: state.firstWord != null && state.firstWord != '' &&
                                        state.secondWord != null && state.secondWord != '' &&
                                        state.thirdWord != null && state.thirdWord != ''
                                        ? 1 : 0.65,
                                    child: CupertinoButton(
                                        color: AppColors.primary,
                                        disabledColor: AppColors.primary,
                                        borderRadius: BorderRadius.circular(64),
                                        onPressed: state.firstWord != null && state.firstWord != '' &&
                                            state.secondWord != null && state.secondWord != '' &&
                                            state.thirdWord != null && state.thirdWord != ''
                                            ?
                                            () => _nextPage() : null,
                                        child: Text('Next', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('When did you feel the same thing?', style: AppStyles.displayLarge,),
                            const SizedBox(height: 32,),
                            Image.asset(Assets.images.sameThing.path),
                            const SizedBox(height: 32,),
                            Container(
                              width: MediaQuery.of(context).size.width - 32,
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
                                controller: _feelSameThingWordController,
                                style: AppStyles.bodyMedium,
                                onChanged: (String value) {
                                  context.read<ReflectionBloc>().updateFeelSameThing(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: 'Describe the situation',
                                    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => _previousPage(),
                                  child: Container(
                                    width: 54,
                                    height: 54,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.secondary,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(Assets.icons.chevronLeft),),
                                  ),
                                ),
                                const SizedBox(width: 16,),
                                BlocBuilder<ReflectionBloc, ReflectionState>(
                                  builder: (context, state) {
                                    return Expanded(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Opacity(
                                          opacity: state.feelSameThing != null && state.feelSameThing != ''
                                              ? 1 : 0.65,
                                          child: CupertinoButton(
                                              color: AppColors.primary,
                                              disabledColor: AppColors.primary,
                                              borderRadius: BorderRadius.circular(64),
                                              onPressed: state.feelSameThing != null && state.feelSameThing != ''
                                                  ?
                                                  () => _nextPage() : null,
                                              child: Text('Next', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('How would you describe this to another person', style: AppStyles.displayLarge,),
                            const SizedBox(height: 32,),
                            Image.asset(Assets.images.anotherPerson.path),
                            const SizedBox(height: 32,),
                            Container(
                              width: MediaQuery.of(context).size.width - 32,
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
                                controller: _describeAnotherPersonWordController,
                                style: AppStyles.bodyMedium,
                                onChanged: (String value) {
                                  context.read<ReflectionBloc>().updateDescribeAnotherPerson(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: 'Describe the situation',
                                    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => _previousPage(),
                                  child: Container(
                                    width: 54,
                                    height: 54,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.secondary,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(Assets.icons.chevronLeft),),
                                  ),
                                ),
                                const SizedBox(width: 16,),
                                BlocBuilder<ReflectionBloc, ReflectionState>(
                                  builder: (context, state) {
                                    return Expanded(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Opacity(
                                          opacity: state.describeAnotherPerson != null && state.describeAnotherPerson != ''
                                              ? 1 : 0.65,
                                          child: CupertinoButton(
                                              color: AppColors.primary,
                                              disabledColor: AppColors.primary,
                                              borderRadius: BorderRadius.circular(64),
                                              onPressed: state.describeAnotherPerson != null && state.describeAnotherPerson != ''
                                                  ?
                                                  () => _nextPage() : null,
                                              child: Text('Next', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('How does this emotion influence your actions', style: AppStyles.displayLarge,),
                            const SizedBox(height: 32,),
                            Image.asset(Assets.images.emotionInfluence.path),
                            const SizedBox(height: 32,),
                            Container(
                              width: MediaQuery.of(context).size.width - 32,
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
                                controller: _emotionInfluenceActionsWordController,
                                style: AppStyles.bodyMedium,
                                onChanged: (String value) {
                                  context.read<ReflectionBloc>().updateEmotionInfluenceActions(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: 'Describe the situation',
                                    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            BlocBuilder<ReflectionBloc, ReflectionState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Opacity(
                                    opacity: state.emotionInfluenceActions != null && state.emotionInfluenceActions != ''
                                        ? 1 : 0.65,
                                    child: CupertinoButton(
                                        color: AppColors.primary,
                                        disabledColor: AppColors.primary,
                                        borderRadius: BorderRadius.circular(64),
                                        onPressed: state.emotionInfluenceActions != null && state.emotionInfluenceActions != ''
                                            ?
                                            () => _nextPage() : null,
                                        child: Text('Next', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                                  ),
                                );
                              },
                            )

                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('Where do you feel this emotion in your body', style: AppStyles.displayLarge,),
                            const SizedBox(height: 32,),
                            Image.asset(Assets.images.emotionInBody.path),
                            const SizedBox(height: 32,),
                            Container(
                              width: MediaQuery.of(context).size.width - 32,
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
                                controller: _emotionInBodyWordController,
                                style: AppStyles.bodyMedium,
                                onChanged: (String value) {
                                  context.read<ReflectionBloc>().updateEmotionInBody(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    hintText: 'Describe the situation',
                                    hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => _previousPage(),
                                  child: Container(
                                    width: 54,
                                    height: 54,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.secondary,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(Assets.icons.chevronLeft),),
                                  ),
                                ),
                                const SizedBox(width: 16,),
                                BlocBuilder<ReflectionBloc, ReflectionState>(
                                  builder: (context, state) {
                                    return Expanded(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Opacity(
                                          opacity: state.emotionInBody != null && state.emotionInBody != ''
                                              ? 1 : 0.65,
                                          child: CupertinoButton(
                                              color: AppColors.primary,
                                              disabledColor: AppColors.primary,
                                              borderRadius: BorderRadius.circular(64),
                                              onPressed: state.emotionInBody != null && state.emotionInBody != ''
                                                  ?
                                                  () => _nextPage() : null,
                                              child: Text('Next', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Reflection complete', style: AppStyles.displayLarge,),
                          const SizedBox(height: 32,),
                          Image.asset(Assets.images.reflectionComplete.path),
                          const SizedBox(height: 32,),
                          BlocBuilder<ReflectionBloc, ReflectionState>(
                            builder: (context, state) {
                              return Expanded(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Opacity(
                                    opacity: 1,
                                    child: CupertinoButton(
                                        color: AppColors.primary,
                                        disabledColor: AppColors.primary,
                                        borderRadius: BorderRadius.circular(64),
                                        onPressed: () {
                                          context.read<MoodsBloc>().addReflection(state);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Submit', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}

class _ReflectionCircle extends StatelessWidget {
  final Color color;
  final bool isWordFilled;

  _ReflectionCircle({
    super.key,
    required this.color,
    this.isWordFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isWordFilled ? color : null,
        border: Border.all(width: 4, color: color),
      ),
    );
  }
}

