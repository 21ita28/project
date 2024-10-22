import 'package:college/admin/adminpage.dart';
import 'package:flutter/material.dart';

class UpdateInchargeApp extends StatelessWidget {
  const UpdateInchargeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Update Incharge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UpdateInchargePage(),
    );
  }
}

class UpdateInchargePage extends StatefulWidget {
  const UpdateInchargePage({Key? key}) : super(key: key);

  @override
  _UpdateInchargePageState createState() => _UpdateInchargePageState();
}

class _UpdateInchargePageState extends State<UpdateInchargePage> {
  List<String> departments = ['CSE', 'ECE', 'Mechanical', 'Civil'];
  List<String> incharges = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Lee'
  ];

  String? selectedDepartment;
  String? selectedIncharge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Incharge'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Adminpage())); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Department:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedDepartment,
              hint: const Text('Choose Department'),
              isExpanded: true,
              items: departments.map((String department) {
                return DropdownMenuItem<String>(
                  value: department,
                  child: Text(department),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDepartment = newValue;
                });
              },
            ),
            const SizedBox(height: 20), // Spacing
            const Text(
              'Select Incharge:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedIncharge,
              hint: const Text('Choose Incharge'),
              isExpanded: true,
              items: incharges.map((String incharge) {
                return DropdownMenuItem<String>(
                  value: incharge,
                  child: Text(incharge),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedIncharge = newValue;
                });
              },
            ),
            const SizedBox(height: 20), // Spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Adminpage()));
                    if (selectedDepartment != null &&
                        selectedIncharge != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Updated Incharge for $selectedDepartment to $selectedIncharge!'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please select both department and incharge.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Update'),
                ),
                const SizedBox(width: 10), // Spacing
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedDepartment = null; // Clear department selection
                      selectedIncharge = null; // Clear incharge selection
                    });
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
