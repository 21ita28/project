import 'package:college/main.dart';
import 'package:college/superadmin.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Createuser extends StatefulWidget {
  const Createuser({Key? key}) : super(key: key);

  @override
  State<Createuser> createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {
  final TextEditingController _fileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _selectedFilePath;  // To store the selected CSV file path

  // Function to pick a CSV file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],  // Restrict to CSV files only
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFilePath = result.files.first.path;
        _fileController.text = _selectedFilePath!.split('/').last;  // Display file name in the text field
      });
    } else {
      // User canceled the picker
      setState(() {
        _selectedFilePath = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the previous page
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SuperAdmin()));
          },
        ),
        title: const Text("Create User"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Choose the CSV file",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _fileController,
                readOnly: true,  // Prevent manual input, allow file selection only
                decoration: InputDecoration(
                  labelText: 'Selected file',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: _pickFile,  // Open file picker on click
                  ),
                ),
                validator: (value) {
                  if (_selectedFilePath == null || value!.isEmpty) {
                    return 'Please choose a valid CSV file';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Proceed with user creation using the selected CSV file

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('The User has been Created'),
                        ),
                      );

                      // Navigate back to SuperAdmin page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SuperAdmin()),
                      );
                    }
                  },
                  child: const Text("Create"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}