import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/views/DashboardView.dart';
import 'package:mobile/views/LoginView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyMoney());
}

class MyMoney extends StatefulWidget {
  const MyMoney({Key? key}) : super(key: key);

  @override
  State<MyMoney> createState() => _MyMoneyState();
}

class _MyMoneyState extends State<MyMoney> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMoney',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.green,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(),
        ),
      ),
      home: const LoginView(),
    );
  }
}
