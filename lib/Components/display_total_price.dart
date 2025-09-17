import 'package:flutter/material.dart';

class DisplayTotalPrice extends StatefulWidget {
  const DisplayTotalPrice({super.key});

  @override
  State<DisplayTotalPrice> createState() => _DisplayTotalPriceState();
}

class _DisplayTotalPriceState extends State<DisplayTotalPrice> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  Text(
                    "Include all prices",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
              Switch(
                inactiveThumbColor: Color(0xFF20B2AA),
                inactiveTrackColor: Color(0xFFF5F5DC),
                value: isSwitch, 
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                }),
            ],
          ),
        ),
      ),
    );
  }
}
