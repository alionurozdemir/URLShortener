import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_url_shortener/screen/into/intro_page.dart';

class IntroPageHome extends ConsumerWidget {
  const IntroPageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController _controller1 = PageController();

    //int pageIndex = 0;

    kontrol(int value) {
      print("Şuanda $value sayfadasınız.");
      value == 2 ? Navigator.pushNamed(context, '/home') : null;
    }

    // DotsIndicator(int value) {}

    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          kontrol(value);
          // pageIndex = value;
        },
        controller: _controller1,
        children: [
          IntroPage(
            data: IntroPageModel(
                title: 'Brand Recognition',
                description:
                    "Boss your brand recognition with each\n click generic licks dont eman a thing\nbranded links help instil confidence\n in your content"),
          ),
          IntroPage(
            data: IntroPageModel(
                title: 'Detailed Records',
                description:
                    "Gain insights into who is clicking you links. Knowing when and where people engage with your content helps inform better decisions."),
          ),
          IntroPage(
            data: IntroPageModel(
                title: 'Full Customizable',
                description:
                    "Improve brand awareness and content discoverability through customizable links, supercharging audience engagement"),
          ),
        ],
      ),
    );
  }
}
