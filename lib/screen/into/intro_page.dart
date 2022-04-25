import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key, required this.data}) : super(key: key);

  final IntroPageModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Shortly',
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 38),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              color: Colors.white,
              height: 210,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    top: -50,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                        minRadius: 50.0,
                        child: Icon(
                          Icons.home,
                          size: 50,
                        )),
                  ),
                  Positioned.fill(
                    top: -60,
                    child: Center(
                      child: Text(data.title,
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 29)),
                    ),
                  ),
                  Positioned.fill(
                    top: 90,
                    child: Center(
                      child: Text(data.description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Colors.black87,
                              )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/home'),
            child: Text(
              'Skip',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w300, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroPageModel {
  final String title;
  final String description;
  IntroPageModel({
    required this.title,
    required this.description,
  });
}
