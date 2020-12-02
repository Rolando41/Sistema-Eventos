import 'package:cfia_eventos_app/app/data/model/verificar_user_model.dart';
import 'package:cfia_eventos_app/app/data/providers/proceso_qr_api.dart';

class QrProcesoRepository{

 QRProcesoApi _qrProcesoApi =QRProcesoApi();

 Future<QrModel> qrProceso({int idActividad,String codigoConfir})async{
   return _qrProcesoApi.qrVerificarParticipante(idActividad: idActividad,codigoConfir: codigoConfir);
 }
 Future<bool> registrarIngresoActividad({int idActividad,int idParticipante})async{
   return _qrProcesoApi.registrarIngresoActividad(idActividad: idActividad,idParticipante: idParticipante);
 }



}