import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Widget _buildBodyBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.cyan, Colors.cyan[900]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Catálogo',
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection("home").getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else {
                  return SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    children: snapshot.data.documents.map((doc) {
                      return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: doc.data["image"],
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
