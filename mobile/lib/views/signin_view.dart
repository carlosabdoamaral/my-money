import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/common/colors.dart';
import 'package:mobile/common/snackbar.dart';
import 'package:mobile/http/app_dio.dart';
import 'package:mobile/views/dashboard_view.dart';
import 'package:mobile/views/signup_view.dart';
import 'package:mobile/widgets/loading_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    bool doValidation() {
      String email = emailController.value.text.trim();
      String password = passwordController.value.text.trim();

      if (email.isEmpty || password.isEmpty) {
        showSnackBar(
            context: context, label: "Todos os campos devem ser preenchidos.");
        return false;
      }

      // Valida e-mail
      if (!email.contains("@") || !email.contains(".")) {
        showSnackBar(context: context, label: "O email parece estar inválido.");
        return false;
      }

      // Valida senha
      // TODO: Verificar se deve ser validado algo

      return true;
    }

    Future<void> signIn() async {
      var formIsValid = doValidation();
      if (!formIsValid) {
        return;
      }

      setState(() {
        isLoading = true;
      });

      try {
        var dio = await AppDio.getConnection();
        Response response = await dio.post('${AppDio.url}/auth/login');
        print(response.data);

        // TODO: Fazer validações reais da response
        if (response.statusCode != 401) {}
      } catch (e) {
        print('Error fetching data: $e');
        showSnackBar(context: context, label: 'Erro interno no sistema');
      }

      setState(() {
        isLoading = false;
      });

      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => const DashboardView(),
      //   ),
      // );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: green,
                      ),
                    ),
                    Text(
                      "MyMoney",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: green,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Login',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        signIn();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpView(),
                              ),
                            );
                          },
                          child: Center(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_box,
                                  color: green,
                                ),
                                Text(
                                  'Criar conta no ',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "MyMoney",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            if (isLoading) const Center(child: LoadingWidget()),
          ],
        ),
      ),
    );
  }
}
