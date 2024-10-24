import 'package:college/changepasswordapp.dart';
import 'package:college/createuser.dart';
import 'package:college/deleteuser.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Grid of 3 rows and 2 columns of buttons
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildGridButton(
                  icon: Icons.home,
                  label: 'Department',
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DepartmentPage()));
                  },
                ),
                _buildGridButton(
                  icon: Icons.person_add,
                  label: 'Create Users',
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Createuser()));
                  },
                ),
                _buildGridButton(
                  icon: Icons.person_remove,
                  label: 'Delete Users',
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Deleteuser()));
                  },
                ),
                _buildGridButton(
                  icon: Icons.report,
                  label: 'Report',
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Superadminreport()));
                  },
                ),
                _buildGridButton(
                  icon: Icons.lock,
                  label: 'Change Password',
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangePasswordApp()));
                  },
                ),
                _buildGridButton(
                  icon: Icons.update,
                  label: 'Update Role',
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UpdateRoleApp()));
                  },
                ),
              ],
            ),
          ),
          // Logout button centered at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Implement logout functionality here
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CollegeLoginApp()));
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full-width button
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to create a grid button
  Widget _buildGridButton({
    required IconData icon,
    required String label,
    required Function onTap,
  }) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Change this value for more or less rounded corners
          side: BorderSide(color: Colors.grey, width: 1), // Optional: border color and width
        ),
        elevation: 2, // Optional: to give a slight elevation effect
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50),
          SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
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

  List<String> departments = ['HR', 'Finance', 'IT', 'Marketing'];
  List<String> inCharges = ['Alice', 'Bob', 'Charlie', 'David'];

  String? selectedDepartment;
  String? selectedInCharge;

  void _addDepartment() {
    String department = _departmentController.text;
    if (department.isNotEmpty) {
      setState(() {
        departments.add(department); // Add the new department to the list
        _departmentController.clear();
      });
    }
  }

  void _updateInCharge() {
    if (selectedDepartment != null && selectedInCharge != null) {
      // Logic to update the in-charge for the selected department
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Updated in-charge for $selectedDepartment to $selectedInCharge!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both department and in-charge.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Department Management'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>SuperAdmin()));
            //Go back when pressed
          },
        ),
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

            SizedBox(height: 30), // Space between sections
            Text(
              'Update In-Charge',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

// Wrap the DropdownButton with a Container to add border
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Set the border color
                  width: 1.0, // Set the border width
                ),
                borderRadius: BorderRadius.circular(5.0), // Set the border radius
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButton<String>(
                value: selectedInCharge,
                hint: const Text('Select In-Charge'),
                isExpanded: true,
                underline: SizedBox(), // Remove the default underline of the DropdownButton
                items: inCharges.map((String inCharge) {
                  return DropdownMenuItem<String>(
                    value: inCharge,
                    child: Text(inCharge),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedInCharge = newValue;
                  });
                },
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
            // Button to update in-charge

          ],
        ),
      ),
    );
  }
}
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