import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      separatorBuilder: (context, index) => const SizedBox(height: 20.0),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: const Color(0xFFE0E0E0),
          highlightColor: const Color(0xFFF5F5F5),
          child: Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16.0),
              Container(
                width: 160.0,
                height: 16.0,
                color: Colors.white,
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
