import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/feautures/authentication/presentation/pages/login_page.dart';
import '../../../../core/theme/base_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isHidden1 = true;
  bool isHidden2 = true;

  String? _username;
  String? _password1;
  String? _password2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _username = value;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _username = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Insert Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden1 = !isHidden1;
                            });
                          },
                          child: isHidden1
                              ? LineIcon(LineIcons.lowVision)
                              : LineIcon(LineIcons.eye),
                        ),
                      ),
                      obscureText: isHidden1,
                      onChanged: (String? value) {
                        setState(() {
                          _password1 = value;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _password1 = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden2 = !isHidden2;
                            });
                          },
                          child: isHidden2
                              ? LineIcon(LineIcons.lowVision)
                              : LineIcon(LineIcons.eye),
                        ),
                      ),
                      obscureText: isHidden2,
                      onChanged: (String? value) {
                        setState(() {
                          _password2 = value;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _password2 = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate() && (_password1 == _password2)) {

                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: BaseColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                )
                              },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: BaseColors.charcoal,
    );
  }
}
