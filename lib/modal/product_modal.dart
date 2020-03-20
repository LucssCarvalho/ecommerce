import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModal {
  String category;
  String id;
  String title;
  String description;
  double price;
  List images;
  List colors;

  ProductModal.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    images = snapshot.data["images"];
    colors = snapshot.data["colors"];
  }

  Map<String, dynamic> toResumeMap() {
    return {"title": title, "description": description, "price": price};
  }
}
