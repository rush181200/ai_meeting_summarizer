import 'package:flutter/material.dart';
import '../models/meeting_item.dart';
import '../services/meeting_db_service.dart';
import 'components/meeting_card.dart';
import 'components/upload_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MeetingItem> meetingList = [];

  @override
  void initState() {
    super.initState();
    loadMeetings();
  }

  Future<void> loadMeetings() async {
    final data = await MeetingDbService.getAllMeetings();
    setState(() {
      meetingList = data;
    });
  }

  void _openUploadModal() async {
    final shouldRefresh = await showModalBottomSheet<bool>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const UploadModal(),
    );

    if (shouldRefresh == true) {
      await loadMeetings(); // refresh after upload
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AI Meeting Summarizer",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: meetingList.isEmpty
          ? const Center(child: Text("No meetings uploaded yet."))
          : ListView.builder(
        itemCount: meetingList.length,
        itemBuilder: (context, index) {
          final item = meetingList[index];
          return MeetingCard(item: item);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openUploadModal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
