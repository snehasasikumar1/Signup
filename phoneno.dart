import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup/otppage.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class phoneno extends StatefulWidget {
  const phoneno({super.key});

  @override
  State<phoneno> createState() => _phonenoState();
}

class _phonenoState extends State<phoneno> {
  TextEditingController txt1 = TextEditingController();
  final formkey = GlobalKey<FormState>();

  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 900,
          decoration: BoxDecoration(
      image: DecorationImage(fit: BoxFit.fill,
          image: AssetImage('assets/bkg.jpg')),
    ),
        child: Stack(
          children: [
            Positioned(
                top: 100,
                left: 80,
                child: Text('Enter Your Phone Number:',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)
            ),
            Positioned(
              top: 150,
              left: 25,
              child: Container(
                width: 700,
                height: 80,
                child: Text('Tap "CONTINUE" to get an SMS confirmation. We will \n send you the 4 digit verification code.',style: TextStyle(fontSize:17,color: Colors.black87),),
              ),
            ),
            Positioned(
              top: 215,
              left: 110,
              child: Container(
                width: 500,
                height: 65,
                color: Colors.white38,
                child: Row(
                      children: [
                        Text('+91',style: TextStyle(fontSize: 19,color: Colors.black,decoration: TextDecoration.underline),),
                        IconButton(
                            onPressed: () {
                            },
                            icon:Icon(Icons.arrow_drop_down_outlined)),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                            width: 200,
                            height: 60,
                            color: Colors.white38,
                            child:   TextFormField(
                              controller: txt1,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'please enter your Phone Number';
                                }
                                return null;
                              },
                              decoration: new InputDecoration(labelText: 'Enter your phone number'),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10)
                              ],
                              // decoration: InputDecoration(
                              //   border: InputBorder.none,
                              //   labelText: 'Phone Number',
                              //   labelStyle: TextStyle(color: Colors.black),
                              //   hintText: 'Enter your Phone Number',
                              //   hintStyle: TextStyle(color: Colors.black45)
                              // ),
                            ),
                        ),
                      ],
                    ),
              ),
            ),
            Positioned(
              top: 300,
              left: 110,
              child: Container(
                width: 250,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    if(txt1.text.isEmpty){

                    }else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => otppage()),
                      );
                    }
                    if(formkey.currentState!.validate()) {
                      final snackBar=const SnackBar(content: Text('Informations are Validated'),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter your Phone Number')),

                      );
                    }
                  },
                  child: const Text('CONTINUE',style: TextStyle(fontSize: 18,color: Colors.indigo,decoration: TextDecoration.underline),),
                ),
              ),
            ),
              ],

            )
        )
    );
  }
}
