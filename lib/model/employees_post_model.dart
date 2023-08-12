

import 'dart:convert';

EmbloyeesPostRequest embloyeesResponseFromJson(String str) => EmbloyeesPostRequest.fromJson(json.decode(str));

String embloyeesResponseToJson(EmbloyeesPostRequest data) => json.encode(data.toJson());

class EmbloyeesPostRequest {
    String? status;
    Data data;

    EmbloyeesPostRequest({
         this.status,
        required this.data,
    });

    factory EmbloyeesPostRequest.fromJson(Map<String, dynamic> json) => EmbloyeesPostRequest(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String name;
    String salary;
    String age;
    int? id;

    Data({
        required this.name,
        required this.salary,
        required this.age,
         this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
