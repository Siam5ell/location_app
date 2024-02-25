import "package:flutter/material.dart";
import "package:location_app/constants/formdec.dart";
import "package:location_app/services/auth.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = "";
  String password = "";
  String error = "";
  final _formkey = GlobalKey<FormState>();
  final auth = Authenticate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                onChanged: (value) => setState(() {
                  email = value;
                }),
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
                    ? "Password must be atleast 6 characters long"
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: "Confirm Password"),
                obscureText: true,
                validator: (value) => value != password
                    ? "Confirm password not matching password"
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      if (_formkey.currentState!.validate()) {
                        await auth.registerwithemailandpassword(
                            email, password);
                      }
                    } catch (e) {
                      setState(() {
                        error = e.toString();
                      });
                    }
                  },
                  child: const Text("Register")),
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
