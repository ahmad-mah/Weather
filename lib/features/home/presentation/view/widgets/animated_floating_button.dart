import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/styled_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../controller/weather/prediction_cubit.dart';
import '../../controller/weather/weather_cubit.dart';

class AnimatedFloatingButton extends StatefulWidget {
  const AnimatedFloatingButton({super.key});

  @override
  AnimatedFloatingButtonState createState() => AnimatedFloatingButtonState();
}

class AnimatedFloatingButtonState extends State<AnimatedFloatingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: BlocConsumer<PredictionCubit, PredictionState>(
        listener: (context, state) {
          if (state is PredictionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.secondaryColor,
              ),
            );
          } else if (state is PredictionSuccess) {
            styledDialog(context, state.prediction);
          }
        },
        builder: (context, state) {
          if (state is PredictionLoading) {
            return FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.secondaryColor,
              elevation: 10,
              child: const CircularProgressIndicator(
                strokeWidth: 5,
                color: Colors.white,
              ),
            );
          }

          return FloatingActionButton(
            onPressed: () {
              context.read<PredictionCubit>().getPrediction(
                    context.read<WeatherCubit>().getPosition,
                  );
            },
            backgroundColor: AppColors.secondaryColor,
            elevation: 10,
            child: const Icon(
              Icons.wb_sunny,
              size: 30,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
