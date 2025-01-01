import 'package:flutter/material.dart';

import '../../Widgets/items_badminton.dart';
import '../../models/badminton_model.dart';
import '../../services/badminton_service.dart';

class HomePage extends StatelessWidget {
  final BadmintonService badmintonService = BadmintonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Badminton Items')),
      body: FutureBuilder<List<Badminton>>(
        future: badmintonService.fetchBadmintons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // return Center(child: Text('No items found.'));
            return Center(child: Text(snapshot.data.toString()));
          }

          final items = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 50,
              mainAxisSpacing: 150,
              childAspectRatio: 0.5
            ),
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return Item_Badminton(item);
            },
            itemCount: items.length,
          );
        },
      ),
    );
  }
}
