import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/models.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/order_list_provider.dart';

class LongListPage extends HookConsumerWidget {
  const LongListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusRef = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('长列表'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.black.withOpacity(0.1),
            child: Row(
              children: [
                CupertinoButton(
                  onPressed: () => statusRef.value = 0,
                  child: const Text('待付款'),
                ),
                const SizedBox(width: 8),
                CupertinoButton(
                  onPressed: () => statusRef.value = 1,
                  child: const Text('已付款'),
                ),
              ],
            ),
          ),
          Expanded(child: _ListView(status: statusRef.value)),
        ],
      ),
    );
  }
}

class _ListView extends ConsumerWidget {
  const _ListView({
    super.key,
    required this.status,
  });

  final int status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = orderListProvider(status: status);
    final state = ref.watch(provider);

    return EasyRefresh(
      onRefresh: () => ref.refresh(provider.future),
      onLoad: () => ref.read(provider.notifier).loadMore(),
      child: switch (state) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              return _OrderTile(data: value[index]);
            },
          ),
        _ => const SizedBox(),
      },
    );
  }
}

class _OrderTile extends StatelessWidget {
  const _OrderTile({
    super.key,
    required this.data,
  });

  final OrderModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            '数量: ${data.number}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
