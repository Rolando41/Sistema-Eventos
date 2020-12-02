

import 'package:cfia_eventos_app/app/data/model/cantidad_ingresados_model.dart';
import 'package:cfia_eventos_app/app/data/model/participantes_model.dart';
import 'package:cfia_eventos_app/app/data/providers/participantes_api.dart';

class ParticipantesRepository {
  final ParticipantesApi _participantesApi = ParticipantesApi();

  Future<List<ListaParticipante>> obtenerParticipantes(int idActividades) async {
    return  await _participantesApi.obtenerParticipantes(idActividades);
  }
  Future<Cantidad> obtenerCantidadParticipantes(int idActividades) async {
    return  await _participantesApi.obtenerCantidadParticipantes(idActividades);
  }
}
