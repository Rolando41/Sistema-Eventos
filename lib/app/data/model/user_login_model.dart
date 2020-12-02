
class UserModelLogin {
  UserModelLogin({
    this.digital,
    this.token,
    this.users,
  });

  bool digital;
  String token;
  List<User> users;

  factory UserModelLogin.fromMap(Map<String, dynamic> json) => UserModelLogin(
        digital: json["digital"],
        token: json["token"],
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "digital": digital,
        "token": token,
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
      };
}

class User {
  User({
    this.active,
    this.cellPhone,
    this.emails,
    this.finalHour,
    this.fullName,
    this.idUser,
    this.identifier,
    this.initialHour,
    this.photo,
    this.userName,
    this.userTypes,
  });

  bool active;
  String cellPhone;
  List<Email> emails;
  DateTime finalHour;
  String fullName;
  int idUser;
  String identifier;
  DateTime initialHour;
  String photo;
  String userName;
  List<UserType> userTypes;

  factory User.fromMap(Map<String, dynamic> json) => User(
        active: json["active"],
        cellPhone: json["cellPhone"],
        emails: List<Email>.from(json["emails"].map((x) => Email.fromMap(x))),
        finalHour: DateTime.parse(json["finalHour"]),
        fullName: json["fullName"],
        idUser: json["idUser"],
        identifier: json["identifier"],
        initialHour: DateTime.parse(json["initialHour"]),
        photo: json["photo"],
        userName: json["userName"],
        userTypes: List<UserType>.from(
            json["userTypes"].map((x) => UserType.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "active": active,
        "cellPhone": cellPhone,
        "emails": List<dynamic>.from(emails.map((x) => x.toMap())),
        "finalHour": finalHour.toIso8601String(),
        "fullName": fullName,
        "idUser": idUser,
        "identifier": identifier,
        "initialHour": initialHour.toIso8601String(),
        "photo": photo,
        "userName": userName,
        "userTypes": List<dynamic>.from(userTypes.map((x) => x.toMap())),
      };
}

class Email {
  Email({
    this.isDefault,
    this.userEmail,
  });

  bool isDefault;
  String userEmail;

  factory Email.fromMap(Map<String, dynamic> json) => Email(
        isDefault: json["isDefault"],
        userEmail: json["userEmail"],
      );

  Map<String, dynamic> toMap() => {
        "isDefault": isDefault,
        "userEmail": userEmail,
      };
}

class UserType {
  UserType({
    this.active,
    this.descriptionType,
    this.idCategory,
    this.idUserType,
  });

  bool active;
  String descriptionType;
  String idCategory;
  String idUserType;

  factory UserType.fromMap(Map<String, dynamic> json) => UserType(
        active: json["active"],
        descriptionType: json["descriptionType"],
        idCategory: json["idCategory"],
        idUserType: json["idUserType"],
      );

  Map<String, dynamic> toMap() => {
        "active": active,
        "descriptionType": descriptionType,
        "idCategory": idCategory,
        "idUserType": idUserType,
      };
}
