import 'package:cfia_eventos_app/app/data/model/verificar_user_model.dart';
import 'package:cfia_eventos_app/app/data/repository/proceso_qr_repository.dart';
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
/* importación del paquete que se utliza para escanear qr */

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

/* debo de realizar los siguientes procesos */
/* 
 1- Leer codigo QR.
 2- Verficar en la base de dastos la existencia.
 3- mostart un modal, uno para cada estado.
*/

class QrController extends GetxController {
  QrProcesoRepository _procesoRepository = QrProcesoRepository();

  @override
  onInit() {}

  String _qrString = "";
  bool _cargando = false;

  bool get cargando =>_cargando;

  BuildContext _context;
  BuildContext buildContext(BuildContext context) {
    this._context = context;
  }

  Future scannearQR(int idActividad) async {
    try {
      String txtqr = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      _qrString = txtqr;
      print("${1}= $_qrString");
      if (_qrString != '-1') {
        qrProcesoVerificacion(idActi: idActividad, codConfir: _qrString);
      }
    } catch (e) {
      print(e);
    }
  }

  Future qrProcesoVerificacion({int idActi, String codConfir}) async {
    QrModel response = await _procesoRepository.qrProceso(
        idActividad: idActi, codigoConfir: codConfir);

    switch (response.clave) {
      case "No tiene Acceso":
        modalNoAccesso(response.clave);
        _qrString = '';
        
        update();
        break;
      case "Si tiene Acceso":
        modalTieneAcceso(
            estado: response.clave,
            idActividad: response.participante.tnIdActividad,
            idParticipante: response.participante.tnIdParticipante);
             _qrString = '';
             
        update();
        break;

      case "Ya ingreso":
        modalYaIngreso(response.clave);
        _qrString = '';
        update();
        break;

      default:
        print('No entro');
        update();

    }
  }

  modalNoAccesso(String estado)async {
    return  AwesomeDialog(
        context: _context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        dismissOnTouchOutside: false,
        // title: estado,
        // desc: 'Esta persona no tiene acceso',
        body: CustomGlobalTextWidget(
          text: 'No tiene acceso',
          size: 18.0,
          fontFamily: 'Sen-ExtraBold',
        ),
        btnCancelOnPress: () {},
        btnCancelText: "Cancelar",
        btnCancelColor: Color(0xFFF8E060D))
      ..show();
  }

  modalYaIngreso(String estado) {
    return AwesomeDialog(
        context: _context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        dismissOnTouchOutside: false,
        // title: estado,
        // desc: 'Esta persona no tiene acceso',
        body: CustomGlobalTextWidget(
          text: 'Esta persona ya ingreso.',
          size: 18.0,
          fontFamily: 'Sen-ExtraBold',
        ),
        btnCancelOnPress: () {},
        btnCancelText: "Aceptar",
        btnCancelColor: Colors.yellow[800])
      ..show();
  }

  modalTieneAcceso({String estado, int idActividad, int idParticipante}) async {
   
    return  AwesomeDialog(
      context: _context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      dismissOnTouchOutside: false,
      // title: estado,
      // desc: 'Esta persona no tiene acceso',
      body: CustomGlobalTextWidget(
        text: 'Tiene acceso a la actividad.',
        size: 15.0,
        fontFamily: 'Sen-ExtraBold',
      ),
      btnCancelOnPress: () {},
      btnCancelText: "Cancelar",
      btnCancelColor: Color(0xFFF8E060D),
      btnOkOnPress: () async {
    
        await procesoRegistro(
            idActividad: idActividad, idParticipante: idParticipante);
      },
      btnOkText: "Registrar",
      // btnOkColor: Colors.greenAccent[700]
    )..show();
  }

  Future procesoRegistro({int idActividad, int idParticipante}) async {
    final resultado = await _procesoRepository.registrarIngresoActividad(idActividad: idActividad,idParticipante: idParticipante);
   

    if (resultado) {
      AwesomeDialog(
        context: _context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        dismissOnTouchOutside: false,
        // title: estado,
        // desc: 'Esta persona no tiene acceso',
        body: CustomGlobalTextWidget(
          text: 'Registrado con exito',
          size: 15.0,
          fontFamily: 'Sen-ExtraBold',
        ),
      
        btnOkOnPress: () {
        
        },
        btnOkText: "Aceptar",
        // btnOkColor: Colors.greenAccent[700]
      )..show();
    }else{
      AwesomeDialog(
        context: _context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        dismissOnTouchOutside: false,
        // title: estado,
        // desc: 'Esta persona no tiene acceso',
        body: CustomGlobalTextWidget(
          text: 'Error al registrar ingreso,\n por favor intente de nuevo',
          size: 18.0,
          fontFamily: 'Sen-ExtraBold',
        ),
        btnCancelOnPress: () {},
        btnCancelText: "Acptar",
        btnCancelColor: Color(0xFFF8E060D))
      ..show();

    }
  }
}
