import 'package:college/admin/adminpage.dart';
import 'package:college/incharge/incharge.dart';
import 'package:college/incharge/inchargerise.dart';
import 'package:college/incharge/inchrgechat.dart';
import 'package:college/main.dart';
import 'package:flutter/material.dart';

class Ticketpage extends StatefulWidget {
  const Ticketpage({Key? key}) : super(key: key);

  @override
  State<Ticketpage> createState() => _TicketpageState();
}

class _TicketpageState extends State<Ticketpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Ticket'),
        leading: IconButton(
          // Back arrow as the leading icon
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Adminpage()));// Navigate back to the previous page
          },
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
                          Navigator.pushReplacement(
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
                          Navigator.pushReplacement(
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
