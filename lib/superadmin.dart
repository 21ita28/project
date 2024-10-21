import 'package:flutter/material.dart';

void main() => runApp(SuperAdmin());

class SuperAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SuperAdminHomePage(),
    );
  }
}

class SuperAdminHomePage extends StatefulWidget {
  @override
  _SuperAdminHomePageState createState() => _SuperAdminHomePageState();
}

class _SuperAdminHomePageState extends State<SuperAdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Admin Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Admin Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Department'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DepartmentPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Create Users'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateUserPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_remove),
              title: Text('Delete Users'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeleteUserPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Report'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Update Role'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateRolePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Implement logout functionality here
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to Super Admin Dashboard'),
      ),
    );
  }
}

// Example Department Page
class DepartmentPage extends StatefulWidget {
  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  final TextEditingController _departmentController = TextEditingController();

  void _addDepartment() {
    String department = _departmentController.text;
    if (department.isNotEmpty) {
      setState(() {
        _departmentController.clear();
        // Add logic to save department
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Department Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Department',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Department Name',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _addDepartment,
                  child: Text('Add'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _departmentController.clear(); // Clear the input
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Example Create User Page
class CreateUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Center(
        child: Text('Create User Page'),
      ),
    );
  }
}

// Example Delete User Page
class DeleteUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
      ),
      body: Center(
        child: Text('Delete User Page'),
      ),
    );
  }
}

// Example Report Page
class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Page'),
      ),
      body: Center(
        child: Text('Report Page'),
      ),
    );
  }
}

// Example Change Password Page
class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Center(
        child: Text('Change Password Page'),
      ),
    );
  }
}

// Example Update Role Page
class UpdateRolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Role'),
      ),
      body: Center(
        child: Text('Update Role Page'),
      ),
    );
  }
}