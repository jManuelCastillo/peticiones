import 'package:flutter/material.dart';

import '../models/persona_model.dart';
import '../services/personas_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersonasService personasService = PersonasService();
  List<Persona> listado = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Número de personas: ${listado.length}'),
        elevation: 20.0,
      ),
      body: (listado.length == 0)
          ? Center(child: Text('Todavía no hay data'))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(listado[1].firstName), Text(listado[1].lastName), Text(listado[1].email)],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          listado = await personasService.getPersonas();
          print(listado[1].email);
          setState(() {});
        },
        child: Icon(Icons.replay_outlined),
      ),
    );
  }
}
