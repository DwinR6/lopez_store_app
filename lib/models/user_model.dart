import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.userId,
        this.userName,
        this.userEmail,
        this.userPass,
        this.userPhone,
    });

    String userId;
    String userName;
    String userEmail;
    String userPass;
    String userPhone;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPass: json["user_pass"],
        userPhone: json["user_phone"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_pass": userPass,
        "user_phone": userPhone,
    };
}
