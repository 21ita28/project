import 'package:college/userpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(CollegeLoginApp());

class CollegeLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Management Login',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for handling user input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login action
  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Logic for validation or authentication can be added here
    if (username == "admin" && password == "password123") {
      // For demonstration, assuming successful login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Login Successful"),
          content: Text("Welcome to the College Management System!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }else if (username == "user" && password == "test") {
      // Navigate to the UserPage when the username and password match
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Userpage()),
      );} else {
      // Show error message if credentials are incorrect
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Login Failed"),
          content: Text("Invalid Username or Password."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Try Again"),
            ),
          ],
        ),
      );
    }
  }

  // Function to handle cancel action
  void _handleCancel() {
    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // College logo
            Image.asset(
              'assets/college_logo.png', // Make sure to add the logo in your assets folder
              height: 100.0,
            ),
            SizedBox(height: 50.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: _handleCancel,
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                // Logic to handle 'Forgot Password' action
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
