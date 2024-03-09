// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/common/colors.dart';

class DashboardAmountWidget extends StatefulWidget {
  DashboardAmountWidget({
    super.key,
    required this.amount,
    required this.iconData,
    required this.label,
    required this.color,
  });

  double amount = 0.0;
  IconData iconData = Icons.trending_up;
  String label = "";
  Color color = green;

  @override
  State<DashboardAmountWidget> createState() => DashboardAmountWidgetState();
}

class DashboardAmountWidgetState extends State<DashboardAmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                widget.iconData,
                color: Colors.white,
              )
            ],
          ),
          Text(
            "R\$${widget.amount.toString()}",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
