
import 'package:creative_motion_app/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAppShow extends StatelessWidget{

  final MaterialColor _colour;
  final String _imagePath, _title, _languages, _comment;
  final List<NavigationButton> _buttons;
  final bool _phone;

  PhoneAppShow(this._imagePath, this._title, this._comment, this._colour, this._languages, this._buttons, this._phone);

  @override
  Widget build(BuildContext context) {
    double padding;
    if(_phone){
      padding = 25;
    }else{
      padding = 75;
    }

    return Container(
      padding: EdgeInsets.fromLTRB(padding, 50, padding, 50),
      height: MediaQuery.of(context).copyWith().size.height,
      color: _colour,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            _title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35
                            ),
                          )),
                    ),
                    flex: 1),
                SizedBox(width: 20),
                Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            _comment,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35),
                          )),
                    ),
                    flex: 1)
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Image.asset(_imagePath),
            flex: 8,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    //child: FittedBox(
                      //  fit: BoxFit.fitWidth,
                        child: Row(
                          children: _buttons,
                        ), // )
                    flex: 1),
                Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Bla"),
                    ),
                    flex: 1)
              ],
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }


}