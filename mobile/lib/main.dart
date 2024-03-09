import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/common/colors.dart';
import 'package:mobile/views/signin_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyMoney());
}

class MyMoney extends StatefulWidget {
  const MyMoney({super.key});

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
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBarTheme: AppBarTheme(
          foregroundColor: green,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: green,
          ),
          iconTheme: const IconThemeData(
            color: green, //change your color here
          ),
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(),
        ),
      ),
      home: const SignInView(),
    );
  }
}
