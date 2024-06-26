import 'package:flutter/material.dart';

const baseUrl ="https://accurate-oriole-natural.ngrok-free.app/dr_cancer";



////////////////validation///////////////////////////////////////////////////////
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  // Add more validation rules for names (if needed)
  return null;
}
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  // Add more validation rules as needed
  return null;
}
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  return null;
}
////////////////////////////////////Colors//////////////////////////////////////

const blueColor = Color(0xff2A9DF4);
const primaryColor = Color(0xff2B83C6);

const textColor = Color(0xff073673);
const textColor2 = Color(0xff1168A9);
