import 'package:college/admin/adminchat.dart';
import 'package:college/admin/adminpage.dart';
import 'package:college/admin/adminrise.dart';
import 'package:college/admin/departmentlistapp.dart';
import 'package:college/admin/updateinchargeapp.dart';
import 'package:college/main.dart';
import 'package:flutter/material.dart';
//
// void main() => runApp(Adminpage());
//
// class Adminpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Admin Dashboard',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AdminHomePage(),
//     );
//   }
// }
//
// class AdminHomePage extends StatefulWidget {
//   @override
//   _AdminHomePageState createState() => _AdminHomePageState();
// }
//
// class _AdminHomePageState extends State<AdminHomePage> {
//   List<String> importantTickets = []; // Track important tickets
//
//   void markAsImportant(String ticketTitle) {
//     setState(() {
//       importantTickets.add(ticketTitle);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Dashboard'),
//         // Add the plus button to the AppBar
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               // Navigate to another page when the plus button is clicked
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Adminrise()),
//               );
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             SizedBox(height: 50), // Header space before menu items
//             ListTile(
//               leading: Icon(Icons.task),
//               title: Text('To Solve'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SolvePage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.report),
//               title: Text('Report'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ReportPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.lock),
//               title: Text('Update Password'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => UpdatePasswordPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.confirmation_number),
//               title: Text('My Ticket'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => TicketPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.supervised_user_circle),
//               title: Text('Update Incharge'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => UpdateInchargeApp()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.departure_board),
//               title: Text('Enable Department'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => DepartmentListApp()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CollegeLoginApp()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Expanded widget for the DataTable
//             Expanded(
//               child: DataTable(
//                 columns: [
//                   DataColumn(
//                     label: SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
//                       child: const Text(
//                         'Problem',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ), // Title font size
//                       ),
//                     ),
//                   ),
//                   const DataColumn(
//                     label: Text(
//                       'Status',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ), // Title font size
//                     ),
//                   ),
//                 ],
//                 rows: [
//                   DataRow(cells: [
//                     const DataCell(Text(
//                       'No Light',
//                       style: TextStyle(fontSize: 18), // Content font size
//                     )),
//                     DataCell(
//                       GestureDetector(
//                         onTap: () {
//                           // Pass 'No Light' as the issue title
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Adminchat(issueTitle: 'No Light'),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Raised',
//                           style: TextStyle(
//                             color: Colors.blue, // Mimic URL style
//                             fontSize: 18, // Content font size
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text(
//                       'No Fan',
//                       style: TextStyle(fontSize: 18), // Content font size
//                     )),
//                     DataCell(
//                       GestureDetector(
//                         onTap: () {
//                           // Pass 'No Fan' as the issue title
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Adminchat(issueTitle: 'No Fan'),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Raised',
//                           style: TextStyle(
//                             color: Colors.blue, // Mimic URL style
//                             fontSize: 18, // Content font size
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   DataRow _buildDataRow(String problem, String status) {
//     bool isImportant = importantTickets.contains(problem);
//
//     return DataRow(cells: [
//       DataCell(
//         Row(
//           children: [
//             Text(
//               problem,
//               style: TextStyle(fontSize: 18),
//             ),
//             if (isImportant) ...[
//               SizedBox(width: 8),
//               Icon(Icons.star, color: Colors.yellow),
//             ],
//           ],
//         ),
//       ),
//       DataCell(
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Adminchat(
//                   issueTitle: problem,
//                   onMarkAsImportant: markAsImportant,
//                 ),
//               ),
//             );
//           },
//           child: const Text(
//             'status',
//             style: TextStyle(
//               color: Colors.blue,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//     ]);
//   }
// }
//
//
// // Example of Change Password Page
// class UpdatePasswordPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Password'),
//       ),
//       body: Center(
//         child: Text('Update Password Page'),
//       ),
//     );
//   }
// }
//
// // Example of other pages that were mentioned
// class SolvePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('To Solve'),
//       ),
//       body: Center(
//         child: Text('Solve Page'),
//       ),
//     );
//   }
// }
//
// class ReportPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Report'),
//       ),
//       body: Center(
//         child: Text('Report Page'),
//       ),
//     );
//   }
// }
//
// class TicketPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Ticket'),
//       ),
//       body: Center(
//         child: Text('My Ticket Page'),
//       ),
//     );
//   }
// }
//
//
//
//
//
import 'package:college/admin/adminchat.dart';
import 'package:college/admin/adminrise.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Adminpage(),
  ));
}

class Adminpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdminHomePage();
  }
}

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<String> importantTickets = []; // Track important tickets

  void markAsImportant(String ticketTitle) {
    setState(() {
      importantTickets.add(ticketTitle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Adminrise()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 50),
            ListTile(
              leading: Icon(Icons.task),
              title: Text('To Solve'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SolvePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Report'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Update Password'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdatePasswordPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number),
              title: Text('My Ticket'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Update Incharge'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateInchargeApp()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.departure_board),
              title: Text('Enable Department'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepartmentListApp()),
                );
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
            Expanded(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Text(
                        'Problem',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text(
                      'No Light',
                      style: TextStyle(fontSize: 18),
                    )),
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Adminchat(
                                issueTitle: 'No Light',
                                 // Pass the function here
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Raised',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text(
                      'No Fan',
                      style: TextStyle(fontSize: 18),
                    )),
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Adminchat(
                                issueTitle: 'No Fan',

                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Raised',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
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

// Example of Change Password Page
class UpdatePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Password'),
      ),
      body: Center(
        child: Text('Update Password Page'),
      ),
    );
  }
}

// Example of other pages that were mentioned
class SolvePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Solve'),
      ),
      body: Center(
        child: Text('Solve Page'),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Center(
        child: Text('Report Page'),
      ),
    );
  }
}

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Ticket'),
      ),
      body: Center(
        child: Text('My Ticket Page'),
      ),
    );
  }
}

