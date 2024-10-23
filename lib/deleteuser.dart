import 'package:college/main.dart';
import 'package:college/superadmin.dart';
import 'package:flutter/material.dart';

class Deleteuser extends StatefulWidget {
  const Deleteuser({Key? key}) : super(key: key);

  @override
  State<Deleteuser> createState() => _DeleteuserState();
}

class _DeleteuserState extends State<Deleteuser> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Email validation function


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the previous page
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SuperAdmin()));
          },
        ),
        title: const Text("Delete User"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns content to the top
            children: [
              const SizedBox(height: 30), // You can add a small gap if needed
              const Text(
                "Enter the Username",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Email is valid, proceed with sending the reset link

                      // Show the success pop-up message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('The User has been Deleted'),
                        ),
                      );

                      // Navigate to login page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SuperAdmin()),
                      );
                    }
                  },
                  child: const Text("Delete"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
