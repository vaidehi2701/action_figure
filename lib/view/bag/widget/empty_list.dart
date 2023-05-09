
import 'package:action_figure/animation/fadeanimation.dart';
import 'package:action_figure/theme/app_theme.dart';
import 'package:flutter/material.dart';


class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FadeAnimation(
              delay: 0.5,
              child:
                  Text("No Item added!", style: AppThemes.bagEmptyListTitle),
            ),
            FadeAnimation(
              delay: 0.5,
              child: Text(
                "Once you have added, come back:)",
                style: AppThemes.bagEmptyListSubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
