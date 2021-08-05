import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//cuadrado
class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Color(0xff615AAB),
    );
  }
}

//Border redondeados
class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
    );
  }
}

//Diagonal
class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}


class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      
      final lapiz = Paint(); //El lapiz para dibujar la figura, comunmente llamado paint

    // Propiedades
    lapiz.color = Color(0xff615AAB); //Definiendo color del lapiz
    lapiz.style = PaintingStyle.fill; //Forma de pintar, alternativo .fill o .stroke
    lapiz.strokeWidth = 2;

    final path = new Path(); //Camino por el que dibuja el lapiz

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5); //Ultima linea para completar figura no es necesaria, fill infiere la ultima linea


    canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  
}


//Triangulo
class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}



class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint(); //El lapiz para dibujar la figura, comunmente llamado paint

    // Propiedades
    lapiz.color = Color(0xff615AAB); //Definiendo color del lapiz
    lapiz.style = PaintingStyle.fill; //Forma de pintar, alternativo .fill o .stroke
    lapiz.strokeWidth = 2;

    final path = new Path(); //Camino por el que dibuja el lapiz

    //Dibujar con el path y el lapiz
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
  
    canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


//Pico
class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}



class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint(); //El lapiz para dibujar la figura, comunmente llamado paint

    // Propiedades
    lapiz.color = Color(0xff615AAB); //Definiendo color del lapiz
    lapiz.style = PaintingStyle.fill; //Forma de pintar, alternativo .fill o .stroke
    lapiz.strokeWidth = 2;

    final path = new Path(); //Camino por el que dibuja el lapiz

    //Dibujar con el path y el lapiz
    path.lineTo(0 , size.height * 0.2);
    path.lineTo(size.width * 0.5 , size.height * 0.3);
    path.lineTo(size.width , size.height * 0.2);
    path.lineTo(size.width, 0);
  
    canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}




//Curva
class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}



class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint(); //El lapiz para dibujar la figura, comunmente llamado paint

    // Propiedades
    lapiz.color = Color(0xff615AAB); //Definiendo color del lapiz
    lapiz.style = PaintingStyle.fill; //Forma de pintar, alternativo .fill o .stroke
    lapiz.strokeWidth = 2;

    final path = new Path(); //Camino por el que dibuja el lapiz

    //Dibujar con el path y el lapiz
    path.lineTo(0 , size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.6, size.width, size.height * 0.25);
    path.lineTo(size.width , 0);

   
  
    canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}




//Wave
class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}



class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint(); //El lapiz para dibujar la figura, comunmente llamado paint

    // Propiedades
    lapiz.color = Color(0xff615AAB); //Definiendo color del lapiz
    lapiz.style = PaintingStyle.fill; //Forma de pintar, alternativo .fill o .stroke
    lapiz.strokeWidth = 2;

    final path = new Path(); //Camino por el que dibuja el lapiz

    //Dibujar con el path y el lapiz
    path.lineTo(0 , size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width , 0);

   
  
    canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


//Gradiente
class HeaderGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderGradientPainter(),
      ),
    );
  }
}




class _HeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {


    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 55.0), //Offset en x,y pero al ser gradiente linear solo un eje causa cambios
      radius: 180
    );

    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter, //Cambiar la dirección del gradiente
      end: Alignment.bottomCenter, //Cambiar la dirección del gradiente
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012ff),
        Color(0xff6D05FA),
      ],
      stops: [ //Puntos de inicio, pausa y fin de los gradientes, actualmente no afecta el gradiente inicial
        0.0,
        0.5,
        1.0,
      ]
    );

    
    final lapiz = Paint()..shader = gradiente.createShader(rect); //Agregandole un shader al lapiz

    // Propiedades
    // lapiz.color = Colors.red; //Color no genera cambios ya que se esta usando un gradiente
    lapiz.style = PaintingStyle.fill; //
    lapiz.strokeWidth = 2;

    final path = new Path(); //Camino por el que dibuja el lapiz

    //Dibujar con el path y el lapiz
    path.lineTo(0 , size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width , 0);

   
  
    canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}




//
class IconHeader extends StatelessWidget {


  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    @required this.icon, 
    @required this.titulo, 
    @required this.subtitulo, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey
  });
  

  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: <Widget> [
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon, size: 250, color: Colors.white.withOpacity(0.2))
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity),
            Text(this.subtitulo, style: TextStyle(fontSize: 20, color: colorBlanco)),
            SizedBox(height: 20),
            Text(this.titulo, style: TextStyle(fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            FaIcon(this.icon, size: 80, color: Colors.white)
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    @required this.color1, 
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            this.color1, 
            this.color2,
          ]
        )
      ),
    );
  }
}