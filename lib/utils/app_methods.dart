import 'package:action_figure/data/dummy_data.dart';
import 'package:action_figure/models/af_model.dart';
import 'package:action_figure/widget/snack_bar.dart';
import 'package:flutter/material.dart';

class AppMethods {
  AppMethods._();
  static void addToCart(AFModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(failedSnackBar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar());
    }
  }

  static double sumOfItemsOnBag() {
    double sumPrice = 0.0;
    for (AFModel bagModel in itemsOnBag) {
      sumPrice = sumPrice + bagModel.price;
    }
    return sumPrice;
  }
}
