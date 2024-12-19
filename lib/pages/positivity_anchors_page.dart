import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_787/bloc/anchor_state.dart';
import 'package:pp_787/navigation/routes.dart';

import '../bloc/moods_bloc.dart';
import '../gen/assets.gen.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class PositivityAnchorsPage extends StatelessWidget {
  const PositivityAnchorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                  const Text('Positivity anchors', style: AppStyles.displaySmall,)
                ],
              ),
            ),
            const SizedBox(height: 32,),
            BlocSelector<MoodsBloc, MoodsState, List<AnchorState>>(
              selector: (state) => state.anchors,
              builder: (context, anchors) {
                if (anchors.isNotEmpty) {
                  return Column(
                    children: [
                      ...List.generate(
                          anchors.length,
                          (index) =>
                              Column(
                                children: [
                                  const Divider(height: 1, color: AppColors.secondary,),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => Navigator.of(context).pushNamed(AppRoutes.editPositivityAnchors, arguments: anchors[index]),
                                    child: SizedBox(
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              padding: const EdgeInsets.all(20),
                                              child: SvgPicture.asset(Assets.icons.star),
                                            ),
                                            Expanded(child: Text(anchors[index].name, style: AppStyles.bodyMedium,)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                      ),
                      const Divider(height: 1, color: AppColors.secondary,),
                      const SizedBox(height: 32,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Opacity(
                            opacity: 1,
                            child: CupertinoButton(
                                color: AppColors.primary,
                                disabledColor: AppColors.primary,
                                borderRadius: BorderRadius.circular(64),
                                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.editPositivityAnchors),
                                child: Text('Add anchor', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Image.asset(Assets.images.writeDownThings.path),
                      const SizedBox(height: 32,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Opacity(
                          opacity: 1,
                          child: CupertinoButton(
                              color: AppColors.primary,
                              disabledColor: AppColors.primary,
                              borderRadius: BorderRadius.circular(64),
                              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.editPositivityAnchors),
                              child: Text('Add anchor', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                        ),
                      ),
                    ],
                  );
                }

              },
            )
          ],
        ),
      ),
    );
  }
}
