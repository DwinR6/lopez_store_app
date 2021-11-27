import 'dart:convert';

import 'package:lopez_store_app/models/product_model.dart';
import 'package:lopez_store_app/models/user_model.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    Order({
        this.orderId,
        this.user,
        this.orderDetail,
        this.total,
    });

    int orderId;
    User user;
    List<OrderDetail> orderDetail;
    int total;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        user: User.fromJson(json["user"]),
        orderDetail: List<OrderDetail>.from(json["order_detail"].map((x) => OrderDetail.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "user": user.toJson(),
        "order_detail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
        "total": total,
    };
}

class OrderDetail {
    OrderDetail({
        this.orderDetailId,
        this.product,
        this.amount,
        this.subtotal,
    });

    int orderDetailId;
    Product product;
    int amount;
    double subtotal;

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderDetailId: json["order_detail_id"],
        product: Product.fromJson(json["product"]),
        amount: json["amount"],
        subtotal: json["subtotal"],
    );

    Map<String, dynamic> toJson() => {
        "order_detail_id": orderDetailId,
        "product": product.toJson(),
        "amount": amount,
        "subtotal": subtotal,
    };
}
