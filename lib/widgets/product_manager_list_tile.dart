import 'package:flutter/material.dart';
import 'package:mobileShop/providers/products.dart';
import 'package:mobileShop/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class ProductManagerListTile extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  ProductManagerListTile({this.id, this.imageUrl, this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<Products>(context, listen: false).removeProduct(id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
