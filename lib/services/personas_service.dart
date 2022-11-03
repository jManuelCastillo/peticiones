import 'package:http/http.dart';
import '../models/respuesta_model.dart';
import '../models/persona_model.dart';

class PersonasService {
  Future<List<Persona>> getPersonas() async {
    const url = 'https://reqres.in/api/users?page=2';
    final uri = Uri.parse(url);

    final response = await get(uri);

    final RespuestaPersonas respuesta = respuestaPersonasFromJson(response.body);

    await Future.delayed(Duration(seconds: 1), () {});

    return respuesta.data;
  }
}
