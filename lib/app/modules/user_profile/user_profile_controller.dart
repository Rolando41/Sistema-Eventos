import 'package:cfia_eventos_app/app/data/model/cantidad_ingresados_model.dart';
import 'package:cfia_eventos_app/app/data/repository/participantes_repository.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  ParticipantesRepository _participantesRepository = ParticipantesRepository();

  Cantidad _participante = Cantidad();

  get cantidadPaticipantes => _participante;
  int ingresados;
  int noingresados;
  bool _cargando = true;
  get cargando => _cargando;

  Future obtenerCantidadIngresado({int id}) async {
   _cargando = true;
    final Cantidad dato = await _participantesRepository.obtenerCantidadParticipantes(id);
    ingresados = dato.ingresado;
    noingresados= dato.noIngresado;
    _cargando = false;
    update(['can']);
  }
}
