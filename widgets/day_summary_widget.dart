import 'package:flutter/material.dart';

class DaySummaryWidget
    extends StatelessWidget {

  final String day;
  final int count;

  const DaySummaryWidget({
    super.key,
    required this.day,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        title: Text(day),
        trailing: Text(
          "$count photos",
        ),
      ),
    );
  }
}
