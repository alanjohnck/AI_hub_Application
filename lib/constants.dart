import 'package:flutter/material.dart';

const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(20.0));

const kInputboxdecoration = BoxDecoration(boxShadow: [
  BoxShadow(
    color: Colors.white,
    spreadRadius:4,
    blurRadius: 4,
    offset: Offset(0, 3),
  ),
], borderRadius: kBorderRadius, color: Colors.white);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const ktextdefault=TextStyle(
color: Color(0xFF17A0B2),
decoration: TextDecoration.none,
fontSize: 20.0,
);

