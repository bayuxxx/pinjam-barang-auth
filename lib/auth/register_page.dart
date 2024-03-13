// ignore_for_file: unused_local_variable, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sewa_barang/animation/up.dart';
import 'package:sewa_barang/auth/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Registrasi Gagal. Silakan coba lagi!'),
        action: SnackBarAction(
          label: 'Tutup',
          onPressed: () {},
        ),
      ));

      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff001F3F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeInAnimation(
                  delay: 1,
                  child: Text(
                    "Register account",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                const SizedBox(height: 12),
                const FadeInAnimation(
                  delay: 1.5,
                  child: Text(
                    'Keen on shedding some pounds, boosting\nenergy, or upgrading your eating habits? With\nclear goals, we can hook you up with spot-on recommendations',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xffD9D9D9)),
                  ),
                ),
                const SizedBox(height: 52),
                FadeInAnimation(
                  delay: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff8A8A8A).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          // controller: _emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Container(
                                margin: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12, bottom: 12),
                                padding: const EdgeInsets.only(right: 12),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right:
                                            BorderSide(color: Colors.white))),
                                child: const Icon(Icons.person,
                                    color: Colors.white)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FadeInAnimation(
                  delay: 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff8A8A8A).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Container(
                                margin: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12, bottom: 12),
                                padding: const EdgeInsets.only(right: 12),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right:
                                            BorderSide(color: Colors.white))),
                                child: const Icon(Icons.email,
                                    color: Colors.white)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FadeInAnimation(
                  delay: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff8A8A8A).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _passwordController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Container(
                                margin: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12, bottom: 12),
                                padding: const EdgeInsets.only(right: 12),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right:
                                            BorderSide(color: Colors.white))),
                                child: const Icon(Icons.lock,
                                    color: Colors.white)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 52),
                FadeInAnimation(
                  delay: 3.5,
                  child: InkWell(
                    onTap: _register,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 56),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff7986CB),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                FadeInAnimation(
                  delay: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account,",
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(color: Color(0xff7986CB)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
