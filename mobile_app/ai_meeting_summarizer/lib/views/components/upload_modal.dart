import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../models/meeting_item.dart';
import '../../services/meeting_db_service.dart';

class UploadModal extends StatelessWidget {
  const UploadModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Upload Audio", style: TextStyle(fontSize: 18)), //or Record
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.upload_file),
            label: const Text("Upload File"),
            onPressed: () async {
              try {
                // 1. Pick file
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['mp3', 'wav', 'm4a'], // adjust as needed
                );

                if (result == null || result.files.single.path == null) {
                  print("❌ No file selected");
                  return;
                }

                final file = File(result.files.single.path!);
                final fileName = file.path.split('/').last;
                print("Sending Files");
                // 2. Upload using DIO
                final dio = Dio();
                final formData = FormData.fromMap({
                  "file": await MultipartFile.fromFile(file.path, filename: fileName),
                });

                final response = await dio.post(
                  "http://localhost:8080/api/summarize/upload", // ⬅️ replace with IP if testing on real device
                  data: formData,
                  options: Options(
                    headers: {
                      "Content-Type": "multipart/form-data",
                    },
                  ),
                );

                print("✅ Response: ${response.data}");

                final summary = response.data['summary'];
                final transcript = response.data['transcript'];
                final filePath = file.path; // or store just file name if needed

                final item = MeetingItem(
                  filePath: filePath,
                  transcript: transcript,
                  summary: summary,
                );

                await MeetingDbService.insertMeeting(item);


                // 3. Close modal
                Navigator.pop(context);

                // 4. Handle success (e.g., add to local DB, show snackbar, etc.)

              } catch (e) {
                print("❌ Upload failed: $e");
              }
            },
          ),
          const SizedBox(height: 10),
          // ElevatedButton.icon(
          //   icon: const Icon(Icons.mic),
          //   label: const Text("Record Audio"),
          //   onPressed: () {
          //     // Call record function
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
