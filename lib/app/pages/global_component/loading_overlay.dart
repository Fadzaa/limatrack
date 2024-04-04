import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return Stack(
        children: [
          child,
          Container(
            color: Colors.black.withOpacity(0.1),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      );
    }
      else {
        return child;
    }
    }
  }


class ShimmerOverlay extends StatelessWidget {
  const ShimmerOverlay({
    super.key,
    required this.isLoading,
    required this.child
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return Shimmer.fromColors(
          child: child,
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!
      );
    }
    else {
      return child;
    }
  }
}

