class UserModel {
    Data data;
    Support support;

    UserModel({
        required this.data,
        required this.support,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
    );
}

class Data {
    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    Data({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );
}

class Support {
    String url;
    String text;

    Support({
        required this.url,
        required this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );
}
