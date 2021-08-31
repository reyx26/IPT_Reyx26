import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Create New Account'), leading: Icon(Icons.create)),
      body: SingleChildScrollView(
          child: Form(
              child: Column(
        children: [
          Container(
            child: Center(
                child: CircleAvatar(
                    child: Image.asset('assets/images/dit.png',
                        width: 70, height: 70))),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              hintText: 'First Name',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Second Name',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Sur Name',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Email Address',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Phone Number',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Confirm Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Register')))
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an Account?',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                      ..onTap=(){
                        Navigator.of(context).pushNamed('login_page');
                      }
                    )
                  ]
                  ),  
                  )
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
