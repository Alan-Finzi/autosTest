import 'dart:convert';

List<PatenteService> patenteServiceFromJson(String str) => List<PatenteService>.from(json.decode(str).map((x) => PatenteService.fromJson(x)));

String patenteServiceToJson(List<PatenteService> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatenteService {
    PatenteService({required this.service,});

    List<Service> service;

    factory PatenteService.fromJson(Map<String, dynamic> json) => PatenteService(
        service: List<Service>.from(json["Service"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Service": List<dynamic>.from(service.map((x) => x.toJson())),
    };
}

class Service {
    Service({
        required this.fecha,
        required this.cambioDeAceite,
        required this.cambioDeFiltro,
        required this.cambioDeCorrea,
        required this.pintura,
    });

    String fecha;
    String cambioDeAceite;
    String cambioDeFiltro;
    String cambioDeCorrea;
    String pintura;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        fecha: json["Fecha"],
        cambioDeAceite: json["cambio de Aceite"],
        cambioDeFiltro: json["cambio de filtro"],
        cambioDeCorrea: json["Cambio de correa"],
        pintura: json["Pintura"],
    );

    Map<String, dynamic> toJson() => {
        "Fecha": fecha,
        "cambio de Aceite": cambioDeAceite,
        "cambio de filtro": cambioDeFiltro,
        "Cambio de correa": cambioDeCorrea,
        "Pintura": pintura,
    };
}
