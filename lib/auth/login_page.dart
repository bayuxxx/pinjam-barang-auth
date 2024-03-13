// ignore_for_file: unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sewa_barang/animation/up.dart';
import 'package:sewa_barang/auth/register_page.dart';
import 'package:sewa_barang/auth/tes_berhasil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Email atau Password Anda Salah!'),
        action: SnackBarAction(
          label: 'Tutup',
          onPressed: () {},
        ),
      ));

      print("Error: $e");
    }
  }

  Future<void> _googleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        print("Google Sign-In cancelled or failed.");
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
    }
  }

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(
        email: _emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Email untuk reset password telah dikirim.'),
        action: SnackBarAction(
          label: 'Tutup',
          onPressed: () {},
        ),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
            'Gagal mengirim email reset password. Periksa kembali email Anda.'),
        action: SnackBarAction(
          label: 'Tutup',
          onPressed: () {},
        ),
      ));

      print("Error during password reset: $e");
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const FadeInAnimation(
                    delay: 1,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    )),
                const SizedBox(height: 40),
                FadeInAnimation(
                  delay: 2,
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
                                child: const Icon(Icons.email, color: Colors.white)),
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
                const SizedBox(height: 20),
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
                                child: const Icon(Icons.lock, color: Colors.white)),
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
                const SizedBox(height: 40),
                FadeInAnimation(
                  delay: 4,
                  child: GestureDetector(
                    onTap: _login,
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
                  delay: 4.5,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Or",
                          style: TextStyle(color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 12),
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                FadeInAnimation(
                  delay: 5,
                  child: InkWell(
                    onTap: _googleSignIn,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 56),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Brand(Brands.google),
                          const SizedBox(width: 12),
                          const Text(
                            'Login with Google',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _resetPassword,
                    child: Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: 32),
                FadeInAnimation(
                  delay: 5.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register now!",
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
