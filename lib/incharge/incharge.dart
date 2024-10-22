import 'package:college/incharge/inchargerise.dart';
import 'package:college/incharge/inchrgechat.dart';
import 'package:college/main.dart';
import 'package:flutter/material.dart';

class Incharge extends StatefulWidget {
  const Incharge({Key? key}) : super(key: key);

  @override
  State<Incharge> createState() => _InchargeState();
}

class _InchargeState extends State<Incharge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incharge Dashboard'),
        // Add the plus button to the AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to another page when the plus button is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inchrgechat()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 50),
            ListTile(
              leading: Icon(Icons.task_alt),
              title: Text('To Solve'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number),
              title: Text('My Ticket'),
              onTap: () {
                Navigator.pushNamed(context, '/changepassword');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CollegeLoginApp()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded widget for the DataTable
            Expanded(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
                      child: const Text(
                        'Problem',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ), // Title font size
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ), // Title font size
                    ),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text(
                      'No Light',
                      style: TextStyle(fontSize: 18), // Content font size
                    )),
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          // Pass 'No Light' as the issue title
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inchargerise(issueTitle: 'No Light'),
                            ),
                          );
                        },
                        child: const Text(
                          'Raised',
                          style: TextStyle(
                            color: Colors.blue, // Mimic URL style
                            fontSize: 18, // Content font size
                          ),
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text(
                      'No Fan',
                      style: TextStyle(fontSize: 18), // Content font size
                    )),
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          // Pass 'No Fan' as the issue title
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inchargerise(issueTitle: 'No Fan'),
                            ),
                          );
                        },
                        child: const Text(
                          'Raised',
                          style: TextStyle(
                            color: Colors.blue, // Mimic URL style
                            fontSize: 18, // Content font size
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
