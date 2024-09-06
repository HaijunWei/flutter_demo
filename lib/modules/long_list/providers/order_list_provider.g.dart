// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderListHash() => r'7c62698c61f153efbbbe271d37cac102822c5700';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$OrderList
    extends BuildlessAutoDisposeAsyncNotifier<List<OrderModel>> {
  late final int status;

  FutureOr<List<OrderModel>> build({
    required int status,
  });
}

/// See also [OrderList].
@ProviderFor(OrderList)
const orderListProvider = OrderListFamily();

/// See also [OrderList].
class OrderListFamily extends Family<AsyncValue<List<OrderModel>>> {
  /// See also [OrderList].
  const OrderListFamily();

  /// See also [OrderList].
  OrderListProvider call({
    required int status,
  }) {
    return OrderListProvider(
      status: status,
    );
  }

  @override
  OrderListProvider getProviderOverride(
    covariant OrderListProvider provider,
  ) {
    return call(
      status: provider.status,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'orderListProvider';
}

/// See also [OrderList].
class OrderListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<OrderList, List<OrderModel>> {
  /// See also [OrderList].
  OrderListProvider({
    required int status,
  }) : this._internal(
          () => OrderList()..status = status,
          from: orderListProvider,
          name: r'orderListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderListHash,
          dependencies: OrderListFamily._dependencies,
          allTransitiveDependencies: OrderListFamily._allTransitiveDependencies,
          status: status,
        );

  OrderListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final int status;

  @override
  FutureOr<List<OrderModel>> runNotifierBuild(
    covariant OrderList notifier,
  ) {
    return notifier.build(
      status: status,
    );
  }

  @override
  Override overrideWith(OrderList Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrderListProvider._internal(
        () => create()..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<OrderList, List<OrderModel>>
      createElement() {
    return _OrderListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderListProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrderListRef on AutoDisposeAsyncNotifierProviderRef<List<OrderModel>> {
  /// The parameter `status` of this provider.
  int get status;
}

class _OrderListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<OrderList, List<OrderModel>>
    with OrderListRef {
  _OrderListProviderElement(super.provider);

  @override
  int get status => (origin as OrderListProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
