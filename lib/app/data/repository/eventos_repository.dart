import 'package:cfia_eventos_app/app/data/model/eventos_model.dart';
import 'package:cfia_eventos_app/app/data/providers/eventos_api.dart';

class EventosRepository {

  final EventosApi _eventosApi = EventosApi();


  Future<List<ListaEvento>> getEventos() async{
    return await _eventosApi.obtenerEventos();
  }



}