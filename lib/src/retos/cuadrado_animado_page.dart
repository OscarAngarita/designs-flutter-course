import 'package:flutter/material.dart';


class CuadradoAnimadoPage extends StatefulWidget {

  @override
  _CuadradoAnimadoPageState createState() => _CuadradoAnimadoPageState();
}

class _CuadradoAnimadoPageState extends State<CuadradoAnimadoPage> with SingleTickerProviderStateMixin {

  AnimationController controller;
  //animaciones
  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;


  @override
  void initState() {

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4500));

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut))
      );

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5, curve: Curves.bounceOut))
      );
    
    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.bounceOut))
      );

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
      );



    super.initState();

  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          child: _CuadradoAnimado(),
          builder: (BuildContext context, Widget childRectangulo) {
            return Transform.translate(
              offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
              child: childRectangulo,
              );
          },
          
          )
        ),
    );
  }
}

class _CuadradoAnimado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Rectangulo();
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