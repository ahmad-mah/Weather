import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DesktopForecastShimmer extends StatelessWidget {
  const DesktopForecastShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blue[400]!,
      highlightColor: Colors.blue[200]!,
      child: Column(
        mainAxisSize: MainAxisSize.max, // This will shrink-wrap the column
        children: [
          for (int i = 0; i < 7; i++) ...[
            if (i > 0)
              const Divider(
                color: Colors.white24,
                height: 1,
                thickness: 1,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  // Day placeholder
                  Container(
                    width: 40,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Weather icon placeholder
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),

                  // Weather description placeholder
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // Temperature placeholder
                  Container(
                    width: 70,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
