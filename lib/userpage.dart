import 'package:college/chatapp.dart';
import 'package:college/risepage.dart';
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
        title: const Text('User Dashboard'),
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
                _buildUrlLink(context, 'Change Password', '/changepassword'),
                _buildUrlLink(context, 'Logout', '/logout'),
              ],
            ),

            const SizedBox(height: 20), // Spacing

            // Expanded widget for the DataTable
            Expanded(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Container(
                      width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
                      child: Text(
                        'Problem',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ), // Title font size
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ), // Title font size
                    ),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(
                      'No Light',
                      style: const TextStyle(fontSize: 18), // Content font size
                    )),
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          // Navigate to the chat page when clicked
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>ChatApp()));
                        },
                        child: Text(
                          'Raised',
                          style: const TextStyle(
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
             // Underline to make it look like a link
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
        Navigator.push(context, MaterialPageRoute(builder:(context)=>Risepage()));
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
