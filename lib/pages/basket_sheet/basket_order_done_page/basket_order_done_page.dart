import 'package:appinio_bloc/pages/basket_sheet/widgets/basket_sheet_content_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class BasketOrderDonePage extends StatelessWidget {
  const BasketOrderDonePage({super.key});

  void onNext(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();

  @override
  Widget build(BuildContext context) {
    return BasketSheetContentDecoration(
      child: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thank you for your order!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "It's on the way",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CupertinoButton(
            child: Text('Nothing to do while waiting?'),
            onPressed: () => launchUrl(
              Uri.parse('https://tetris.com/play-tetris'),
            ), // todo: refactor
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                child: const Text('Done'),
                onPressed: () => onNext(context),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
