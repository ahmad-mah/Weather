import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_colors.dart';

class StyledLoading extends StatelessWidget {
  const StyledLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        size: 30,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven
                  ? AppColors.secondaryColor
                  : AppColors.lightWhiteColor,
            ),
          );
        },
      ),
    );
  }
}
