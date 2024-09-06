import 'dart:math';

import 'package:flutter_demo/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:easy_refresh/easy_refresh.dart';

part 'order_list_provider.g.dart';

@riverpod
class OrderList extends _$OrderList {
  int _page = 1;

  @override
  Future<List<OrderModel>> build({required int status}) {
    _page = 1;
    return _loadData(_page);
  }

  Future<IndicatorResult> loadMore() async {
    final page = _page + 1;
    final allItems = List<OrderModel>.from(state.value ?? []);
    try {
      final items = await _loadData(page);
      allItems.addAll(items);
      state = AsyncData(allItems).copyWithPrevious(state);
      _page = page;
      return items.length < 10 ? IndicatorResult.noMore : IndicatorResult.success;
    } catch (e) {
      return IndicatorResult.fail;
    }
  }

  Future<List<OrderModel>> _loadData(int page) async {
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 5));
    List<OrderModel> orders = [];
    var count = 0;
    if (page == 1) {
      count = 10;
    } else {
      count = 5;
    }
    for (var i = 0; i < count; i++) {
      orders.add(OrderModel(name: '商品${page}_$i', number: Random().nextInt(10)));
    }
    return orders;
  }
}
