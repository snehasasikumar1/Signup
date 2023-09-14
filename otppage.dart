import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


class otppage extends StatefulWidget {
  const otppage({super.key});

  @override
  State<otppage> createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
              ),
              Text('OTP Verification',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(
                height: 8,
              ),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Please enter the OTP verification code \n that we sent to your phone number',style: TextStyle(fontSize: 15,color: Colors.black54)
                  )
                ]
              )
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Pinput(
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: PinTheme(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text("Didn't receive SMS?",style: TextStyle(fontSize: 13,color: Colors.black45),),
                  TextButton(
                      onPressed: () {
                      }, child: Text('Resend Code?',style: TextStyle(fontSize: 13,color: Colors.blue,decoration:TextDecoration.underline ),))
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 250,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white60,
                  ),
                  onPressed: () {},
                  child: const Text('VERIFY',style: TextStyle(fontSize: 18,color: Colors.indigo),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
