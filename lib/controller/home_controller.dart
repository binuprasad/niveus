import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niveus/model/employees_get_model.dart';
import 'package:niveus/model/update_emplloyee_model.dart';
import 'package:niveus/service/employees_services.dart';

import '../model/employees_post_model.dart';

class EmployeeController extends GetxController {
  RxList<EmbloyeeModel> employeeList = <EmbloyeeModel>[].obs;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final salaryController = TextEditingController();
  final nameEditingController = TextEditingController();
  final ageEditingController = TextEditingController();
  final salaryEditingController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getEmployee();
  }

  Future getEmployee() async {
    final EmployeesResponse? response = await EmployeeServices().getEmployees();
    if (response != null) {
      employeeList.addAll(response.data);
      log(response.data.toString());
    } else {
      log('No response');
    }
    update();
    isLoading.value = true;
  }

  Future<void> addEmployee() async {
    final employeeData = Data(
      name: nameController.text,
      salary: salaryController.text,
      age: ageController.text,
    );

    EmbloyeesPostRequest model = EmbloyeesPostRequest(
      data: employeeData,
    );

    await EmployeeServices().addEmployee(model: model);
    log('${EmployeeServices().addEmployee(model: model)}');
    log('after addbooking service');
  }

  final employeesUpdateModel = EmbloyeesUpdateModel(
    status: '',
    data: UpdateData(name: '', salary: '', age: '', id: 0),
  ).obs;

  void updateEmployee(String id,int index) async {
    EmbloyeeModel model = EmbloyeeModel(
      id: int.parse(id),
      employeeName: nameEditingController.text.trim(),
      employeeSalary: int.parse(salaryEditingController.text.trim()),
      employeeAge: int.parse(ageEditingController.text.trim()),
    );
    
    log('$index -----------list index');
    employeeList.removeAt(index);
    employeeList.insert(index, model);

    
    final data = {
      "name": nameEditingController.text,
      "age": ageEditingController.text,
      "salary": salaryEditingController.text,
      "id": id
    };

    try {
      employeesUpdateModel.value =
          await EmployeeServices().updateEmployeeData(id, data);
      log(employeesUpdateModel.value.toString());
      // Handle success or display a message
    } catch (e) {
      log(e.toString());
      // Handle error or display an error message
    }
  }

  Future<void> deleteEmployee(int id) async {
    try {
      await EmployeeServices().deleteEmployee(id);
      final response = await EmployeeServices().deleteEmployee(id);
      Get.snackbar('', response?.message.toString() ?? 'null',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    } catch (e) {
      log("$e ------the catch of deleteemployee");
    }
  }
}
