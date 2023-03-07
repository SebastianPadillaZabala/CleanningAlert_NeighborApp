import 'package:cleanning_alert_neighbor/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:cleanning_alert_neighbor/authentication/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 5, 125, 113),
              Color.fromARGB(255, 5, 125, 113),
              Colors.black,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/basurero.png",
                height: 200,
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
                width: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 210, 126),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      primary: Color.fromARGB(255, 37, 210, 126),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  child: Text("Ingresar",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Aun no tienes cuenta?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignupScreen()));
                },
                child: Text(
                  "Registrate",
                  style: TextStyle(
                    color: Color.fromARGB(255, 86, 235, 91),
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}