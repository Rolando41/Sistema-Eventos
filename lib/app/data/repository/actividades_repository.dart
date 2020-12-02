import 'package:cfia_eventos_app/app/data/model/actividades_model.dart';
import 'package:cfia_eventos_app/app/data/providers/actividades_api.dart';

class ActividadesRepository {
  final ActividadesApi _actividadesApi = ActividadesApi();

  Future<List<ListaActividad>> obtenerActividades(int idActividades) async {
    return await _actividadesApi.obtenerActividades(idActividades);
  }
}
