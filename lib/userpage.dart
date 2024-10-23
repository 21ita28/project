import 'package:college/changepasswordapp.dart';
import 'package:college/chatapp.dart';
import 'package:college/main.dart';
import 'package:college/risepage.dart';
import 'package:college/userchangepassword.dart';
import 'package:flutter/material.dart';

class Userpage extends StatefulWidget {
  const Userpage({Key? key}) : super(key: key);

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome User!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for Home, Change Password, and Logout links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildUrlLink(context, 'Home', '/home'),

                GestureDetector(

                  onTap: () {
                    // Navigate to the chat page when clicked
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Userchangepassword(),
                      ),
                    );
                  },
                  child: const Text(
                    'Change Password',
                    style: TextStyle(
                      color: Colors.blue, // Blue color to mimic a URL link
                      fontSize: 18,
                    ),
                  ),
                ),
                GestureDetector(

                  onTap: () {
                    // Navigate to the chat page when clicked
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeLoginApp(),
                      ),
                    );
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.blue, // Blue color to mimic a URL link
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20), // Spacing

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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(issueTitle: 'No Light'),
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(issueTitle: 'No Fan'),
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

            // Plus button below the DataTable
            Align(
              alignment: Alignment.centerRight, // Align to the right
              child: _buildAddButton(context), // Plus button below the table
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create clickable text (styled like a URL link)
  Widget _buildUrlLink(BuildContext context, String title, String route) {
    return GestureDetector(
      onTap: () {
        // Navigate to the route or handle actions based on the clicked link
        Navigator.pushNamed(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.blue, // Blue color to mimic a URL link
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  // Method to build the add button
  Widget _buildAddButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to another page when clicked
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Risepage()));
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10), // Adjust padding for size
        backgroundColor: Colors.blue, // Button color
      ),
      child: const Icon(Icons.add, size: 24, color: Colors.white), // Plus icon
    );
  }
}
