import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p16().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, _, __) {
              return "\$${_cart.totalprice}".text.xl5.color(context.accentColor).make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet.".text.make()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
            ),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Material(
                color: context.cardColor,
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(_cart.items[index].image),
                    backgroundColor: Colors.orange.shade200,
                  ),
                  trailing: IconButton(
                    onPressed: () => RemoveMutation(_cart.items[index]),
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                  title: _cart.items[index].name.text.make(),
                ),
              ),
            ),
          );
  }
}
