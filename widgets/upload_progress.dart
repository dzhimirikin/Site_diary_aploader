import 'package:flutter/material.dart';

class UploadProgress extends StatelessWidget {

  final int current;
  final int total;

  const UploadProgress({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    final progress =
        total == 0
            ? 0.0
            : current / total;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [

        LinearProgressIndicator(
          value: progress,
        ),

        const SizedBox(height: 8),

        Text(
          "$current / $total files",
        ),
      ],
    );
  }
}
