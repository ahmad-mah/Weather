import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/helpers/styled_snackbar.dart';
import '../controller/weather/weather_cubit.dart';
import '../controller/weather/weather_effect.dart';

void useWeatherEffects(BuildContext context) {
  useEffect(() {
    final sub = context.read<WeatherCubit>().effects.listen((effect) {
      if (!context.mounted) return;
      switch (effect) {
        case ShowOfflineSnackbar():
          showStyledSnackBar(context, 'No internet connection');
        case ShowFailureSnackbar(message: final msg):
          showStyledSnackBar(context, msg);
      }
    });
    return sub.cancel;
  }, []);
}
