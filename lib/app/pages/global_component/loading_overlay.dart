import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
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

