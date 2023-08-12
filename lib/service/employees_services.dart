import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:niveus/constants/api_urls.dart';
import 'package:niveus/model/employees_get_model.dart';

import '../model/delete_employee_model.dart';
import '../model/employees_post_model.dart';
import '../model/update_emplloyee_model.dart';

class EmployeeServices {
  final dio = Dio();
  Future<EmployeesResponse?> getEmployees() async {
    try {
      final Response response = await dio.get(
        ApiEndPoints.getUrl,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return EmployeesResponse.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  //a00000===========add a employee------------

  Future<bool?> addEmployee({required EmbloyeesPostRequest model}) async {
    try {
      final Response response =
          await dio.post(ApiEndPoints.postUrl, data:jsonEncode(model.toJson()) );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('${response.data}---in the employee added');
        return true;
      }
    } catch (e) {
      log('$e error occured in embloyee adding service');
    }
    return null;
  }
  //-------------------updating the data
  Future<EmbloyeesUpdateModel> updateEmployeeData(String id, Map<String, dynamic> data) async {
    log('$data ==== $id=====updated data');
    try {
      Response response = await dio.put(
        ApiEndPoints.updateUrl+id, 
        data: data,
      );
      

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('${response.data}-------updatae response');
        return EmbloyeesUpdateModel.fromJson(response.data);
      } else {
        throw Exception('Failed to update employee data');
      }
    } catch (error) {
      throw Exception(' $error');
    }
  }

  // -----------------------delete a employeee
   Future<EmbloyeesDeleteModel?> deleteEmployee(int id) async {
    try {
      final Response response = await dio.delete(ApiEndPoints.deleteUrl+id.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('${response.data} ----------response of delete');
        return EmbloyeesDeleteModel.fromJson(response.data);
      }
    } catch (e) {
      log("$e ----catch section of service delete");
    }
    return null;
  }
}
