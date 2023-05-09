import 'package:action_figure/models/af_model.dart';
import 'package:action_figure/utils/constants.dart';
import 'package:flutter/material.dart';


final List<AFModel> availableItems = [
  AFModel(
    name: AppConstantsName.actionFigure,
    model: "John Wick",
    price: 130.00,
    image: "assets/images/a8.png",
    modelColor: const Color(0xffDE0106),
  ),
  AFModel(
    name: AppConstantsName.actionFigure,
    model: "Flash",
    price: 190.00,
    image: "assets/images/a6.png",
    modelColor: const Color(0xff3495ae),
  ),
  AFModel(
    name: AppConstantsName.actionFigure,
    model: "Lion King",
    price: 160.00,
    image: "assets/images/a4.png",
    modelColor: const Color(0xffac5b35),
  ),
  AFModel(
    name: AppConstantsName.actionFigure,
    model: "Megumi",
    price: 110.00,
    image: "assets/images/a3.png",
    modelColor: const Color(0xff233641),
  ),
  AFModel(
    name: AppConstantsName.actionFigure,
    model: "Saki",
    price: 150.00,
    image: "assets/images/a5.png",
    modelColor: const Color(0xff37376B),
  ),
  AFModel(
    name: AppConstantsName.actionFigure,
    model: "Goku",
    price: 115.00,
    image: "assets/images/a1.png",
    modelColor: const Color(0xfff5a201),
  ),
  AFModel(
    name: AppConstantsName.actionFigure,
    model: "Ichigo",
    price: 150.00,
    image: "assets/images/a7.png",
    modelColor: const Color(0xff6edfec),
  ),
  AFModel(
    name: AppConstantsName.actionFigure,
    model: "Shizuru",
    price: 150.00,
    image: "assets/images/a2.png",
    modelColor: const Color(0xff01bd04),
  ),
];

List<AFModel> itemsOnBag = [];
