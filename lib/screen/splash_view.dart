import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
              child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Shorty',
                style: GoogleFonts.raleway(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 57, 57, 58)),
              ),
              SvgPicture.asset("assets/images/illustration.svg"),
              Text(
                "Let's get started!",
                style: GoogleFonts.raleway(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 57, 57, 58)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Paste yout first link into \n the field to Shorten it",
                style: GoogleFonts.raleway(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 27,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 57, 57, 58)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                    onPressed: () => Navigator.pushNamed(context, "/intro"),
                    child: const Text("Start")),
              )
            ]),
      ))),
    );
  }
}
