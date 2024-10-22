import 'package:college/admin/adminpage.dart';
import 'package:college/incharge/incharge.dart';
import 'package:college/userpage.dart';
import 'package:flutter/material.dart';




class Adminrise extends StatefulWidget{
  const Adminrise({Key?key}): super(key:key);
  @override
  State<Adminrise> createState() =>_AdminriseState();
}

class _AdminriseState extends State<Adminrise>{
  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedDepartment;

  void _raiseIssue() {
    // Logic to raise the issue can be added here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Issue Raised!')),
    );
  }

  // Updated return type to String?
  String? _validateProblem(String value) {
    return (value.split(' ').length > 20)
        ? 'Problem must not exceed 20 words.'
        : null; // Return null if valid
  }

  // Updated return type to String?
  String? _validateDescription(String value) {
    return (value.split(' ').length > 100)
        ? 'Description must not exceed 100 words.'
        : null; // Return null if valid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Raise an Issue',
            style: TextStyle(fontWeight: FontWeight.bold), // Bold text
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Problem (Max 20 words):',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _problemController,
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorText: _validateProblem(_problemController.text),
              ),
              onChanged: (value) {
                setState(() {}); // Update the UI to validate in real-time
              },
            ),
            SizedBox(height: 20),
            Text(
              'Description (Max 100 words):',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorText: _validateDescription(_descriptionController.text),
              ),
              onChanged: (value) {
                setState(() {}); // Update the UI to validate in real-time
              },
            ),
            SizedBox(height: 20),
            Text(
              'Select Department:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: _selectedDepartment,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDepartment = newValue;
                });
              },
              items: <String>[]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select a department'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Adminpage()));
                    if (_validateProblem(_problemController.text) == null &&
                        _validateDescription(_descriptionController.text) ==
                            null) {
                      _raiseIssue();
                    }
                  },
                  child: Text('Raise'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Adminpage()));
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}