import 'dart:io';

import 'package:flutter/material.dart';

import '../services/upload_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final uploadService = UploadService();

  final TextEditingController projectController =
      TextEditingController(text: "err");

  String selectedFolder = "";
  bool uploading = false;

  Future<void> selectFolder() async {
    // временно

    setState(() {
      selectedFolder =
          r"D:\Photos\ERR";
    });
  }

  Future<void> upload() async {
    if (selectedFolder.isEmpty) {
      return;
    }

    setState(() {
      uploading = true;
    });

    try {
      await uploadService.uploadFolder(
        Directory(selectedFolder),
        projectController.text,
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    setState(() {
      uploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Site Diary Uploader"),
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
              selectedFolder.isEmpty
                  ? "Folder not selected"
                  : selectedFolder,
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
