import 'package:flutter/material.dart';
import 'package:signup/phoneno.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  String? selectedOption;
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
          children:[ Positioned(
            top: 10,
            right: 157,
            child: Text('Home',style: TextStyle(fontSize: 15,color:Colors.blueGrey),),
          ),
            Positioned(
              top: 10,
              right: 86,
              child: Text('Services',style: TextStyle(fontSize: 15,color:Colors.blueGrey),),
            ),
            Positioned(
              top: 10,
              right: 30,
              child: Text('About',style: TextStyle(fontSize: 15,color:Colors.blueGrey),),
            ),
            Positioned(
                top: 100,
                left: 190,
                child: Text('SignUp',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black87))),
            Positioned(
              top: 145,
              left: 160,
              child: Row(
                children: [
                  Text('Have an account?',style: TextStyle(fontSize: 13,color: Colors.black45),),
                  TextButton(
                      onPressed: () {
                      }, child: Text('|Login?',style: TextStyle(fontSize: 13,color: Colors.blue),))
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: 70,
              child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 160,
                          height: 35,
                          color: Colors.white38,
                          child: TextField(
                            controller: txt1,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'First Name',
                                  icon: Icon(Icons.person_pin)
                                ),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 166,
                                height: 35,
                                color: Colors.white38,
                                child: TextField(
                                  controller: txt2,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Last Name',
                                      icon: Icon(Icons.person_pin)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 340,
                        height: 35,
                        color: Colors.white38,
                        child: TextField(
                          controller: txt3,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email Address',
                              icon: Icon(Icons.email_outlined)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 340,
                        height: 35,
                        color: Colors.white38,
                        child: TextField(
                          controller: txt4,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Create Password',
                              suffixIcon: new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText=!_obscureText;
                                  });
                                },
                                child: new Icon(Icons.visibility),
                              )
                              // icon: Icon(Icons.password_rounded)
                          ),
                          obscureText: _obscureText,
                          obscuringCharacter: '*',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 340,
                        height: 35,
                        color: Colors.white38,
                        child: TextField(
                          controller: txt5,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                              suffixIcon: new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText=!_obscureText;
                                  });
                                },
                                child: new Icon(Icons.visibility),
                              )
                              // icon: Icon(Icons.lock)
                          ),
                          obscureText: _obscureText,
                          obscuringCharacter: '*',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Positioned(
            //   bottom: 190,
            //   left: 55,
            //   child: Row(
            //     children: [
            //       Container(
            //         width: 245,
            //         height: 38,
            //         child: RadioListTile<String>(
            //           title: Text('Remebering me', style: TextStyle(fontSize: 15),),
            //           value: 'Option 1',
            //           groupValue:selectedOption, onChanged: (value) {
            //           setState(() {
            //             selectedOption = value;
            //           });
            //         },
            //         ),
            //       ),
            //       Text('Forget Password?',style: TextStyle(fontSize:14 ),)
            //     ],
            //   ),
            // ),
            Positioned(
              top: 435,
              left: 170,
              child: Container(
                width: 140,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: const Text('SIGNUP'),
                ),
              ),
            ),
            Positioned(
                top: 486,
                left: 170,
                child: Text('----------------OR----------------',style: TextStyle(fontSize: 12,color: Colors.black87),)),
            Positioned(
              top: 510,
              left: 105,
              child: Container(
                width: 270,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5,color: Colors.black87)
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.only(left: 13),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(fit: BoxFit.fill,
                            image: AssetImage('assets/google.jpg')),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                     Padding(
                      padding:  EdgeInsets.all(5),
                      child: Text('    SignUp with Google',style: TextStyle(fontSize: 16,color: Colors.black),),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 550,
              left: 105,
              child: Container(
                width: 270,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 0.5,color: Colors.black87)
                ),
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      height: 30,
                      margin: EdgeInsets.only(left: 6),
                      child: Icon(Icons.phone,),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(5),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => phoneno()),
                          );
                        },
                        child: Text('SignUp with PhoneNumber',style: TextStyle(fontSize: 16,color: Colors.black)),),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 109,
              child: Text('    Privacy Policy    *    Terms & Conditions',style: TextStyle(fontSize:13,fontWeight:FontWeight.bold,color: Colors.black87),),
          )
        ]
        ),
      ),
    );
  }
}
