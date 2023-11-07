import 'package:flutter/material.dart';
Colors getColor(BuildContext context, double percent) {
  if (percent >= 0.50) {
    return Theme.of(context).primaryColor;
  }else if (percent >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}