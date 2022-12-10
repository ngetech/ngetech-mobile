import 'dart:convert' as convert;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/feautures/authentication/data/models/user.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';
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
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: LineIcon(
                LineIcons.times,
              ),
            ),
          )
        ],
        leading: Container(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/ngetech_text_logo.png',
                        scale: 2,
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
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
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Username can not be empty!';
                          }
                          return null;
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
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please insert a valid password!';
                          }
                          return null;
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
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please insert a valid password!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_key.currentState!.validate() &&
                                (_password1 == _password2)) {
                              final User user = User(
                                username: _username,
                                password: _password1,
                              );
                              final response = await request.postJson(
                                EndPoints.register,
                                convert.jsonEncode(user.toJson()),
                              );
                              if (response['status']) {
                                if (!mounted) return;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    'Success to register',
                                    style: TextStyle(
                                      color: BaseColors.white,
                                    ),
                                  ),
                                  backgroundColor: BaseColors.blue,
                                ));
                                Future.delayed(
                                  const Duration(seconds: 4),
                                  () => Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  ),
                                );
                              } else {
                                if (!mounted) return;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    response['message'],
                                    style: const TextStyle(
                                      color: BaseColors.white,
                                    ),
                                  ),
                                  backgroundColor: BaseColors.warning,
                                ));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  'Insert a valid username and password',
                                  style: TextStyle(
                                    color: BaseColors.white,
                                  ),
                                ),
                                backgroundColor: BaseColors.warning,
                              ));
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),
                    ],
                  ),
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
                                Navigator.pop(
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
