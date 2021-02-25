import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationButton extends StatelessWidget{

  final MaterialColor _colour;
  final String _url, _text, _icon;
  final bool _external;

  NavigationButton(this._text, this._icon, this._colour, this._url,  this._external);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlineButton.icon(
          onPressed: () => _launchURL(context, _url),
          icon: Image.asset(_icon),
          label: Text(_text, style: TextStyle(color: Colors.white),),
          borderSide: BorderSide(color: Colors.white, width: 1),),
    );
  }

  void _launchURL(BuildContext context, String url) async {
    if(_external){
      if (await canLaunch(url)) {
        await launch(url);
      }
    }else{
      Navigator.pushReplacementNamed(context, _url);
    }
  }
}

class NavigationIcon extends NavigationButton{
  NavigationIcon(String text, String icon, MaterialColor colour, String url, bool external) : super(text, icon, colour, url, external);

  @override
  Widget build(BuildContext buildContext){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Image.asset(_icon),
        tooltip: _text,
        highlightColor: Colors.white,
        onPressed: () {
          _launchURL(buildContext, _url);
        },
      ),
    );
  }

}