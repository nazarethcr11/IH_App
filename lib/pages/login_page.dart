import 'package:flutter/material.dart';
import 'package:inclusive_hue/components/my_button.dart';
import 'package:inclusive_hue/components/my_textfield.dart';
import 'package:inclusive_hue/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image logo
            Image.asset(
              'lib/images/logotype/logo.png',
              width: 120,
            ),
            const SizedBox(height: 20),
            Text(
              'Bienvenido a Inclusive Hue',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Ingresa a tu cuenta para  acceder a nuestras herramientas',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              icon: Icons.email,
              obscureText: false,
            ),
            SizedBox(height: 20),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 20),
            MyButton(
                onTap: () {

                },
                text: 'LOGIN',
            ),
            //no tienes cuenta? Registrate
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿No tienes cuenta?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    ' Registrate',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}
