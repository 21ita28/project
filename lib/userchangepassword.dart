import 'package:college/userpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(Userchangepassword());

class Userchangepassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Change Password',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangePasswordPage(),
    );
  }
}

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController =
  TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8 || password.length > 15) {
      return 'Password must be between 8 and 15 characters';
    }
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(password)) {
      return 'Password must contain both letters and numbers';
    }
    if (!RegExp(r'^(?=.*[!@#\$&*~])').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text == _retypeNewPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('New passwords do not match')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Userpage()));
            // Go back when pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Old Password', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your old password',
                ),
                validator: (value) =>
                value!.isEmpty ? 'Please enter old password' : null,
              ),
              SizedBox(height: 20),
              Text('New Password', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter new password',
                ),
                validator: _validatePassword,
              ),
              SizedBox(height: 20),
              Text('Retype New Password', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: _retypeNewPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Retype new password',
                ),
                validator: (value) =>
                value!.isEmpty ? 'Please retype the new password' : null,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _changePassword,
                    child: Text('Change Password'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}