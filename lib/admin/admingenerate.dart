import 'package:college/admin/report.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Admingenerate());
}

class Admingenerate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProblemTablePage(), // Start with the Problem Table Page
    );
  }
}

class ProblemTablePage extends StatelessWidget {
  // Sample data for the table
  final List<Map<String, dynamic>> _problems = [
    {
      'sl': 1,
      'problem': 'Issue with login - user cannot access account',
      'status': 'Resolved',
      'raisedIn': '2024-10-01',
      'solvedIn': '2024-10-02',
      'closedIn': '2024-10-03',
    },
    {
      'sl': 2,
      'problem': 'Page not loading due to server issues',
      'status': 'Open',
      'raisedIn': '2024-10-05',
      'solvedIn': '',
      'closedIn': '',
    },
    {
      'sl': 3,
      'problem': 'UI bug in dashboard affecting user experience',
      'status': 'Pending',
      'raisedIn': '2024-10-10',
      'solvedIn': '',
      'closedIn': '',
    },
    {
      'sl': 4,
      'problem': 'Database connection error during peak hours',
      'status': 'Resolved',
      'raisedIn': '2024-10-15',
      'solvedIn': '2024-10-16',
      'closedIn': '2024-10-17',
    },
    {
      'sl': 5,
      'problem': 'Email notifications not working for users',
      'status': 'Closed',
      'raisedIn': '2024-10-20',
      'solvedIn': '2024-10-21',
      'closedIn': '2024-10-22',
    },
  ];

  @override
  Widget build(BuildContext context) {
    ScrollController verticalController = ScrollController();
    ScrollController horizontalController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Problem Tracker'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Report()));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Scrollbar(
                thumbVisibility: true, // Ensure vertical scrollbar is visible
                controller: verticalController,
                child: SingleChildScrollView(
                  controller: verticalController,
                  scrollDirection: Axis.vertical,
                  child: Scrollbar(
                    thumbVisibility: true, // Ensure horizontal scrollbar is visible
                    controller: horizontalController,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: horizontalController,
                      child: Container(
                        color: Colors.grey[100],
                        child: DataTable(
                          columnSpacing: 8.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          headingRowColor: MaterialStateProperty.all(Colors.grey[800]),
                          dataRowColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.grey[200];
                            }
                            return Colors.grey[300];
                          }),
                          columns: [
                            DataColumn(
                              label: Container(
                                width: 50,
                                child: Text(
                                  'Sl.no',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 200,
                                child: Text(
                                  'Problem',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 80,
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 80,
                                child: Text(
                                  'Raised In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 80,
                                child: Text(
                                  'Solved In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 80,
                                child: Text(
                                  'Closed In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          rows: _problems.map((problem) {
                            int index = _problems.indexOf(problem);
                            Color rowColor = (index % 2 == 0) ? Colors.grey[300] ?? Colors.grey : Colors.grey[200] ?? Colors.grey;
                            return DataRow(
                              color: MaterialStateProperty.all(rowColor),
                              cells: [
                                DataCell(Text(problem['sl'].toString())),
                                DataCell(
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 200),
                                    child: Text(
                                      problem['problem'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                DataCell(Text(problem['status'])),
                                DataCell(Text(problem['raisedIn'])),
                                DataCell(Text(problem['solvedIn'])),
                                DataCell(Text(problem['closedIn'])),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
