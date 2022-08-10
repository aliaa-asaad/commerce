import 'dart:ui';

import 'package:flutter/material.dart';

const primaryColor=Color(0xff00c569);
final String? tableCartProduct='cartProduct';
final String? columnName='name';
final String? columnPrice='price';
final String? columnImage='image';
final String? columnQuantity='quantity';
final String? columnProductID='productID';
const CHACHED_USER_DATA='CHACHED_USER_DATA';
const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}