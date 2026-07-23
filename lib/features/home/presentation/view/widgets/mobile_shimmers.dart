import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/app_colors.dart';

class SearchBarShimmer extends StatelessWidget {
  const SearchBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withAlpha((0.4 * 255).toInt()),
      highlightColor: Colors.white.withAlpha((0.7 * 255).toInt()),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

class MobileMainWeatherShimmer extends StatelessWidget {
  const MobileMainWeatherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withAlpha((0.4 * 255).toInt()),
      highlightColor: Colors.white.withAlpha((0.7 * 255).toInt()),
      child: Column(
        spacing: 20,
        children: [
          const SizedBox(height: 5),

          // City name
          Container(
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          // Date
          Container(
            width: 150,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          const SizedBox(height: 10),

          // Weather icon
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),

          // Temperature
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          // Weather description
          Container(
            width: 100,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 0),
        ],
      ),
    );
  }
}

class MobileDetailsCardShimmer extends StatelessWidget {
  const MobileDetailsCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        3,
        (index) => Container(
          width: 70,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class MobileHourlyForecastShimmer extends StatelessWidget {
  const MobileHourlyForecastShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            width: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 20,
                  width: 60,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} // Full implementation of the weather screen with data and loading state
