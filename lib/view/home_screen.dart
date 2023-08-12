import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niveus/constants/appconstants.dart';
import 'package:niveus/controller/home_controller.dart';
import 'package:niveus/view/editing_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final employeeController = Get.put(EmployeeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(251, 228, 24, 1),
        title: const Text(
          'My Embloyees',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: Obx(
        () => employeeController.isLoading.value
            ? ListView.builder(
                itemCount: employeeController.employeeList.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = employeeController.employeeList[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name:',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  32, 80, 249, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'Age:',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(32, 80, 249, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'Empid:',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(32, 80, 249, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.employeeName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          data.employeeAge.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          data.id.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          final data = employeeController
                                              .employeeList[index];

                                          Get.to(() => EditingScreen(
                                                id: data.id,
                                                age: data.employeeAge,
                                                name: data.employeeName,
                                                salary: data.employeeSalary, index: index,
                                              ));
                                        },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: "Are you sure?",
                                          confirm: TextButton(
                                              onPressed: () {
                                                employeeController
                                                    .deleteEmployee(
                                                        employeeController
                                                            .employeeList[index]
                                                            .id);
                                                Get.back();
                                              },
                                              child: const Text('Confirm')),
                                          cancel: TextButton(
                                            onPressed: () => Get.back(),
                                            child: const Text('Cancel'),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Color.fromRGBO(239, 20, 20, 1),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  data.employeeSalary.toString(),
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(11, 156, 69, 1)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: employeeController.nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    Appcontants.h10,
                    TextField(
                      controller: employeeController.ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Age'),
                    ),
                    Appcontants.h10,
                    TextField(
                      controller: employeeController.salaryController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(labelText: 'Salary'),
                    ),
                    Appcontants.h20,
                    ElevatedButton(
                      onPressed: () {
                        employeeController.addEmployee();

                        Get.back();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
