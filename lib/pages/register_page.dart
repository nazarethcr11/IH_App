import 'package:flutter/material.dart';
import 'package:inclusive_hue/components/my_button.dart';
import 'package:inclusive_hue/components/my_textfield.dart';
import 'package:inclusive_hue/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image logo
            Image.asset(
              'lib/images/logotype/logo.png',
              width: 120,
            ),
            const SizedBox(height: 10),
            Text(
              'Inclusive Hue',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.lightBlue.shade900,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Regístrate para acceder a nuestras herramientas',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            //email textfield
            MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                icon: Icons.email
            ),
            const SizedBox(height: 20),
            //password textfield
            MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                icon: Icons.lock
            ),
            const SizedBox(height: 20),
            //confirm password textfield
            MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                icon: Icons.lock
            ),
            const SizedBox(height: 20),
            //register button
            MyButton(
                onTap: () { },
                text: 'Register'
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Ya tienes una cuenta?',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    ' Inicia sesión',
                    style: TextStyle(
                      color: Colors.lightBlue.shade900,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
