# flutter_demo

个人项目基础框架使用例子：
- 状态管理：riverpod + flutter_hooks
- 数据类：freezed + json_serializable
- 路由：go_router

状态管理原则：
- 局部状态使用hooks
- 全局(跨组件)状态使用riverpod
- riverpod适合处理获取式的状态，比如从接口异步获取数据，提交式(保存方)的通常不使用riverpod，直接单独写方法即可