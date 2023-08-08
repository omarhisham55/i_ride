import 'package:flutter/material.dart';

void popBack(context) => Navigator.pop(context);
void pushPage(context, page) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
void replacePage(context, page) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );

bool isNumeric(String str) {
  try{
    // ignore: unused_local_variable
    var value = double.parse(str);
    return true;
  } on FormatException {
    return false;
  }
}

List<String> boardTitles = [
  "Order your Riide",
  "Request Ride",
  "Confirm Your Driver",
  "Track your ride",
  "Your're good to go",
];
List<String> boardBody = [
  "Please login to book your Ride taxi or courier service.",
  "Request a ride, get picked up by a nearby community driver",
  "Huge drivers network helps you find comfortable, safe and cheap",
  "Know your driver in advance and be able to view current location in real time on the map",
  "You are now one of our validated partner couriers. Expect your uniform delivery soon.",
];
