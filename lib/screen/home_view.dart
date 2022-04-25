import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_url_shortener/services/api/url_shortener_state.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchUrlProvider = ref.watch<UrlShortState>(urlProvider);
    //final readUrlProvider = ref.read<UrlShortState>(urlProvider);

    //var mesaj = ref.watch(urlProvider).shortUrlMessage;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(),
      body: Column(children: [
        // GestureDetector(
        //     onTap: () => Clipboard.setData(ClipboardData(text: mesaj)), child: Text(mesaj)),

        // INPUT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: watchUrlProvider.urlController,
            decoration: const InputDecoration(
              hintText: 'Hint Text',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ElevatedButton(
            onPressed: () async {
              watchUrlProvider.handleGetLinkButton();
            },
            child: const Text("SHORTTEN IT!"),
            style: ElevatedButton.styleFrom(
                textStyle: (Theme.of(context).copyWith().textTheme.headline6),
                primary: const Color.fromRGBO(43, 207, 206, 1),
                minimumSize: const Size.fromHeight(50)),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
              itemCount: watchUrlProvider.kisaltilmisUrl.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white,
                        height: 200,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    watchUrlProvider.kisaltilacakUrl[index],
                                    style: Theme.of(context).copyWith().textTheme.headline5,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        watchUrlProvider.deleteHistoryUrl(index);
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            ),
                            const Divider(
                              height: 10,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                watchUrlProvider.kisaltilmisUrl[index],
                                style: Theme.of(context).copyWith().textTheme.headline5,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: ElevatedButton(
                                onPressed: () async {
                                  ref.watch(buttonProvider.notifier).butonaTiklandi();
                                  // ignore: avoid_print
                                  print(ref.watch(buttonProvider.notifier).butonaTiklandi());

                                  Clipboard.setData(
                                      ClipboardData(text: watchUrlProvider.kisaltilmisUrl[index]));
                                },
                                child: const Text("COPY"),
                                style: ElevatedButton.styleFrom(
                                    textStyle: (Theme.of(context).copyWith().textTheme.headline6),
                                    primary: const Color.fromRGBO(43, 207, 206, 1),
                                    minimumSize: const Size.fromHeight(50)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        ),
      ]),
    );
  }
}
