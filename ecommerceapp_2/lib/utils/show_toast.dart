import 'package:flutter/cupertino.dart';

// Es una notificación ligeral y temporal que aparece en la parte inferior o superior de la pantalla
// Da retroalimentación al usuario y sin interrumpir actividad actual
// Se descarta automaticamente después de unos segundos y es común en SwiftUI y UIkit 
void showiOSToast(BuildContext context, String message){
  final overlay = Overlay.of(context);
  if (overlay == null) return; 
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(builder: (context) {
    return _ToastWidget(
      message: message, 
      onFinish: (){
        overlayEntry.remove();
      }
    );
    
  });
  overlay.insert(overlayEntry);
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final VoidCallback onFinish;

  const _ToastWidget({
    required this.message,
    required this.onFinish,
  });

  @override
  State<_ToastWidget> createState() => __ToastWidgetState();
}

class __ToastWidgetState extends State<_ToastWidget> 
  with SingleTickerProviderStateMixin {
    late AnimationController _controller;
    late Animation<double> _opacity; 
    late Animation<Offset> _offset;
  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
      );
      _opacity = Tween(begin: 0.0, end: 1.0).animate(_controller);

      _offset = Tween(
        begin: const Offset(0, 0.3),
        end: Offset.zero
      ).animate(_controller);

      _controller.forward();

      Future.delayed(Duration(seconds: 1), () async {
        await _controller.reverse();
        widget.onFinish();
      });
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {

    return Positioned(
      bottom: 80,
      left: 24,
      right: 24,
      child: FadeTransition(opacity: _opacity,
      child: SlideTransition(position: _offset,
      child: CupertinoPopupSurface(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(widget.message, textAlign: TextAlign.center,),
      )),),),

      );
  }
  }
