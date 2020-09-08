import 'package:flutter/material.dart';

const kButtonTextStyle = TextStyle(fontSize: 30.0, fontFamily: 'SpartanMB');

const kTempTextStyle = TextStyle(fontSize: 100.0, fontFamily: 'SpartanMB');

const kMessageTextStyle = TextStyle(fontSize: 60.0, fontFamily: 'SpartanMB');

const kConditionTextStyle = TextStyle(fontSize: 100.0, fontFamily: 'SpartanMB');

InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'City Name ..',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  ),
);
