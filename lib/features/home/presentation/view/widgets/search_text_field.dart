import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/styled_snackbar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/styled_circular_progress_indicator.dart';
import '../../controller/location/location_cubit.dart';
import '../../controller/weather/weather_cubit.dart';
import 'stylish_text_field.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
  });

  @override
  SearchTextFieldState createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  bool _isTapped = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();
    return Row(
      children: [
        Expanded(
          child: StylishTextField(
            controller: _controller,
            isTapped: _isTapped,
            onTap: () {
              _handleTap();
              if (_controller.text.isNotEmpty) {
                cubit.getWeather(_controller.text);
                cubit.setPosition = _controller.text;
              }
              _controller.clear();
            },
            onSubmitted: (value) {
              if (_controller.text.isNotEmpty) {
                cubit.getWeather(_controller.text);
                cubit.setPosition = _controller.text;

                _controller.clear();
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state is LocationFailed) {
              showStyledSnackBar(context, state.message);
            }
            if (state is LocationSuccess) {
              cubit.getWeather(
                  '${state.position.latitude},${state.position.longitude}');
              cubit.setPosition =
                  '${state.position.latitude},${state.position.longitude}';
              _controller.clear();
            }
          },
          builder: (context, state) {
            if (state is LocationLoading) {
              return const StyledLoading();
            }
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.location_on_rounded,
                  color: AppColors.secondaryColor,
                ),
                onPressed: () async {
                  await context.read<LocationCubit>().fetchCurrentLocation();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
