import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_787/bloc/anchor_state.dart';

import '../bloc/anchor_bloc.dart';
import '../bloc/moods_bloc.dart';
import '../gen/assets.gen.dart';
import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class EditPositivityAnchorsPage extends StatefulWidget {
  AnchorState? anchor;

  EditPositivityAnchorsPage({
    super.key,
    this.anchor,
  });

  @override
  State<EditPositivityAnchorsPage> createState() =>
      _EditPositivityAnchorsPageState();
}

class _EditPositivityAnchorsPageState extends State<EditPositivityAnchorsPage> {
  TextEditingController _anchorTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _anchorTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnchorBloc(anchor: widget.anchor),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
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
                      const Text('Positivity anchors', style: AppStyles.displaySmall,)
                    ],
                  ),
                  const SizedBox(height: 32,),
                  Image.asset(Assets.images.anchor.path),
                  const SizedBox(height: 32,),
                  const Text('Positivity anchor', style: AppStyles.labelMedium,),
                  const SizedBox(height: 8,),
                  BlocSelector<AnchorBloc, AnchorState, String>(
                    selector: (state) => state.name,
                    builder: (context, name) {
                      if (name.isNotEmpty) {
                        _anchorTextEditingController = TextEditingController(text: name);
                        context.read<AnchorBloc>().updateName(name);
                      }
                      return Container(
                    width: (MediaQuery.of(context).size.width - 32) / 2,
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
                      controller: _anchorTextEditingController,
                      style: AppStyles.bodyMedium,
                      onChanged: (String value) {
                        context.read<AnchorBloc>().updateName(value);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          hintText: 'A friend group brunch',
                          hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.gray)
                      ),
                    ),
                  );
                  },
                ),
                  const SizedBox(height: 32,),
                  BlocBuilder<AnchorBloc, AnchorState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Opacity(
                          opacity: state.name.isNotEmpty
                              ? 1 : 0.65,
                          child: CupertinoButton(
                              color: AppColors.primary,
                              disabledColor: AppColors.primary,
                              borderRadius: BorderRadius.circular(64),
                              onPressed: state.name.isNotEmpty
                                  ?
                                  () {
                                if (state.id != null) {
                                  context.read<MoodsBloc>().updateAnchor(state.id!, state);
                                } else {
                                  context.read<MoodsBloc>().addAnchor(state);
                                }
                                Navigator.of(context).pop();
                              } : null,
                              child: Text('Save anchor', style: AppStyles.bodyMedium.copyWith(color: AppColors.white),)),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
