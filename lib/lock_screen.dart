import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location_mobile/screens/auth/login.dart';
import 'package:location_mobile/screens/home/home_screen.dart';
import 'package:location_mobile/themes/app_theme.dart';

class LoockScreen extends StatefulWidget {
  LoockScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoockScreenState createState() => _LoockScreenState();
}

class _LoockScreenState extends State<LoockScreen> {
  Widget _submitButton() {
    return GestureDetector(
      onTap: () => Get.off(() => HomeScreen()),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppThemes.backgroundColorDark,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient:  LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF1E355F),
                  Color(0xFF1E355F).withOpacity(0.6),
                ]
            )
        ),
        child: const Text(
          'Votre mot de passe',
          style: TextStyle(fontSize: 20, color: Color(0xFFFBCF84)),
        ),
      ),
    );
  }


  Widget _label() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 20),
        child: const Column(
          children: <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Color(0xFF1E355F), fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 98, color: Color(0xFF1E355F),),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Securite',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E355F),
          ),
          children: const [
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xfffbb448),

                    Color(0xFFDDB26A),
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),

              const SizedBox(
                height: 100,
              ),
              _label(),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 200,
              ),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }
}