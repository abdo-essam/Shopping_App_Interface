import 'package:flutter/material.dart';
import '../lang/app_localizations.dart';
import '../widgets/home/product_grid.dart';
import '../widgets/home/hot_offers_list.dart';
import '../widgets/home/product_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(localizations.appTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                localizations.ourProducts,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.3,
                child: const ProductPageView(),
              ),
              const SizedBox(height: 20),
              const ProductGrid(),
              const SizedBox(height: 20),
               Text(
                localizations.hotOffers,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const HotOffersList(),
            ],
          ),
        ),
      ),
    );
  }
}