import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/modal/product_modal.dart';

class CartProduct {
  String cid;
  String category;
  String pid;
  int quantity;
  String colors;

  ProductModal productData;

  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.documentID;
    category = document.data['category'];
    pid = document.data['pid'];
    quantity = document.data['quantity'];
    colors = document.data["Colors"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "colors": colors,
      "product": productData.toResumeMap()
    };
  }
}
