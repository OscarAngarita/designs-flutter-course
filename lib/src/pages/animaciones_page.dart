import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin { //Para un controlador, si necesita varios seria MultipleTicket

  //Necesaria dos cosas para configurar la animación: AnimationController y Animation
  AnimationController controller; //Controlador de la animación. como la barra de cotrol de un video
  Animation<double> rotacion; //Configuración y calculo de una animación. Se liga al controller. Puede regresar un tipo especifico
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    
    controller = new AnimationController( //Controlador para manejar el elemento, su estatus y propiedades.
      vsync: this, duration: Duration(milliseconds:  4000) //Inicializando Controller y sus propiedades
    );

    // rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller); //Configurando animacion, Tween es una animacion especifica de material

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut) //Urilizando curvas
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
      ); //Definir intervalo de la opacidad

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
      ); //Definir intervalo de la opacidad

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
      ); //0.0 donde inicia, 200 a donde llega 

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
      );


    controller.addListener(() { //Crear un listener para controller, el cual evalua el estado en cada momento
      
      print('Status: ${controller.status}');
      if ( controller.status == AnimationStatus.completed) { //Segun del estado, haga:
        // controller.repeat();
        // controller.reverse();
        controller.reset(); // .reverse reversa la animación
      } 
      // else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); //En el dispose siempre se coloca el dispose de los controller para evitar fugas de memoria
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward(); //Forward: Iniciar la animacion

    return AnimatedBuilder(
      animation: controller, 
      child: _Rectangulo(), //A que animar
      builder: (BuildContext context, Widget childRectangulo) {
        // print('rotacion: ' + rotacion.value.toString());
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate( //Transformada segun los datos datos, renderización de los resultados matematicos
            angle: rotacion.value, //Cuanto se quiere transformar, calculo matematico
            // child: _Rectangulo(), //A que transformar
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo
                )
              ),
          ),
        );
      },
    );
  }

}






class _Rectangulo extends StatelessWidget {
  @override
  Widget build( BuildContext context ) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}