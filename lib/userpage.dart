import 'package:flutter/material.dart';

class Userpage extends StatefulWidget {
  const Userpage({Key? key}) : super(key: key); // Correct class name here

  @override
  State<Userpage> createState() => _UserpageState(); // Correct State class name
}

class _UserpageState extends State<Userpage> { // Correct State class name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Problem and Status',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DataTable(
              columns: const [
                DataColumn(label: Text('Problem')),
                DataColumn(label: Text('Status')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Problem 1')),
                  DataCell(Text('Pending')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Problem 2')),
                  DataCell(Text('In Progress')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Problem 3')),
                  DataCell(Text('Completed')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
