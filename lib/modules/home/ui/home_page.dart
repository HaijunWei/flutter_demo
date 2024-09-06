import 'package:flutter/material.dart';
import 'package:flutter_demo/models/models.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeMenusProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: switch (state) {
        AsyncData(:final value) => _ListView(menus: value),
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        _ => const SizedBox(),
      },
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    super.key,
    required this.menus,
  });

  final List<MenuModel> menus;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return _ListTile(data: menus[index]);
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    super.key,
    required this.data,
  });

  final MenuModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(data.path),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                data.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios_outlined, size: 20),
          ],
        ),
      ),
    );
  }
}
