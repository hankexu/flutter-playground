import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

const String _kConsumableId = 'consumable';
const String _kUpgradeId = 'upgrade';
const String _kSilverSubscriptionId = 'subscription_silver';
const String _kGoldSubscriptionId = 'subscription_gold';
const List<String> _kProductIds = <String>[
  _kConsumableId,
  _kUpgradeId,
  _kSilverSubscriptionId,
  _kGoldSubscriptionId,
];


class PurchasePage extends HookConsumerWidget {
  const PurchasePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final instance = InAppPurchase.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase'),
      ),
      body: ref.watch(productProvider).when(
        data: (products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return ListTile(
                title: Text(product.title),
                subtitle: Text(product.description),
                trailing: Text(product.price),
                onTap: () async {
                  final purchaseParam = PurchaseParam(productDetails: product);
                  await instance.buyConsumable(purchaseParam: purchaseParam);
                },
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

final purchaseInstanceProvider = Provider<InAppPurchase>((ref) {
  return InAppPurchase.instance;
});

final productProvider = FutureProvider<List<ProductDetails>>((ref) async {
  final instance = ref.watch(purchaseInstanceProvider);
  print('available: ${await instance.isAvailable()}');
  final response = await instance.queryProductDetails(_kProductIds.toSet());
  print(response.productDetails);
  return response.productDetails;
});
