import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  State<DashboardAmountWidget> createState() => Dashboard_AmountWidgetState();
}

class Dashboard_AmountWidgetState extends State<DashboardAmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
