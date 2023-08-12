

class EmployeesResponse {
    String status;
    List<EmbloyeeModel> data;
    String message;

    EmployeesResponse({
        required this.status,
        required this.data,
        required this.message,
    });

    factory EmployeesResponse.fromJson(Map<String, dynamic> json) => EmployeesResponse(
        status: json["status"],
        data: List<EmbloyeeModel>.from(json["data"].map((x) => EmbloyeeModel.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class EmbloyeeModel {
    int id;
    String employeeName;
    int employeeSalary;
    int employeeAge;


    EmbloyeeModel({
        required this.id,
        required this.employeeName,
        required this.employeeSalary,
        required this.employeeAge,
   
    });

    factory EmbloyeeModel.fromJson(Map<String, dynamic> json) => EmbloyeeModel(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
    
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        
    };
}
