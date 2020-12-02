import 'package:cfia_eventos_app/app/data/model/actividades_model.dart';
import 'package:cfia_eventos_app/app/data/model/eventos_model.dart';
import 'package:cfia_eventos_app/app/data/repository/actividades_repository.dart';
import 'package:cfia_eventos_app/app/data/repository/eventos_repository.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  /* Llamada del repository para optener datos del api*/
  final EventosRepository _eventosRepository = EventosRepository();
  final ActividadesRepository _actividadesRepository = ActividadesRepository();
  /*  Llamada del repository para obtener las actividades*/

  List<ListaEvento> _listaEventos;
  List<ListaEvento> get listaEventos => _listaEventos;
  bool _cargando = true;
  bool get cargando => _cargando;

  /* lista Acitivades */
  List<ListaActividad> _listaActividades;
  List<ListaActividad> get listaActividades => _listaActividades;
  bool _cargandoA = true;
  bool get cargandoA => _cargandoA;
  int _indexA;
  int get indexA => _indexA;
  bool _cambiodeA = false;
  bool get cambioA => _cambiodeA;


  /* Index eventos, para llamar las actividades */
  @override
  onInit() {
    obtenerEventos();
  }

  @override
  onReady() {
  }

  


  obtenerEventos() async {
    final lista = await _eventosRepository.getEventos();
    _listaEventos = lista;
    _cargando = false;
    update();
  }

  obtenerActividades(int idActividades) async {
    _cambiodeA = true;
    final lista = await _actividadesRepository.obtenerActividades(idActividades);
    _listaActividades = lista;
    
    _cargandoA = false;
     _cambiodeA= false;
     update(['ActividadesID']);
  }
   

 void index(int index){
   this._indexA = index;

   update();
 }
 



}
