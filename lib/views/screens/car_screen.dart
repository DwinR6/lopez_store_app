import 'package:flutter/material.dart';
import 'package:lopez_store_app/models/order_model.dart';
import 'package:lopez_store_app/models/product_model.dart';

class CarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _body(context, size),
    );
  }

  Widget _body(BuildContext context, Size size) {
    return Container(
      child: Column(
        children: [Text('My Cart'), _buildsOrder()],
      ),
    );
  }

  Widget _buildOrderDetailItem(
      OrderDetail orderDetail, Size size, BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.only(right: size.width * 0.05),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 0.0, color: Colors.black)),
        ),
        child: CircleAvatar(
          radius: size.height * 0.033,
          backgroundColor: Colors.transparent,
          //backgroundImage: NetworkImage(menu.imagen),
          foregroundColor: Colors.white,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            orderDetail.product.productName,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: EdgeInsets.all(5),
              //color: Recursos().colorPrimario,
              child: Text(
                '${orderDetail.amount}x',
              ),
            ),
          ),
        ],
      ),
      subtitle: Text(
        '\$${orderDetail.subtotal.toStringAsFixed(2)}',
      ),
      trailing: _itemOptions(size, orderDetail),
      onTap: () {
        //Navigator.of(context).pushNamed('menu_detalle', arguments: menu);
        //Navigator.of(context).push(
        //  CupertinoPageRoute(builder: (_) => MenuDetalle(menu: menu, actualizar: true)),
        //);
      },
    );
  }

  _itemOptions(Size size, OrderDetail orderDetail) {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        tooltip: 'Opciones',
        itemBuilder: (context) => [
              PopupMenuItem(
                child: FlatButton(
                    onPressed: () {
                      //Navigator.of(context).pop();
                      //_ordenController.deleteMenu(menu.idMenuPk);
                    },
                    child: Row(children: <Widget>[
                      Text(
                        'Eliminar de la Orden',
                      ),
                      SizedBox(width: size.width * 0.01),
                      Icon(Icons.delete, color: Colors.red)
                    ])),
              ),
            ]);
  }

  _buildsOrder(BuildContext context, Size size) {

    List<OrderDetail> orders = <OrderDetail>[
      OrderDetail(
          product: Product(
            productName: "Telefono",
            productPrice: 150.0,
          ),
          amount: 5,
          subtotal: 450.00),
    ];
    for (var item in orders) {
      item.subtotal = item.amount * item.product.productPrice;
    }
    return Container(
      child: SingleChildScrollView(
        child:  Container(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, i) => z_buildOrderDetailItem(orders[i], size, context),
            separatorBuilder: (_, i) => Divider(),
            itemCount: orders.length
          )
        ),
      ),
    );
  }
}
