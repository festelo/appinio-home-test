import 'package:appinio_bloc/pages/basket_sheet/basket_address_page/basket_address_cubit.dart';
import 'package:appinio_bloc/pages/basket_sheet/widgets/basket_sheet_content_decoration.dart';
import 'package:appinio_bloc/pages/basket_sheet/widgets/basket_sheet_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketAddressPage extends StatelessWidget {
  const BasketAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = context.select(
      (BasketAddressCubit cubit) => cubit.state.totalPrice,
    );

    final titleTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
    );

    return BasketSheetContentDecoration(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                TextPadding(
                  child: Text(
                    'City',
                    style: titleTextStyle,
                  ),
                ),
                const SizedBox(height: 6),
                CupertinoTextField(
                  readOnly: true,
                  controller: TextEditingController(text: 'Berlin'),
                ),
                const TextPadding(
                  child: Text(
                    'We currently only operate in Berlin',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextPadding(
                  child: Text(
                    'Street',
                    style: titleTextStyle,
                  ),
                ),
                SizedBox(height: 4),
                CupertinoTextField(
                  placeholder: 'Alexanderstr. 4',
                ),
                SizedBox(height: 16),
                TextPadding(
                  child: Text(
                    'Floor',
                    style: titleTextStyle,
                  ),
                ),
                SizedBox(height: 4),
                CupertinoTextField(
                  placeholder: 'EG',
                ),
                SizedBox(height: 16),
                Text(
                  'Comment',
                  style: titleTextStyle,
                ),
                SizedBox(height: 4),
                CupertinoTextField(
                  placeholder: 'Enter from the backyard',
                ),
              ],
            ),
          ),
          BasketSheetSummary(
            totalPrice: totalPrice,
            buttonText: 'Confirm',
            onSubmit: () {},
          ),
        ],
      ),
    );
  }
}

class TextPadding extends StatelessWidget {
  const TextPadding({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: child,
    );
  }
}
