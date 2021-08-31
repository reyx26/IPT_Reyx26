import 'package:auntie_rafiki/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Form(
                key: form,
                child: Column(
                  children: [
                    Container(
                      child: Image.asset('assets/images/dit.png'),
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Email Address',
                        //fillColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                        if (value.length < 8) {
                          return "Password should be atleast 8 characters";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: changeVisibility,
                            child: isVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.remove_red_eye)),
                        filled: true,
                        hintText: 'Password',
                        //fillColor: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(children: [
                      Expanded(
                        flex: 20,
                        child: ElevatedButton(
                            onPressed: () {
                              if (form.currentState!.validate()) {
                                print(emailController.text);
                                print(passwordController.text);

                                if (!EmailValidator.validate(
                                    emailController.text)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Invalid Email Address')));
                                  return;
                                }
                                authProvider
                                    .login(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  if (value) {
                                    Navigator.of(context).pushNamed('home_page');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Invalid Credentials')));
                                  }
                                });
                              }
                            },
                            child: Text('Login')),
                      ),
                    ]),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Forgot Password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('registration_page');
                                },
                                child: Text('Create an Account')))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
