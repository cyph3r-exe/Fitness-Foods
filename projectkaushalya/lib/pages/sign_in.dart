import 'package:flutter/material.dart';
import 'package:projectkaushalya/pages/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(148, 216, 211,100),
          Color.fromARGB(156, 0, 255, 238),
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }
  Widget _page() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          const SizedBox(height: 50),
          _inputField("Username", usernameController),
          const SizedBox(height: 20),
          _inputField("Password", passwordController, isPassword: true),
          const SizedBox(height: 30),
          _loginBtn(),
        ],
      ),
    ),
  );
}

  Widget _icon() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white, width: 2),
      shape: BoxShape.circle,
    ),
    child: const Icon(Icons.person, color: Colors.white, size: 120,),
  );

  }

  Widget _inputField(String hintText, TextEditingController controller, {isPassword = false}) {

    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white)
    );

    return TextField(
      style:  const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(onPressed: () {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const HomePage())
      );
    }, 
    child: SizedBox(
      width: double.infinity,
      child: const Text("Sign In",
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
      ),
      )
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: Color.fromARGB(255, 161, 255, 249),
        onPrimary: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      );
  }
}

