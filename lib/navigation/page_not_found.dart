import 'package:creative_motion_app/resources/strings.dart';
import 'package:flutter/material.dart';


/// [UnknownPage] is shown, if the URL is incorrect
class UnknownPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(child: Text(Strings.page_not_found),),
  );
}