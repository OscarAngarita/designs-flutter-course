import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/models/slider_model.dart';


class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget> [
              Expanded(
                child: _Slides()
                ),
              _Dots()
            ]
          )
        ),
      ),
    );
  }
}



class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ]
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) 
        ? Colors.blue : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}



class _Slides extends StatefulWidget {


  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {


  final pageViewController = new PageController();


  @override
  void initState() {
    
    pageViewController.addListener(() {
      // print('Página actual: ${pageViewController.page}');

      //Actualizar el provider, la instancia de sliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;


    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: <Widget> [
          _Slide('assets/svg/slide-01.svg'),
          _Slide('assets/svg/slide-02.svg'),
          _Slide('assets/svg/slide-03.svg'),
        ]
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: SvgPicture.asset(svg),
      );
  }
}