import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  bool _obscureText=true;

  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*2,
    decoration: BoxDecoration(
    image: DecorationImage(fit: BoxFit.fill,
    image: AssetImage('assets/bkg.jpg')),
    ),
          child: Stack(
            children: [
              Positioned(
                  top: 100,
                  left: 190,
                  child: Text('SignIn',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black87))
              ),
              Positioned(
                top: 205,
                left: 80,
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 40,
                      color: Colors.white38,
                      child: TextField(
                        controller: txt1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' User Name',
                          icon: Icon(Icons.person_pin)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        width: 300,
                        height: 35,
                        color: Colors.white38,
                        child: TextField(
                          controller: txt2,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              icon: Icon(Icons.key),
                              suffixIcon: new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText=!_obscureText;
                                  }
                                  );
                                },
                                child: new Icon(Icons.visibility),
                              )
                          ),
                          obscureText: _obscureText,
                          obscuringCharacter: '*',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 297,
                  left: 280,
                  child:TextButton(
                    onPressed: () {
                    },
                    child: Text('Forgot Password?',style: TextStyle(fontSize: 12,color: Colors.blue),),
                  )
              ),
              Positioned(
                top: 390,
                left: 150,
                child: Container(
                  width: 160,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('SIGN IN',style: TextStyle(fontSize: 16),),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
