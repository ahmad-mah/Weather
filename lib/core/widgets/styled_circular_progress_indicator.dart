import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../extensions/theme_extensions.dart';

class StyledLoading extends StatelessWidget {
  const StyledLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        size: 30,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven
                  ? context.colors.secondary
                  : context.colors.onPrimary,
            ),
          );
        },
      ),
    );
  }
}
