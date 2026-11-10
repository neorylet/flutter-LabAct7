import 'package:flutter/material.dart';
import 'package:tubera_task7_social_media/socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errorMessage;
  late bool isError;
  @override
  void initState() {
    super.initState();
    errorMessage = "This is an Error Message";
    isError = false;
  }

  @override
  void dispose() {
    super.dispose();
  }
  

  // ignore: strict_top_level_inference
  void checkLogin (username, password){
    setState(() {
      if (username =="") {
        errorMessage = "Please input your username";
        isError = true;
      } else if (password == "") {
        errorMessage = "Please input your password";
        isError = true; 
      } else if (username != "tubera123@gmail.com" || password != "qwerty134567") {
        errorMessage = "Invalid email or password";
        isError = true;
      }else{
        errorMessage = "";
        isError = false;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin:const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/tiktok-logo-png-download-116616376145yvg1mox2s.png",
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 12),
                  Text("TIKTOK", style: txtstyle,)
                ],
              ),
              SizedBox(height: 15),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),    
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                  prefixIcon: Icon(Icons.password),    
                ),
              ),
              SizedBox(height: 15),
              if (isError)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(errorMessage, style: errortertxtstyle),
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  checkLogin(usernameController.text, passwordController.text);
                  if (!isError) {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Socialmedia()),
                    ); 
                  }
                },
                child: Text("LOGIN", style: txtstyle2),
              ),
              SizedBox(height: 15),
            ],
          )
        )
      )
    );
  }
}



var txtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

var registertxtstyle = const TextStyle(
   fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,

);

var errortertxtstyle = const TextStyle(
   fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
  color: Colors.red,
);

var txtstyle2 = const TextStyle(
   fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
  color: Colors.white,    
);