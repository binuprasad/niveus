

class EmbloyeesDeleteModel {
    String status;
    String message;

    EmbloyeesDeleteModel({
        required this.status,
        required this.message,
    });

    factory EmbloyeesDeleteModel.fromJson(Map<String, dynamic> json) => EmbloyeesDeleteModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
