import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pp_787/bloc/mood_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pp_787/bloc/reflection_state.dart';

import '../bloc/moods_bloc.dart';
import '../gen/assets.gen.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';
import '../utils/constants.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final double _padding = 16;
  DateTime _currentDate = DateUtils.dateOnly(DateTime.now());
  final List<DateTime> _currentMonthDaysInWeeks = [];

  void _updateCurrentMonthDaysInWeeks() {
    final DateTime startDayOfMonth = _currentDate.copyWith(day: 1);
    final DateTime endDayOfMonth = _currentDate.copyWith(month: _currentDate.month + 1, day: 1);
    final DateTime start = startDayOfMonth.subtract(Duration(days: startDayOfMonth.weekday - 1));
    final DateTime end = endDayOfMonth.add(Duration(days: DateTime.daysPerWeek - endDayOfMonth.weekday));
    _currentMonthDaysInWeeks.clear();
    for (DateTime day = start; !day.isAfter(end); day = day.add(const Duration(days: 1))) {
      _currentMonthDaysInWeeks.add(day);
    }
  }

  void _updateCurrentDay(DateTime day) {
    _currentDate = DateUtils.dateOnly(day);
  }

  bool _isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  bool _isDateInMonth(DateTime date, int month) {
    return date.month == month;
  }

  @override
  void initState() {
    super.initState();
    _updateCurrentMonthDaysInWeeks();
    context.read<MoodsBloc>().updateDate(_currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_padding, _padding, _padding, 0),
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
                    const Text('Timeline', style: AppStyles.displaySmall,)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 32,),
                            const Text('Your week', style: AppStyles.bodyMedium,),
                            const SizedBox(height: 16,),
                            BlocSelector<MoodsBloc, MoodsState, List<MoodState>>(
                              selector: (state) => state.moods,
                              builder: (context, moods) {
                                final start = _currentDate.subtract(Duration(days: _currentDate.weekday - 1));
                                final end = start.add(const Duration(days: 6));
                                final List<MoodState> currentWeekMoods = moods.where((e) => (!e.date!.isBefore(start) && e.date!.isBefore(end))).toList();
                                if (currentWeekMoods.isNotEmpty) {
                                  final int positiveMoods = currentWeekMoods.where((e) => (e.generallyFeeling == AppConstants.generalFeelings[0].$4)).length;
                                  final int neutralMoods = positiveMoods + currentWeekMoods.where((e) => e.generallyFeeling == AppConstants.generalFeelings[1].$4).length;

                                  final neutralMoodsWidth = MediaQuery.of(context).size.width * (neutralMoods /currentWeekMoods.length) - _padding < 0 ?
                                  MediaQuery.of(context).size.width * (neutralMoods /currentWeekMoods.length) :
                                  MediaQuery.of(context).size.width * (neutralMoods /currentWeekMoods.length) - _padding;

                                  final positiveMoodsWidth = MediaQuery.of(context).size.width * (positiveMoods / currentWeekMoods.length) - _padding < 0 ?
                                  MediaQuery.of(context).size.width * (positiveMoods / currentWeekMoods.length) :
                                  MediaQuery.of(context).size.width * (positiveMoods / currentWeekMoods.length) - _padding;
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 36,
                                        color: AppColors.blue,
                                        child: Stack(
                                          children: [
                                            AnimatedContainer(
                                              duration: AppConstants.duration200,
                                              width: neutralMoodsWidth,
                                              color: AppColors.gray,
                                            ),
                                            AnimatedContainer(
                                              duration: AppConstants.duration200,
                                              width: positiveMoodsWidth,
                                              color: AppColors.orange,
                                            )
                                          ],
                                        )
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        image: DecorationImage(image: AssetImage(Assets.images.noDataYet.path), fit: BoxFit.fill)
                                    ),
                                    child: const Center(child: Text('No data yet', style: AppStyles.bodyMedium,)),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 32,),
                            const Text('Your month', style: AppStyles.bodyMedium,),
                            const SizedBox(height: 16,),
                            BlocSelector<MoodsBloc, MoodsState, List<MoodState>>(
                              selector: (state) => state.moods,
                              builder: (context, moods) {
                                final start = _currentDate.copyWith(day: 1);
                                final List<MoodState> currentMonthMoods = moods.where((e) => (!e.date!.isBefore(start) && e.date!.isBefore(start.copyWith(month: start.month + 1)))).toList();
                                if (currentMonthMoods.isNotEmpty) {
                                  final int positiveMoods = currentMonthMoods.where((e) => (e.generallyFeeling == AppConstants.generalFeelings[0].$4)).length;
                                  final int neutralMoods = positiveMoods + currentMonthMoods.where((e) => e.generallyFeeling == AppConstants.generalFeelings[1].$4).length;

                                  final neutralMoodsWidth = MediaQuery.of(context).size.width * (neutralMoods / currentMonthMoods.length) - _padding < 0 ?
                                  MediaQuery.of(context).size.width * (neutralMoods / currentMonthMoods.length) :
                                  MediaQuery.of(context).size.width * (neutralMoods / currentMonthMoods.length) - _padding;

                                  final positiveMoodsWidth = MediaQuery.of(context).size.width * (positiveMoods / currentMonthMoods.length) - _padding < 0 ?
                                  MediaQuery.of(context).size.width * (positiveMoods / currentMonthMoods.length) :
                                  MediaQuery.of(context).size.width * (positiveMoods / currentMonthMoods.length) - _padding;
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 36,
                                        color: AppColors.blue,
                                        child: Stack(
                                          children: [
                                            AnimatedContainer(
                                              duration: AppConstants.duration200,
                                              width: neutralMoodsWidth,
                                              color: AppColors.gray,
                                            ),
                                            AnimatedContainer(
                                              duration: AppConstants.duration200,
                                              width: positiveMoodsWidth,
                                              color: AppColors.orange,
                                            )
                                          ],
                                        )
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        image: DecorationImage(image: AssetImage(Assets.images.noDataYet.path), fit: BoxFit.fill)
                                    ),
                                    child: const Center(child: Text('No data yet', style: AppStyles.bodyMedium,)),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 32,),
                            const Text('Your year', style: AppStyles.bodyMedium,),
                            const SizedBox(height: 16,),
                            BlocSelector<MoodsBloc, MoodsState, List<MoodState>>(
                              selector: (state) => state.moods,
                              builder: (context, moods) {
                                final start = _currentDate.copyWith(month: 1, day: 1);
                                final end = DateUtils.dateOnly(DateTime(start.year, 12, 31));
                                final List<MoodState> currentYearMoods = moods.where((e) => (!e.date!.isBefore(start) && e.date!.isBefore(end))).toList();
                                if (currentYearMoods.isNotEmpty) {
                                  final int positiveMoods = currentYearMoods.where((e) => (e.generallyFeeling == AppConstants.generalFeelings[0].$4)).length;
                                  final int neutralMoods = positiveMoods + currentYearMoods.where((e) => e.generallyFeeling == AppConstants.generalFeelings[1].$4).length;

                                  final neutralMoodsWidth = MediaQuery.of(context).size.width * (neutralMoods / currentYearMoods.length) - _padding < 0 ?
                                  MediaQuery.of(context).size.width * (neutralMoods / currentYearMoods.length) :
                                  MediaQuery.of(context).size.width * (neutralMoods / currentYearMoods.length) - _padding;

                                  final positiveMoodsWidth = MediaQuery.of(context).size.width * (positiveMoods / currentYearMoods.length) - _padding < 0 ?
                                  MediaQuery.of(context).size.width * (positiveMoods / currentYearMoods.length) :
                                  MediaQuery.of(context).size.width * (positiveMoods / currentYearMoods.length) - _padding;
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 36,
                                        color: AppColors.blue,
                                        child: Stack(
                                          children: [
                                            AnimatedContainer(
                                              duration: AppConstants.duration200,
                                              width: neutralMoodsWidth,
                                              color: AppColors.gray,
                                            ),
                                            AnimatedContainer(
                                              duration: AppConstants.duration200,
                                              width: positiveMoodsWidth,
                                              color: AppColors.orange,
                                            )
                                          ],
                                        )
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        image: DecorationImage(image: AssetImage(Assets.images.noDataYet.path), fit: BoxFit.fill)
                                    ),
                                    child: const Center(child: Text('No data yet', style: AppStyles.bodyMedium,)),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            width: 174,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, _currentDate.day);
                                      _updateCurrentMonthDaysInWeeks();
                                    });
                                  },
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Center(
                                      child: SvgPicture.asset(Assets.icons.chevronLeft),
                                    ),
                                  ),
                                ),
                                Text(DateFormat.MMMM().format(_currentDate), style: AppStyles.displaySmall,),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, _currentDate.day);
                                      _updateCurrentMonthDaysInWeeks();
                                    });
                                  },
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Center(
                                      child: SvgPicture.asset(Assets.icons.chevronRight),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentDate = DateTime(_currentDate.year - 1, _currentDate.month, _currentDate.day);
                                      _updateCurrentMonthDaysInWeeks();
                                    });
                                  },
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Center(
                                      child: SvgPicture.asset(Assets.icons.chevronLeft),
                                    ),
                                  ),
                                ),
                                Text(DateFormat.y().format(_currentDate), style: AppStyles.displaySmall,),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentDate = DateTime(_currentDate.year + 1, _currentDate.month, _currentDate.day);
                                      _updateCurrentMonthDaysInWeeks();
                                    });
                                  },
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Center(
                                      child: SvgPicture.asset(Assets.icons.chevronRight),
                                    ),
                                  ),
                                 ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32,),
                      Center(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(_currentMonthDaysInWeeks.length, (index) =>
                             _isDateInMonth(_currentMonthDaysInWeeks[index], _currentDate.month) ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentDate = _currentMonthDaysInWeeks[index];
                                });
                                context.read<MoodsBloc>().updateDate(_currentDate);
                              },
                              child: Container(
                                width: (MediaQuery.of(context).size.width - 32 - 8 * 6) / 7,
                                height: (MediaQuery.of(context).size.width - 32 - 8 * 6) / 7,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentMonthDaysInWeeks[index] == DateUtils.dateOnly(DateTime.now()) ? AppColors.primary :
                                      !_isWeekend(_currentMonthDaysInWeeks[index]) ? AppColors.surface : AppColors.redLight,
                                  border: _currentMonthDaysInWeeks[index] == _currentDate ? Border.all(width: 2, color: AppColors.primary) : null,
                                  boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 16,
                                          offset: const Offset(0, 4)
                                      )
                                    ],
                                ),
                                child: Center(
                                  child: Text(
                                    DateFormat.d().format(_currentMonthDaysInWeeks[index]),
                                    style: AppStyles.bodyMedium.copyWith(color: _currentMonthDaysInWeeks[index] == DateUtils.dateOnly(DateTime.now()) ? AppColors.white : AppColors.black),
                                  ),
                                ),
                              ),
                            ) : SizedBox(
                               width: (MediaQuery.of(context).size.width - 32 - 8 * 6) / 7,
                               height: (MediaQuery.of(context).size.width - 32 - 8 * 6) / 7,
                             )
                          ),
                        ),
                      ),
                      BlocBuilder<MoodsBloc, MoodsState>(
                        builder: (context, state) {
                          List<MoodState> currentMoods = state.moods.where((e) => e.date == state.date).toList();
                          List<ReflectionState> currentReflections = state.reflections.where((e) => e.date == state.date).toList();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 32,),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: _padding),
                                  child: Text('${DateFormat.d().format(state.date!)} ${DateFormat.MMMM().format(state.date!)}',
                                    style: AppStyles.displaySmall,)
                              ),
                              const SizedBox(height: 32,),
                              if (currentMoods.isNotEmpty)
                                Column(
                                  children: [
                                    ...List.generate(currentMoods.length, (index) =>
                                        Column(
                                          children: [
                                            const Divider(height: 1, color: AppColors.secondary,),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              height: 60,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          width: 60,
                                                          padding: const EdgeInsets.all(12),
                                                          child: Image(image: AssetImage(currentMoods[index].iconPath!)
                                                          )
                                                      ),
                                                      const SizedBox(width: 16,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(height: 8,),
                                                          Text(currentMoods[index].name!, style: AppStyles.bodyMedium,),
                                                          const SizedBox(height: 8,),
                                                          Text('Triggered by: ${currentMoods[index].triggeredBy}', style: AppStyles.labelMedium,)
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                                    child: Container(
                                                      width: 48,
                                                      height: 48,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: AppConstants.generalFeelings.where((e) => e.$4 == currentMoods[index].generallyFeeling).first.$3
                                                      ),
                                                      child: Center(
                                                        child: Text('${currentMoods[index].strength}/5', style: AppStyles.displaySmall.copyWith(color: AppColors.white),),),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                const Divider(height: 1, color: AppColors.secondary,),
                                  ],
                                ),


                              if (currentReflections.isNotEmpty)
                                Column(
                                  children: [
                                    if (currentMoods.isEmpty)
                                      const Divider(height: 1, color: AppColors.secondary,),
                                    ...List.generate(currentReflections.length, (index) =>
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 380,
                                                      decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(32),
                                                              topRight: Radius.circular(32)
                                                          ),
                                                          color: Colors.white
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(height: 10,),
                                                          Center(
                                                            child: Container(
                                                              width: 84,
                                                              height: 6,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(6),
                                                                  color: AppColors.gray
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10,),
                                                          const Divider(height: 1, color: AppColors.secondary,),
                                                          const SizedBox(height: 16,),
                                                          const Padding(
                                                            padding: EdgeInsets.only(left: 16),
                                                            child: Text('When did you feel the same thing?', style: AppStyles.labelMedium,),
                                                          ),
                                                          const SizedBox(height: 16,),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 16),
                                                            child: Text(currentReflections[index].feelSameThing!, style: AppStyles.bodyMedium,),
                                                          ),
                                                          const SizedBox(height: 16,),

                                                          const Divider(height: 1, color: AppColors.secondary,),
                                                          const SizedBox(height: 16,),
                                                          const Padding(
                                                            padding: EdgeInsets.only(left: 16),
                                                            child: Text('How would you describe this to another person?', style: AppStyles.labelMedium,),
                                                          ),
                                                          const SizedBox(height: 16,),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 16),
                                                            child: Text(currentReflections[index].describeAnotherPerson!, style: AppStyles.bodyMedium,),
                                                          ),
                                                          const SizedBox(height: 16,),

                                                          const Divider(height: 1, color: AppColors.secondary,),
                                                          const SizedBox(height: 16,),
                                                          const Padding(
                                                            padding: EdgeInsets.only(left: 16),
                                                            child: Text('How does this emotion influence your actions?', style: AppStyles.labelMedium,),
                                                          ),
                                                          const SizedBox(height: 16,),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 16),
                                                            child: Text(currentReflections[index].emotionInfluenceActions!, style: AppStyles.bodyMedium,),
                                                          ),
                                                          const SizedBox(height: 16,),

                                                          const Divider(height: 1, color: AppColors.secondary,),
                                                          const SizedBox(height: 16,),
                                                          const Padding(
                                                            padding: EdgeInsets.only(left: 16),
                                                            child: Text('Where do you feel this emotion in your body?', style: AppStyles.labelMedium,),
                                                          ),
                                                          const SizedBox(height: 16,),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 16),
                                                            child: Text(currentReflections[index].emotionInBody!, style: AppStyles.bodyMedium,),
                                                          ),
                                                          const SizedBox(height: 16,),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                              );
                                              },
                                              behavior: HitTestBehavior.opaque,
                                              child: SizedBox(
                                                height: 60,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: (MediaQuery.of(context).size.width - 8) / 3,
                                                        child: Center(child: Text(currentReflections[index].firstWord!, style: AppStyles.bodyMedium,))),
                                                    Container(
                                                      width: 4,
                                                      height: 4,
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: AppColors.orange
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: (MediaQuery.of(context).size.width - 8) / 3,
                                                        child: Center(child: Text(currentReflections[index].secondWord!, style: AppStyles.bodyMedium,))),
                                                    Container(
                                                      width: 4,
                                                      height: 4,
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: AppColors.orange
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: (MediaQuery.of(context).size.width - 8) / 3,
                                                        child: Center(child: Text(currentReflections[index].thirdWord!, style: AppStyles.bodyMedium,))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(height: 1, color: AppColors.secondary,),
                                          ],
                                        )
                                    ),
                                  ],
                                ),

                              if (currentMoods.isEmpty && currentReflections.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Image.asset(Assets.images.noDataCalendar.path, fit: BoxFit.fitWidth,),
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
