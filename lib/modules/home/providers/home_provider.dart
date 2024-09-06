import 'package:flutter_demo/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
FutureOr<List<MenuModel>> homeMenus(HomeMenusRef ref) async {
  // 假设菜单是由服务端返回的，增加延迟模拟网络耗时
  await Future.delayed(const Duration(seconds: 5));
  return [
    const MenuModel(name: '表单例子', path: '/form'),
    const MenuModel(name: '长列表(下拉刷新 + 加载更多)', path: '/long-list'),
    const MenuModel(name: 'TabPage例子', path: '/tab-home'),
  ];
}
