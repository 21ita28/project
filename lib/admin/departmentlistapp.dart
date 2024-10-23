import 'package:college/admin/adminpage.dart';
import 'package:flutter/material.dart';

class DepartmentListApp extends StatelessWidget {
  const DepartmentListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Department List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DepartmentListPage(),
    );
  }
}

class DepartmentListPage extends StatefulWidget {
  const DepartmentListPage({Key? key}) : super(key: key);

  @override
  _DepartmentListPageState createState() => _DepartmentListPageState();
}

class _DepartmentListPageState extends State<DepartmentListPage> {
  final List<Map<String, dynamic>> departments = [
    {'name': 'HR', 'isEnabled': false},
    {'name': 'Finance', 'isEnabled': false},
    {'name': 'IT', 'isEnabled': false},
    {'name': 'Marketing', 'isEnabled': false},
  ];

  void _toggleDepartment(int index, bool value) {
    if (!value) {
      // If disabling, show confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Disable'),
            content: const Text(
                'If you disable this department, all related processes will be terminated. Do you want to proceed?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog and cancel
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                  setState(() {
                    departments[index]['isEnabled'] = value; // Disable the department
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${departments[index]['name']} department disabled.'),
                      ),
                    );
                  });
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    } else {
      // If enabling, no need for confirmation
      setState(() {
        departments[index]['isEnabled'] = value; // Enable the department
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${departments[index]['name']} department enabled.'),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departments'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Adminpage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: departments.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(departments[index]['name']),
                subtitle: Text(
                  departments[index]['isEnabled'] ? 'Enabled' : 'Disabled',
                  style: TextStyle(
                    color: departments[index]['isEnabled']
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                trailing: Switch(
                  value: departments[index]['isEnabled'],
                  onChanged: (bool value) {
                    _toggleDepartment(index, value); // Call the toggle function
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}