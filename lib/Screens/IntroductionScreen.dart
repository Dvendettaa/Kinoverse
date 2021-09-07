import 'package:flutter/material.dart';
import 'package:kinoverse/pallete.dart';
import 'package:introduction_screen/introduction_screen.dart' as intro;

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  static const String id = 'InstructionsScreen';

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  List<intro.PageViewModel> pages = [
    intro.PageViewModel(
      title: "A Global Filmmaker Network For Hire",
      body:
          "Find any professional and agencies for any projects.",
      image: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,50,0,0),
          child: Image.asset("assets/images/img1.jpg"),
        ),
      ),
      decoration: const intro.PageDecoration(
        bodyTextStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 18.0),
      ),
    ),
    intro.PageViewModel(
      title: "Find Interesting Projects And Submit Proposals",
      body:
      "Easy find work, chat, and\ncollaborate on the go.",
      image: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,50,0,0),
          child: Image.asset("assets/images/img2.jpg"),
        ),
      ),
      decoration: const intro.PageDecoration(
        bodyTextStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 18.0),
      ),
    ),
    intro.PageViewModel(
      title: "Collaborate On The Go!",
      body:
      "Chat, share files, and complete\nprojects.",
      image: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,50,0,0),
          child: Image.asset("assets/images/img3.jpg"),
        ),
      ),
      decoration: const intro.PageDecoration(
        bodyTextStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 18.0),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: intro.IntroductionScreen(
        globalBackgroundColor: backGround,
        pages: pages,
        showDoneButton: false,
        showSkipButton: false,
        showNextButton: false,
        controlsPadding: EdgeInsets.all(50),
        dotsDecorator: intro.DotsDecorator(
          color: Colors.white,
          activeColor: mainRed,
        ),
        isTopSafeArea: true,
        globalFooter: Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,20),
          child: Column(
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(mainRed),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    )
                  ),
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(130,8,130,8),
                    child: Text('Login', style: TextStyle(
                      fontSize: 18
                    ),),
                  )),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New to the Kinoverse?', style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15
                  ),),
                  TextButton(
                      onPressed: (){},
                      child: Text('Sign Up',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                      ),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
