// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

final f = DateFormat('dd/MM/yyyy hh:mm');

String formatDate(DateTime date) {
  return f.format(date);
}
