import 'package:college/incharge/incharge.dart';
import 'package:flutter/material.dart';

class Inchargerise extends StatefulWidget {
  final String issueTitle;

  Inchargerise({required this.issueTitle});

  @override
  _InchargeriseState createState() => _InchargeriseState();
}

class _InchargeriseState extends State<Inchargerise> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        // Add user's message
        _messages.add({
          'sender': 'You',
          'content': _messageController.text,
          'timestamp': _getCurrentTime(),
        });

        // Simulate a bot response
        _messages.add({
          'sender': 'Bot',
          'content': _generateBotResponse(_messageController.text),
          'timestamp': _getCurrentTime(),
        });

        _messageController.clear(); // Clear the input field after sending
      });
    }
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hours = now.hour % 12 == 0 ? 12 : now.hour % 12; // 12-hour format
    final minutes = now.minute.toString().padLeft(2, '0'); // Leading zero
    final period = now.hour >= 12 ? 'PM' : 'AM'; // AM/PM
    return '$hours:$minutes $period'; // Return formatted time
  }

  String _generateBotResponse(String userMessage) {
    // Simple bot response logic
    return '"$userMessage"';
  }

  void _handleTicketStatus(String status) {
    // Handle the logic based on the selected status (Completed or Pending)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$status Ticket'),
          content: Text('Are you sure you want to mark this ticket as $status?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Incharge()));
                // Add any additional logic for ticket status update here
              },
              child: Text(status),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.issueTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Incharge()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                bool isSender = message['sender'] == 'You';

                return Align(
                  alignment:
                  isSender ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSender ? Colors.blue[200] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: isSender
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['content']!,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${message['timestamp']}',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
          // Row with Completed and Pending buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _handleTicketStatus('Pending'),
                  child: Text('Pending'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _handleTicketStatus('Completed'),
                  child: Text('Completed'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
