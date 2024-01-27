import 'package:appinio_bloc/theme.dart';
import 'package:flutter/cupertino.dart';

class SearchPersistentHeader extends StatelessWidget {
  const SearchPersistentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SearchPersistentHeaderDelegate(),
    );
  }
}

class SearchPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 85;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 150,
      color: searchBarColor,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: const ClearableCupertinoTextField(
                placeholder: 'Find something specific',
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            height: 1,
            color: searchBarDividerColor,
          )
        ],
      ),
    );
  }
}

class ClearableCupertinoTextField extends StatefulWidget {
  const ClearableCupertinoTextField({
    super.key,
    this.placeholder,
  });

  final String? placeholder;

  @override
  State<ClearableCupertinoTextField> createState() =>
      _ClearableCupertinoTextFieldState();
}

class _ClearableCupertinoTextFieldState
    extends State<ClearableCupertinoTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onClearPressed() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _controller,
      placeholder: widget.placeholder,
      suffix: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) => _controller.text.isNotEmpty
            ? CupertinoButton(
                onPressed: _onClearPressed,
                padding: EdgeInsets.zero,
                minSize: 36,
                child: Icon(
                  CupertinoIcons.clear,
                  size: 18,
                  color: textFieldClearTextActionColor,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
