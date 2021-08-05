import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  final bool shaderOn;

  const RadialProgress({
    @required this.porcentaje, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey, 
    this.grosorSecundario = 4.0, 
    this.grosorPrimario = 10.0, 
    this.shaderOn = false,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    
    porcentajeAnterior = widget.porcentaje; //Inicializar porcentaje anterior
    controller = new AnimationController(vsync: this, duration: Duration( milliseconds: 200 )); //Config del controlador de la animación


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();	
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward( from: 0.0 );

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
         return Container(
           padding: EdgeInsets.all(10.0),
           width: double.infinity,
           height: double.infinity,
           child: CustomPaint(
             painter: _MiRadialProggress(
               (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
               widget.colorPrimario,
               widget.colorSecundario,
               widget.grosorPrimario,
               widget.grosorSecundario,
               widget.shaderOn
             ),
          ),
        );
      },
    );

  }
}


class _MiRadialProggress extends CustomPainter {


  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  final bool shaderOn;

  _MiRadialProggress( 
    this.porcentaje, 
    this.colorPrimario, 
    this.colorSecundario, 
    this.grosorPrimario,
    this.grosorSecundario, 
    this.shaderOn, 
  );

  @override
  void paint(Canvas canvas, Size size) {

    final Gradient gradiente = new LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red
      ]
    );

    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180
    );




    //Circulo completado
    final paint = new Paint() //el lapiz
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke; //Configuración rapida todos dependientes del Paint()

    final Offset center = new Offset( size.width * 0.5, size.height * 0.5); //Ubicado en la mitad del contenedor
    final double radio = min( size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);


    //Arco
    final paintArco = new Paint() //el lapiz del arco
      ..strokeWidth = grosorPrimario
      ..color       = colorPrimario
      ..shader      = shaderOn ? gradiente.createShader(rect) : null
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;


    //Parte que se debe ir llenando
    double arcAngle = 2 * pi * ( porcentaje / 100 ); //2*pi define la vuelta entera. La ultima multiplicación es el porcentaje de esto
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}