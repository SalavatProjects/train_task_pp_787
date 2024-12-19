import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_787/bloc/moods_bloc.dart';
import 'package:pp_787/bloc/trigger_bloc.dart';
import 'package:pp_787/main.dart';

import '../bloc/trigger_state.dart';
import '../gen/assets.gen.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class CreateTriggerNamePage extends StatefulWidget {
  const CreateTriggerNamePage({super.key});

  @override
  State<CreateTriggerNamePage> createState() => _CreateTriggerNamePageState();
}

class _CreateTriggerNamePageState extends State<CreateTriggerNamePage> {
  final TextEditingController _triggerNameTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _triggerNameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
      SingleChildScrollView(
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
                  const Text(
                    'Emotional trigger map', style: AppStyles.displaySmall,)
                ],
              ),
              const SizedBox(height: 32,),
              Image.asset(Assets.images.triggerNameCreated.path),
              const SizedBox(height: 32,),
              const Text('Trigger name', style: AppStyles.labelMedium,),
              const SizedBox(height: 8,),
              Container(
                width: MediaQuery.of(context).size.width / 2,
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
                  controller: _triggerNameTextController,
                  style: AppStyles.bodyMedium,
                  onChanged: (String value) {
                    context.read<TriggerBloc>().updateName(value);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      hintText: 'A friend group brunch',
                      hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              BlocBuilder<TriggerBloc, TriggerState>(
                builder: (context, state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Opacity(
                      opacity: state.name != null && state.name != ''
                          ? 1 : 0.65,
                      child: CupertinoButton(
                          color: AppColors.primary,
                          disabledColor: AppColors.primary,
                          borderRadius: BorderRadius.circular(64),
                          onPressed: state.name != null && state.name != ''
                              ?
                              () {
                                context.read<MoodsBloc>().addTrigger(state);
                                Navigator.of(context).pop();
                              } : null,
                          child: Text('Add new trigger', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      )
      ),
    );
  }
}
