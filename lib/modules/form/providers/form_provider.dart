import 'dart:math';

import 'package:flutter_demo/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_provider.g.dart';

@riverpod
FutureOr<UserModel> userInfo(UserInfoRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return const UserModel(name: '张三', age: 100);
}

Future<bool> saveUserInfo({required String name, required num age}) async {
  // 处理具体的保存逻辑，调用接口或者存本地，通常代码如下：
  /*
  try {
    Toast.showLoading();
    await api.save(name: name, age: age);
    Toast.hideLoading();
    return true
  } catch (e) {
    Toast.hideLoading();
    Toast.showError(e);
    return false;
  }
  */
  return Random().nextBool();
}
