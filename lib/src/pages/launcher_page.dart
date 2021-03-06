import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/routes/routes.dart';


class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Phone'),
        backgroundColor: appTheme.accentColor,
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones()
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
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