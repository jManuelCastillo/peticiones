import 'package:flutter/material.dart';
import '../models/persona_model.dart';
import '../services/personas_service.dart';

class BuilderPage extends StatelessWidget {
  const BuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    PersonasService personasService = PersonasService();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trabajando con FutureBuilder'),
        ),
        body: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                  'Esse in reprehenderit culpa non aliqua. Ullamco minim amet elit commodo enim tempor consectetur magna nisi ex deserunt culpa. Exercitation et quis commodo nisi irure in mollit. Ut amet mollit dolor ad occaecat ad esse. Voluptate amet labore veniam ex est id dolore. Quis velit consectetur ex in aliqua fugiat est.'),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future: personasService.getPersonas(),
                builder: (BuildContext context, AsyncSnapshot<List<Persona>> snapshot) {
                  if (!snapshot.hasData)
                    return CircularProgressIndicator();
                  else
                    return MuestraPersona(snapshot.data![2]);
                },
              ),
            ]));
  }
}

class MuestraPersona extends StatelessWidget {
  Persona persona;

  MuestraPersona(this.persona);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: FadeInImage(
                fadeInDuration: const Duration(milliseconds: 1000),
                placeholder: const AssetImage('assets/loading.gif'),
                fit: BoxFit.cover,
                image: NetworkImage(persona.avatar),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Text(
              '${persona.firstName} ${persona.lastName}',
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ),
          Text(persona.email)
        ],
      ),
    );
  }
}
