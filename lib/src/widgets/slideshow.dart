import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:disenos_app/src/models/slider_model.dart';

class SlideShow extends StatelessWidget {

  final List<Widget> slides;
  final bool upperDots;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  SlideShow({
    @required this.slides,
    this.upperDots = false, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey, 
    this.bulletPrimario = 12.0, 
    this.bulletSecundario = 12.0
  });

  @override
  Widget build(BuildContext context) {

    

    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
              child: Center(
                child: Builder(
                  builder: (BuildContext context){
                    Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;
                    Provider.of<_SlideshowModel>(context).colorSecundario = this.colorSecundario;

                    Provider.of<_SlideshowModel>(context).bulletPrimario = this.bulletPrimario;
                    Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;
                    return Column(
                      children: <Widget> [
                        if (this.upperDots) 
                          _Dots(this.slides.length),
                        Expanded(
                          child: _Slides(slides: this.slides)
                        ),
                        if (!this.upperDots) 
                          _Dots(this.slides.length),
                      ]
                    );
                  },
                )
                ),  
              ),
      );
  }
}



class _Dots extends StatelessWidget {

  final int totalSlides;

  _Dots(this.totalSlides,);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (i) => _Dot(i)),
        // children: <Widget> [
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ]
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  

  _Dot(this.index, );

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SlideshowModel>(context);
    double size;
    Color color;

    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      size = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      size = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}



class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides({
    this.slides,
  });


  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {


  final pageViewController = new PageController();


  @override
  void initState() {
    
    pageViewController.addListener(() {
      //Actualizar el provider, la instancia de sliderModel
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
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
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
        // children: <Widget> [
        //   _Slide('assets/svg/slide-01.svg'),
        //   _Slide('assets/svg/slide-02.svg'),
        //   _Slide('assets/svg/slide-03.svg'),
        // ]
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: slide,
      );
  }
}



class _SlideshowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage){
    this._currentPage = currentPage;
    notifyListeners(); //Notifica a los widgets que les interese el cambio de este valor
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color color) {
    this._colorPrimario = color;
    // notifyListeners();
  }


  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color color) {
    this._colorSecundario = color;
    // notifyListeners();
  }


  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double size) {
    this._bulletPrimario = size;
    // notifyListeners();
  }


    double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double size) {
    this._bulletSecundario = size;
    // notifyListeners();
  }
}