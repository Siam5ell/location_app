import "package:flutter/material.dart";
import "package:location_app/constants/formdec.dart";
import "package:location_app/services/auth.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  String error = "";
  final _formkey = GlobalKey<FormState>();
  final auth = Authenticate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
              icon: const Icon(Icons.person),
              label: const Text("Register"))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                onChanged: (value) => setState(() {
                  email = value;
                }),
                validator: (value) =>
                    value!.isEmpty ? "Enter a valid email." : null,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) => value!.length < 6
                    ? "Password must have atleast 6 characters."
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      try {
                        await auth.signinwithemailandpassword(email, password);
                      } catch (e) {
                        setState(() {
                          error = e.toString();
                        });
                      }
                    }
                  },
                  child: const Text("Login")),
              const SizedBox(
                height: 20,
              ),
              Text(error)
            ],
          ),
        ),
      ),
    );
  }
}
