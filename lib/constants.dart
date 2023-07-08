import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

 TextStyle welcomeStyle = const TextStyle(
fontWeight: FontWeight.w500,
fontSize: 50,
color: Colors.black87
);

 TextStyle spaceStyle = TextStyle(
   fontSize: 70,
   color: Colors.purple.shade600,
   fontWeight: FontWeight.w500
 );
TextStyle cowStyle = TextStyle(
    fontSize: 55,
    color: Colors.purple.shade600,
    fontWeight: FontWeight.w300
);

TextStyle clientsStyle = const TextStyle(
 fontSize: 30,
 color: Colors.black54,
);

String currentDay = DateFormat('dd-MM-yyyy').format(DateTime.now());
String currentTime =  DateFormat('hh:mm:ss a').format(DateTime.now());


