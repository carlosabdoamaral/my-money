import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/common/colors.dart';
import 'package:mobile/common/snackbar.dart';
import 'package:mobile/http/app_dio.dart';
import 'package:mobile/views/dashboard_view.dart';
import 'package:mobile/widgets/loading_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isLoading = false;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool doValidation() {
      String fullname = fullnameController.value.text.trim();
      String email = emailController.value.text.trim();
      String password = passwordController.value.text.trim();
      String confirmPassword = confirmPasswordController.value.text.trim();

      if (fullname.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        showSnackBar(
          context: context,
          label: "Todos os campos devem ser preenchidos.",
        );
        return false;
      }

      // E-MAIL
      if (!email.contains("@") || !email.contains(".")) {
        showSnackBar(
          context: context,
          label: "O email parece estar inválido.",
        );
        return false;
      }

      // SENHA
      // TODO: Verificar se deve ser validado algo

      // CONFIRMAR SENHA
      if (password != confirmPassword) {
        showSnackBar(
          context: context,
          label: "As senhas não conferem.",
        );
        return false;
      }

      return true;
    }

    Future<void> signUp() async {
      var formIsValid = doValidation();
      if (!formIsValid) {
        return;
      }

      setState(() {
        isLoading = true;
      });

      try {
        var dio = await AppDio.getConnection();
        Response response = await dio.post('${AppDio.url}/user/create');
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
      appBar: AppBar(
        foregroundColor: green,
        iconTheme: const IconThemeData(
          color: green,
        ),
      ),
      body: SafeArea(
        child: Stack(children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cadastro",
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
                    controller: fullnameController,
                    decoration: const InputDecoration(
                      hintText: 'Nome completo',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
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
                  TextField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      hintText: 'Confirme a senha',
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      signUp();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Cadastrar',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading) const Center(child: LoadingWidget()),
        ]),
      ),
    );
  }
}
