import 'package:disenos_app/src/models/layout_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/routes/routes.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        backgroundColor: appTheme.currentTheme.accentColor,
      ),
      drawer: _MenuPrincipal(),
      // body: _ListaOpciones()

      body: Row(
        children: <Widget>[
          Container(
            width: 300.0,
            height: double.infinity,
            child: _ListaOpciones(),
          ),

          Container(
            width: 1,
            height: double.infinity,
            color: (appTheme.darkTheme) ? Colors.grey : appTheme.currentTheme.accentColor,
          ),
          
          Expanded( //Expanded used because it's all the space left in the screen
            child: layoutModel.currentPage
          ) 
        ],
      )

   );
  }
}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ), 
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor,),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor,),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[i].page;

        },
      ), 
    );
  }
}


class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final appTheme = Provider.of<ThemeChanger>(context);
    final themeAccentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[

            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: themeAccentColor,
                  child: Text('OA', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            Expanded(
              child: _ListaOpciones()
            ),

            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: themeAccentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive( //Adapts to android and IOS design
                value: appTheme.darkTheme, 
                activeColor: themeAccentColor,
                onChanged: (value) => appTheme.darkTheme = value
              ),
            ),

            SafeArea(
              bottom: true,
              left: false,
              top: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen_outlined, color: themeAccentColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive( //Adapts to android and IOS design
                  value: appTheme.customTheme, 
                  activeColor: themeAccentColor,
                  onChanged: (value) => appTheme.customTheme = value
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}