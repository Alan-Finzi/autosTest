// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

List<Service> serviceFromJson(String str) => List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
    Service({
        required this.id,
        required this.service,
    });

    int id;
    List<ServiceElement> service;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        service: List<ServiceElement>.from(json["Service"].map((x) => ServiceElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Service": List<dynamic>.from(service.map((x) => x.toJson())),
    };
}

class ServiceElement {
    ServiceElement({
        required this.fecha,
        required this.patente,
        required this.cambioDeAceite,
        required this.cambioDeFiltro,
        required this.cambioDeCorrea,
        required this.pintura,
    });

    String fecha;
    String patente;
    String cambioDeAceite;
    String cambioDeFiltro;
    String cambioDeCorrea;
    String pintura;

    factory ServiceElement.fromJson(Map<String, dynamic> json) => ServiceElement(
        fecha: json["Fecha"],
        patente: json["patente"],
        cambioDeAceite: json["cambio de Aceite"],
        cambioDeFiltro: json["cambio de filtro"],
        cambioDeCorrea: json["Cambio de correa"],
        pintura: json["Pintura"],
    );

    Map<String, dynamic> toJson() => {
        "Fecha": fecha,
        "patente": patente,
        "cambio de Aceite": cambioDeAceite,
        "cambio de filtro": cambioDeFiltro,
        "Cambio de correa": cambioDeCorrea,
        "Pintura": pintura,
    };
}
