import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../services/upload_service.dart';
import '../widgets/upload_progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final UploadService uploadService =
      UploadService();

  final TextEditingController projectController =
      TextEditingController(text: "err");

  String folderPath = "";

  int current = 0;
  int total = 0;

  bool uploading = false;

  Future<void> selectFolder() async {

    final path =
        await FilePicker.platform
            .getDirectoryPath();

    if (path == null) return;

    setState(() {
      folderPath = path;
    });
  }

  Future<void> upload() async {

    if (folderPath.isEmpty) return;

    setState(() {
      uploading = true;
    });

    await uploadService.uploadFolder(
      Directory(folderPath),
      projectController.text,
    );

    setState(() {
      uploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Site Diary Uploader",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: projectController,
              decoration: const InputDecoration(
                labelText: "Project",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: selectFolder,
              child: const Text(
                "Select Folder",
              ),
            ),

            const SizedBox(height: 10),

            Text(
              folderPath.isEmpty
                  ? "Folder not selected"
                  : folderPath,
            ),

            const SizedBox(height: 20),

            UploadProgress(
              current: current,
              total: total,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed:
                  uploading ? null : upload,
              child: Text(
                uploading
                    ? "Uploading..."
                    : "Upload",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
