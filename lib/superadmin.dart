import 'package:college/changepasswordapp.dart';
import 'package:college/main.dart';
import 'package:college/superadminreport.dart';
import 'package:flutter/material.dart';

void main() => runApp(SuperAdmin());

class SuperAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome SuperAdmin!',
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
            SizedBox(height: 50),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Department'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DepartmentPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Create Users'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CreateUserPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_remove),
              title: Text('Delete Users'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DeleteUserPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Report'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Superadminreport()));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordApp()));
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Update Role'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => UpdateRoleApp()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Implement logout functionality here
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CollegeLoginApp()));
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


// Example Change Password Page


// Example Update Role Page
class UpdateRoleApp extends StatelessWidget {
  const UpdateRoleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Update Role',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UpdateRolePage(),
    );
  }
}

class UpdateRolePage extends StatefulWidget {
  const UpdateRolePage({Key? key}) : super(key: key);

  @override
  _UpdateRolePageState createState() => _UpdateRolePageState();
}

class _UpdateRolePageState extends State<UpdateRolePage> {
  List<String> users = ['Alice', 'Bob', 'Charlie', 'David'];
  List<String> roles = ['Admin', 'Incharge', 'Staff', 'Visitor'];

  String? selectedUser;
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Role'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SuperAdmin()));
             // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select User:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedUser,
              hint: const Text('Choose User'),
              isExpanded: true,
              items: users.map((String user) {
                return DropdownMenuItem<String>(
                  value: user,
                  child: Text(user),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedUser = newValue;
                });
              },
            ),
            const SizedBox(height: 20), // Spacing
            const Text(
              'Select Role:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedRole,
              hint: const Text('Choose Role'),
              isExpanded: true,
              items: roles.map((String role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue;
                });
              },
            ),
            const SizedBox(height: 20), // Spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SuperAdmin()));
                    if (selectedUser != null && selectedRole != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Updated role for $selectedUser to $selectedRole!'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select both user and role.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Update'),
                ),
                const SizedBox(width: 10), // Spacing
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedUser = null; // Clear user selection
                      selectedRole = null; // Clear role selection
                    });
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

