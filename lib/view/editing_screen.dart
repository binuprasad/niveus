import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niveus/constants/appconstants.dart';
import 'package:niveus/controller/home_controller.dart';

class EditingScreen extends StatelessWidget {
  final int index;
  final int id;
  final String name;
  final int age ;
  final int salary;
  EditingScreen({super.key, required this.id, required this.name, required this.age, required this.salary, required this.index});
  final employeeController = Get.put(EmployeeController());
 
  @override
  Widget build(BuildContext context) {
    employeeController.nameEditingController. text = name;
     employeeController.ageEditingController.text =age.toString();
     employeeController.salaryEditingController.text= salary.toString() ;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: employeeController.nameEditingController ,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            Appcontants.h10,
            TextField(
              controller: employeeController.ageEditingController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            Appcontants.h10,
            TextField(
              controller: employeeController.salaryEditingController,
              decoration: const InputDecoration(labelText: 'Salary'),
              keyboardType: TextInputType.number,
            ),
            Appcontants.h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                   
                    employeeController.updateEmployee(id.toString(),index);
                  },
                  child: const Text('Save Changes'),
                ),
                Appcontants.h10,
                ElevatedButton(
                  onPressed: () {
                    Get.back();
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
