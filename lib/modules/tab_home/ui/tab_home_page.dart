import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabHomePage extends HookConsumerWidget {
  const TabHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndexRef = useState(0);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _TabPageScaffold(
              selectedIndex: selectedIndexRef.value,
            ),
          ),
          _TabBar(
            selectedIndex: selectedIndexRef.value,
            onTap: (value) => selectedIndexRef.value = value,
          ),
        ],
      ),
    );
  }
}

class _TabPageScaffold extends StatelessWidget {
  const _TabPageScaffold({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 4; i++)
          Visibility(
            visible: i == selectedIndex,
            maintainState: true,
            // child 换成具体的子页
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '页面$i',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _TabBar extends ConsumerWidget {
  const _TabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.red.withOpacity(0.3),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 44,
          child: Row(
            children: [
              for (var i = 0; i < 4; i++)
                Expanded(
                  child: CupertinoButton(
                    onPressed: () => onTap(i),
                    borderRadius: BorderRadius.zero,
                    padding: EdgeInsets.zero,
                    color: selectedIndex == i ? Theme.of(context).primaryColor : null,
                    child: Text(
                      'Page$i',
                      style: TextStyle(
                        fontSize: 16,
                        color: selectedIndex == i ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
