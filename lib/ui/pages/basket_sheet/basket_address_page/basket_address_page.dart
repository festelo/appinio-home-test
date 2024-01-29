import 'package:appinio_bloc/ui/pages/basket_sheet/basket_address_page/basket_address_cubit.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/routes.dart';
import 'package:appinio_bloc/ui/pages/basket_sheet/widgets/basket_sheet_summary.dart';
import 'package:appinio_bloc/ui/theme.dart';
import 'package:appinio_bloc/ui/widgets/sheet_content_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketAddressPage extends StatefulWidget {
  const BasketAddressPage({
    required this.scrollController,
    super.key,
  });

  final ScrollController scrollController;

  @override
  State<BasketAddressPage> createState() => _BasketAddressPageState();
}

class _BasketAddressPageState extends State<BasketAddressPage> {
  final TextEditingController cityController =
      TextEditingController(text: 'Berlin');

  Future<void> onNext(BuildContext context) async {
    final navigator = Navigator.of(context);
    await context.read<BasketAddressCubit>().onConfirmOrder();
    if (!navigator.mounted) {
      return;
    }
    await navigator.pushNamedAndRemoveUntil(
      BasketRoutes.done,
      (_) => false,
    );
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = context.select(
      (BasketAddressCubit cubit) => cubit.state.totalPrice,
    );

    return SheetContentDecoration(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              controller: widget.scrollController,
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
                  controller: cityController,
                ),
                const SizedBox(height: 4),
                const TextPadding(
                  child: Text(
                    'We currently only operate in Berlin',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                TextPadding(
                  child: Text(
                    'Street',
                    style: titleTextStyle,
                  ),
                ),
                const SizedBox(height: 4),
                CupertinoTextField(
                  placeholder: 'Alexanderstr. 4',
                  onChanged: context.read<BasketAddressCubit>().onStreetChanged,
                ),
                const SizedBox(height: 22),
                TextPadding(
                  child: Text(
                    'Floor',
                    style: titleTextStyle,
                  ),
                ),
                const SizedBox(height: 4),
                CupertinoTextField(
                  placeholder: 'EG',
                  onChanged: context.read<BasketAddressCubit>().onFloorChanged,
                ),
                const SizedBox(height: 22),
                Text(
                  'Comment',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 4),
                CupertinoTextField(
                  placeholder: 'Enter from the backyard',
                  onChanged:
                      context.read<BasketAddressCubit>().onCommentChanged,
                ),
              ],
            ),
          ),
          BasketSheetSummary(
            totalPrice: totalPrice,
            buttonText: 'Confirm',
            onSubmit: context.select(
              (BasketAddressCubit cubit) => cubit.state.formValid,
            )
                ? () => onNext(context)
                : null,
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
