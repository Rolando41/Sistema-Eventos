// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
    UserModel({
        this.objetoRespuesta,
    });

    ObjetoRespuesta objetoRespuesta;

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        objetoRespuesta: ObjetoRespuesta.fromMap(json["objetoRespuesta"]),
    );

    Map<String, dynamic> toMap() => {
        "objetoRespuesta": objetoRespuesta.toMap(),
    };
}

class ObjetoRespuesta {
    ObjetoRespuesta({
        this.token,
        this.users,
    });

    String token;
    List<User> users;

    factory ObjetoRespuesta.fromMap(Map<String, dynamic> json) => ObjetoRespuesta(
        token: (json["token"] != null)?json["token"]:'',
        users: (json["users"] != null)?List<User>.from(json["users"].map((x) => User.fromMap(x))):[],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
    };
}

class User {
    User({
        this.active,
        this.fullName,
        this.idUser,
        this.identifier,
        this.photo,
        this.userName,
    });

    bool active;
    String fullName;
    int idUser;
    String identifier;
    String photo;
    String userName;

    factory User.fromMap(Map<String, dynamic> json) => User(
        active: json["active"],
        fullName: json["fullName"],
        idUser: json["idUser"],
        identifier: json["identifier"],
        photo: json["photo"],
        userName: json["userName"],
    );

    Map<String, dynamic> toMap() => {
        "active": active,
        "fullName": fullName,
        "idUser": idUser,
        "identifier": identifier,
        "photo": photo,
        "userName": userName,
    };
}
