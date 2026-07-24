import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/theme_extensions.dart';
import '../../controller/weather/weather_cubit.dart';
import 'location_button.dart';

class SearchTextField extends HookWidget {
  const SearchTextField({super.key});

  void _search(BuildContext context, String position) {
    context.read<WeatherCubit>().searchWeather(position);
    context.read<WeatherCubit>().setPosition = position;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final controller = useTextEditingController();

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Search for a city',
              suffixIcon: InkWell(
                onTap: () {
                  final text = controller.text.trim();
                  if (text.isEmpty) return;
                  _search(context, text);
                  controller.clear();
                },
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.secondaryContainer,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(Icons.search, color: colors.onSecondaryContainer),
                ),
              ),
            ),
            onSubmitted: (value) {
              final text = controller.text.trim();
              if (text.isEmpty) return;
              _search(context, text);
              controller.clear();
            },
          ),
        ),
        SizedBox(width: 8.w),
        const LocationButton(),
      ],
    );
  }
}
