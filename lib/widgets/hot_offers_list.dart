import 'package:flutter/material.dart';

import '../utils/Constants.dart';

class HotOffersList extends StatelessWidget {
  const HotOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            margin: const EdgeInsets.only(right: 10),
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      AppConstants.hotOffers[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Hot Offer ${index + 1}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}