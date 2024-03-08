
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

String formatAmountValue(double amount) {
  var f = NumberFormat.currency(
    locale: "pt_BR",
    symbol: "R\$",
  );
  return f.format(amount);
}