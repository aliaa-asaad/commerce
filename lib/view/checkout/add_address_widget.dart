import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children:[ Text(
              "Billing address is the same as delivery address",
              style: TextStyle(fontSize: 20),
            ),]
          ),
        ],
      ),
    );
  }
}