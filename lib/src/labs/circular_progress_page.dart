import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class CircularProgressPage extends StatefulWidget {

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() {

      // print('calor controller: ${controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value); //Que es un lerp? que es interpolar?
      });
      
    });

    super.initState();
  }

  @override
  void dispose() {
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh ),
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;

          if( nuevoPorcentaje > 100 ) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          controller.forward( from: 0.0 ); //define desde que momento iniciar la animacion, permitiendo repetirla

          setState(() {});
        },
        ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300.0,
          height: 300.0,
          // color:Colors.red,
          child: CustomPaint(
            painter: _MiRadialProggress( porcentaje ),
          ),
        ),
      ),
    );
  }
}


class _MiRadialProggress extends CustomPainter {


  final porcentaje;

  _MiRadialProggress( this.porcentaje );

  @override
  void paint(Canvas canvas, Size size) {

    

    //Circulo completado
    final paint = new Paint() //el lapiz
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke; //Configuración rapida todos dependientes del Paint()

    final Offset center = new Offset( size.width * 0.5, size.height * 0.5); //Ubicado en la mitad del contenedor
    final double radio = min( size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);


    //Arco
    final paintArco = new Paint() //el lapiz del arco
      ..strokeWidth = 10
      ..color       = Colors.pink
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