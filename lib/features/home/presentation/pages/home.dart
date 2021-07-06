import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/home/presentation/widgets/card.dart';
import 'package:flutter_base/features/home/presentation/widgets/drawer.dart';
import 'package:flutter_base/features/home/presentation/widgets/form_cards.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: HomeDrawer(),
      body: Scrollbar(
        thickness: 3,
        child: ListView(
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
          children: [
            Text(
              '~~~ Basic ~~~',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            FormCards(
              title: 'Text',
              listCard: [
                CardWidget(
                  title: 'Text',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Button',
              listCard: [
                CardWidget(
                  title: 'Button',
                  router: ROUTER_BUTTON_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Input',
              listCard: [
                CardWidget(
                  title: 'Formfield Base',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Login Formfield',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'OTP Formfield',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Toast',
              listCard: [
                CardWidget(
                  title: 'Toast',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Dialog',
              listCard: [
                CardWidget(
                  title: 'Loading Dialog',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Alarm Dialog',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Confirm Dialog',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Snackbar',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Date time',
              listCard: [
                CardWidget(
                  title: 'Cupetino Date picker',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Date range picker',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Carousel Slider',
              listCard: [
                CardWidget(
                  title: 'Carousel Slider',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'File',
              listCard: [
                CardWidget(
                  title: 'Image',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Video',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'PDF',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Excel',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Download File',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Share File',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Progress',
              listCard: [
                CardWidget(
                  title: 'Progress Base',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                ),
                CardWidget(
                  title: 'Skeleton',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                ),
              ],
            ),
            FormCards(
              title: 'Animation',
              listCard: [
                CardWidget(
                  title: 'Animation Base',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                ),
                CardWidget(
                  title: 'Navigate Page Aniamtion',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                ),
              ],
            ),
            FormCards(
              title: 'Layout',
              listCard: [
                CardWidget(
                  title: 'Base Layout',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Silver Layout',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Home Layout',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Profile Layout',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                ),
              ],
            ),
            FormCards(
              title: 'List',
              listCard: [
                CardWidget(
                  title: 'List',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                ),
              ],
            ),
            FormCards(
              title: 'Launcher',
              listCard: [
                CardWidget(
                  title: 'URL Launcher',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Webview',
              listCard: [
                CardWidget(
                  title: 'Webview',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            Divider(
              height: 30,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Text(
              '~~~ Advance ~~~',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            FormCards(
              title: 'Firebase Notification',
              listCard: [
                CardWidget(
                  title: 'Firebase Notification',
                  router: ROUTER_TEXT_PAGE,
                ),
              ],
            ),
            FormCards(
              title: 'Chart',
              listCard: [
                CardWidget(
                  title: 'Pie Chart',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Line Chart',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'QR Code',
              listCard: [
                CardWidget(
                  title: 'QR Code Scan',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Biometric',
              listCard: [
                CardWidget(
                  title: 'Fingerprint',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Face ID',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Map',
              listCard: [
                CardWidget(
                  title: 'Google Map',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Viettel Map (Internal only)',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Live',
              listCard: [
                CardWidget(
                  title: 'Camera Live',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Camera Map Live (Internal only)',
                  router: ROUTER_TEXT_PAGE,
                ),
                CardWidget(
                  title: 'Video Call',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
            FormCards(
              title: 'Signature',
              listCard: [
                CardWidget(
                  title: 'Signature Pad',
                  router: ROUTER_TEXT_PAGE,
                  cardLast: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
