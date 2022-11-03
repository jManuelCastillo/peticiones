// To parse this JSON data, do
//
//     final respuestaPersonas = respuestaPersonasFromJson(jsonString);

import 'dart:convert';

import 'package:peticionapi/models/persona_model.dart';

RespuestaPersonas respuestaPersonasFromJson(String str) => RespuestaPersonas.fromJson(json.decode(str));

String respuestaPersonasToJson(RespuestaPersonas data) => json.encode(data.toJson());

class RespuestaPersonas {
  RespuestaPersonas({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Persona> data;

  factory RespuestaPersonas.fromJson(Map<String, dynamic> json) => RespuestaPersonas(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Persona>.from(json["data"].map((x) => Persona.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
