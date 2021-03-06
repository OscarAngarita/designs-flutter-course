import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart';


class GraficasCircularesPages extends StatefulWidget {
 

  @override
  _GraficasCircularesPagesState createState() => _GraficasCircularesPagesState();
}

class _GraficasCircularesPagesState extends State<GraficasCircularesPages> {

  double porcentaje = 0.0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if( porcentaje > 100 ) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              CustomRadialProgress(porcentaje: porcentaje, colorPrimario: Colors.lightGreen, shaderOn: false),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, colorPrimario: Colors.pink, shaderOn: false),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              CustomRadialProgress(porcentaje: porcentaje * 1.4, colorPrimario: Colors.purple, shaderOn: false),
              CustomRadialProgress(porcentaje: porcentaje * 1.6, colorPrimario: Colors.green, shaderOn: true),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color colorPrimario;
  final bool shaderOn;

  const CustomRadialProgress({
    @required this.porcentaje, 
    @required this.colorPrimario, 
    this.shaderOn = false,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 200,
      height: 200,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.colorPrimario,
        colorSecundario: appTheme.textTheme.bodyText2.color,
        grosorSecundario: 4,
        grosorPrimario: 10,
        shaderOn: this.shaderOn,
      ),
    );
  }
}