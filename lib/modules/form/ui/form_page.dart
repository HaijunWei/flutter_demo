import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/form_provider.dart';

class FormPage extends HookConsumerWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    // 局部状态使用flutter_hooks实现，也可以用StatefulWidget实现
    final ageRef = useState<num>(0);

    final userInfo = ref.watch(userInfoProvider).valueOrNull;
    useEffect(
      () {
        // 获取信息通常是调用接口，是异步的，这段代码是在接口调用完毕后更新页面显示值
        if (userInfo != null) {
          if (nameController.text != userInfo.name) {
            nameController.text = userInfo.name;
          }
          ageRef.value = userInfo.age;
        }
        return () {};
      },
      [userInfo],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('表单')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                const Text('姓名'),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: '请输入姓名',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('年龄'),
                const SizedBox(width: 8),
                Text(ageRef.value.toString(), style: const TextStyle(fontSize: 20, color: Colors.red)),
                const SizedBox(width: 8),
                CupertinoButton(
                  onPressed: () {
                    // 懒得写选择器了，随机一个数
                    ageRef.value = Random().nextInt(100);
                  },
                  child: const Text('请选择'),
                ),
              ],
            ),
            CupertinoButton(
              onPressed: () async {
                final success = await saveUserInfo(name: nameController.text, age: ageRef.value);
                // 通常保存成功可能会有返回上个页面的需求
                if (success && context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              color: Theme.of(context).primaryColor,
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
