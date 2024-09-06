import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 文件说明：
/// 文件夹：models = 通用的数据模型类，modules = 功能模块，providers = 全局的provider

/// 第三方库作用：
/// hooks_riverpod = flutter_hooks + riverpod
/// flutter_hooks = 局部状态管理，替代系统 StatefulWidget
/// riverpod_annotation = riverpod模版代码生成用
/// json_annotation + freezed_annotation = 数据模型
/// go_router = 路由管理
///
/// dev_dependencies下的第三方库：
/// build_runner = 模板代码生成器，riverpod go_router等等都以来它
/// riverpod_generator = riverpod代码生成器
/// freezed = 数据模型代码生成器
/// json_serializable = 数据模型提供json <-> model 生成器
/// go_router_builder = 路由代码生成器
///
/// 生成器使用需要依赖终端使用命令：flutter pub run build_runner watch

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
