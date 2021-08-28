import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';



class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: MiSlideShow()
            ),
          Expanded(
            child: MiSlideShow()
          )
        ],
      ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return SlideShow(
      bulletPrimario: 20.0,
      bulletSecundario: 12.0,
      colorPrimario: (appTheme.darkTheme) ? Colors.greenAccent : appTheme.currentTheme.accentColor,
      colorSecundario: Colors.grey.shade300,
      upperDots: false,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/slide-01.svg'),
        SvgPicture.asset('assets/svg/slide-02.svg'),
        SvgPicture.asset('assets/svg/slide-03.svg'),
        SvgPicture.asset('assets/svg/slide-04.svg'),
        SvgPicture.asset('assets/svg/slide-05.svg'),
      ],
    );
  }
}