import 'package:college/admin/admingenerate.dart';
import 'package:college/admin/adminpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(Report());
}

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      title: 'Report Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReportPage(), // Set the home screen to your ReportPage
    );
  }
}

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final List<String> _departments = [
    'Sales',
    'IT',
    'HR',
    'Finance',
    'Operations'
  ];
  final List<String> _statuses = ['Open', 'Closed', 'Pending', 'Resolved'];

  String? _selectedDepartment;
  String? _selectedStatus;
  DateTime? _fromDate;
  DateTime? _toDate;

  // Method to pick the "From" date
  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021), // From 2021
      lastDate: DateTime.now(), // Till today
    );
    if (picked != null && picked != _fromDate) {
      if (picked.isAfter(DateTime.now())) {
        // Show error if the selected date is after today
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The selected date cannot be after today.'),
          ),
        );
      } else {
        setState(() {
          _fromDate = picked;
        });
      }
    }
  }

  // Method to pick the "To" date
  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021), // From 2021
      lastDate: DateTime.now(), // Till today
    );
    if (picked != null && picked != _toDate) {
      if (picked.isAfter(DateTime.now())) {
        // Show error if the selected date is after today
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The selected date cannot be after today.'),
          ),
        );
      } else if (_fromDate != null && picked.isBefore(_fromDate!)) {
        // Show error if "To" date is before the "From" date
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The "To" date cannot be before the "From" date.'),
          ),
        );
      } else {
        setState(() {
          _toDate = picked;
        });
      }
    }
  }

  void _generateReport() {
    // Logic to generate report based on selected filters
    if (_selectedDepartment != null &&
        _selectedStatus != null &&
        _fromDate != null &&
        _toDate != null) {
      // Implement the report generation logic here
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Report Generated'),
            content: Text(
                'Report generated for ${_selectedDepartment!} department, Status: ${_selectedStatus!}, from ${DateFormat('yyyy-MM-dd').format(_fromDate!)} to ${DateFormat('yyyy-MM-dd').format(_toDate!)}.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Show error if any field is missing
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
          Text('Please fill all the fields before generating the report.'),
        ),
      );
    }
  }

  void _cancel() {
    // Logic to reset or cancel the selections
    setState(() {
      _selectedDepartment = null;
      _selectedStatus = null;
      _fromDate = null;
      _toDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Report'),
        leading: IconButton(
          // Back arrow as the leading icon
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Adminpage()));// Navigate back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown for Department
            Text('Department', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select Department'),
              value: _selectedDepartment,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDepartment = newValue;
                });
              },
              items: _departments.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Dropdown for Status
            Text('Status', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select Status'),
              value: _selectedStatus,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStatus = newValue;
                });
              },
              items: _statuses.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Date Picker for "From" date
            Text('From', style: TextStyle(fontSize: 16)),
            GestureDetector(
              onTap: () => _selectFromDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  _fromDate == null
                      ? 'Select From Date'
                      : DateFormat('yyyy-MM-dd').format(_fromDate!),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Date Picker for "To" date
            Text('To', style: TextStyle(fontSize: 16)),
            GestureDetector(
              onTap: () => _selectToDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  _toDate == null
                      ? 'Select To Date'
                      : DateFormat('yyyy-MM-dd').format(_toDate!),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 40),

            // Buttons for Generate and Cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Admingenerate()));
                  },
                  child: Text('Generate'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: _cancel,
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    textStyle: TextStyle(fontSize: 16),
                    backgroundColor: Colors.red, // Cancel button color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}