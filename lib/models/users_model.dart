
import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.gender,
        required this.card,
    });

    int id;
    String firstName;
    String lastName;
    String email;
    String gender;
    List<Car> card;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: json["gender"],
        card: List<Car>.from(json["card"].map((x) => Car.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "card": List<dynamic>.from(card.map((x) => x.toJson())),
    };
}



class Car {
    Car({
        required this.marca,
        required this.modelo,
        required this.year,
        required this.color,
        required this.patente,
    });

    String marca;
    String modelo;
    String year;
    String color;
    String patente;

    factory Car.fromJson(Map<String, dynamic> json) =>
        Car(
            marca: json["marca"],
            modelo: json["modelo"],
            year: json["year"],
            color: json["color"],
            patente: json["patente"],
        );

    Map<String, dynamic> toJson() =>
        {
            "marca": marca,
            "modelo": modelo,
            "year": year,
            "color": color,
            "patente": patente,
        };
}