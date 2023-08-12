

class EmbloyeesUpdateModel {
    String status;
    UpdateData data;

    EmbloyeesUpdateModel({
        required this.status,
        required this.data,
    });

    factory EmbloyeesUpdateModel.fromJson(Map<String, dynamic> json) => EmbloyeesUpdateModel(
        status: json["status"],
        data: UpdateData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class UpdateData {
    String name;
    String salary;
    String age;
    int id;

    UpdateData({
        required this.name,
        required this.salary,
        required this.age,
        required this.id,
    });

    factory UpdateData.fromJson(Map<String, dynamic> json) => UpdateData(
        name: json["name"],
        salary: json["salary"],
        age: json["age"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "salary": salary,
        "age": age,
        "id": id,
    };
}
