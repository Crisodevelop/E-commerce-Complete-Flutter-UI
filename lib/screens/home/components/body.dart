import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/home_view_model.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder:  (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    HomeHeader(),
                    SizedBox(height: getProportionateScreenWidth(10)),
                    DiscountBanner(),
                    Categories(),
                    SpecialOffers(),
                    SizedBox(height: getProportionateScreenWidth(30)),
                    PopularProducts(),
                    SizedBox(height: getProportionateScreenWidth(30)),
                  ],
                ),
              ),
            ),
    );
  }
}
