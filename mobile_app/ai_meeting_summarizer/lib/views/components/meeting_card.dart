import 'package:flutter/material.dart';
import '../../models/meeting_item.dart';

class MeetingCard extends StatelessWidget {
  final MeetingItem item;
  const MeetingCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.filePath, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Status: ${item.transcript}"),
            const SizedBox(height: 8),
            if (item.summary != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Summary:", style: TextStyle(fontWeight: FontWeight.w600)),
                  Text(item.summary!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
