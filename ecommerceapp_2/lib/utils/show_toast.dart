import 'package:flutter/cupertino.dart';

// Es una notificación ligeral y temporal que aparece en la parte inferior o superior de la pantalla
// Da retroalimentación al usuario y sin interrumpir actividad actual
// Se descarta automaticamente después de unos segundos y es común en SwiftUI y UIkit 
void showiOSToast(BuildContext context, String message){
  final overlay = Overlay.of(context);
  if (overlay == null) return; 
  late OverlayEntry overlayEntry;
}