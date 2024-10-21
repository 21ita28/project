import 'package:college/userpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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

  void _closeTicket() {
    // Handle the close ticket logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Close Ticket'),
          content: Text('Are you sure you want to close this ticket?'),
          actions: [
            TextButton(
              onPressed: () {
                // Implement logout functionality here
                Navigator.of(context).pop();

              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Userpage()));
                // Add any additional logic for closing the ticket here
              },
              child: Text('Close Ticket'),
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
        title: Text('No Light'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Userpage()));
              // Add any additional logic for closing the ticket here
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
                          style:
                          TextStyle(fontSize: 12, color: Colors.grey[600]),
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
          // Close Ticket Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: _closeTicket,
              child: Text('  Close Ticket  '),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),

                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 10), // Optional spacing below the button
        ],
      ),
    );
  }
}
