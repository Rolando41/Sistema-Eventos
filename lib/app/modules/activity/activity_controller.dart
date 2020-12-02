import 'package:cfia_eventos_app/app/data/model/actividades_model.dart';
import 'package:cfia_eventos_app/app/data/repository/actividades_repository.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  /* Llamada a la API de Actividades */

  ActividadesRepository _actividadesRepository = ActividadesRepository();

  List<ListaActividad> _listaActividades;
  List<ListaActividad> get listaActividades => _listaActividades;
  bool _cargando = true;
  bool get cargando => _cargando;
  bool _listaVacia = false;
  bool get listaVacia => _listaVacia;

  int _index;
  int get indexEvento => _index;

  obtenerActividades(int idActividades) async {
    final lista = await _actividadesRepository.obtenerActividades(idActividades);
    if(lista.length < 1){
      _listaActividades =[];
      _listaVacia = true;
    }else{
       _listaActividades = lista;   
    }
    _cargando = false;
     update(['ActividadesID']);
  }
}
