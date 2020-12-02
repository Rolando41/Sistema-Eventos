
import 'package:cfia_eventos_app/app/data/model/participantes_model.dart';
import 'package:cfia_eventos_app/app/data/repository/participantes_repository.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

/* llamada api*/
  ParticipantesRepository _participantesRepository = ParticipantesRepository();

  RxList<ListaParticipante> listaparticipantes = List<ListaParticipante>().obs;
  RxList<ListaParticipante> listaNombres = List<ListaParticipante>().obs;

  obtenerParticipantes(int id) async {
    List<ListaParticipante> response =
        await _participantesRepository.obtenerParticipantes(id);
    listaparticipantes = response.obs;
  }

  buscarParticipante(String nombre) async {
    listaNombres = listaparticipantes
        .where((data) =>
            data.tcNombre.toLowerCase().contains(nombre.toLowerCase()))
        .toList()
        .obs;
    update();
  }
}
