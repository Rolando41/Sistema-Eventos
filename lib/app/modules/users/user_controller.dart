
import 'package:cfia_eventos_app/app/data/model/participantes_model.dart';
import 'package:cfia_eventos_app/app/data/repository/participantes_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  /* Llamada al repository de participantes */
  final ParticipantesRepository _participantesRepository =
      ParticipantesRepository();

  /* Creación de lista de participantes */
  List<ListaParticipante> _listaParticipantes;
  List<ListaParticipante> get listaParticipantes => _listaParticipantes;

  bool _cargando = true;
  bool get cargando => _cargando;


  @override
  void onReady() {
    super.onReady();
  }

  obtenerParticipantes(int idActividades) async {
    final lista =
        await _participantesRepository.obtenerParticipantes(idActividades);
    _listaParticipantes = lista;
    _cargando = false;
    update();
  }

}
