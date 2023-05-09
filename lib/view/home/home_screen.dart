import 'package:action_figure/animation/fadeanimation.dart';
import 'package:action_figure/data/dummy_data.dart';
import 'package:action_figure/models/af_model.dart';
import 'package:action_figure/theme/app_theme.dart';
import 'package:action_figure/utils/constants.dart';
import 'package:action_figure/view/detail/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppbar(),
        body: Column(
          children: [
            const SizedBox(height: 10),
            middleCategoriesWidget(width, height),
            const SizedBox(height: 5),
            moreTextWidget(),
            lastCategoriesWidget(width, height),
          ],
        ),
      ),
    );
  }

  customAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text("DevDiariesWithVee", style: AppThemes.homeAppBar),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              icon: const FaIcon(
                CupertinoIcons.search,
                color: AppConstantsColor.darkTextColor,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 4),
            child: IconButton(
              icon: const FaIcon(
                CupertinoIcons.bell,
                color: AppConstantsColor.darkTextColor,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

// Middle Categories Widget Components
  middleCategoriesWidget(width, height) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: SizedBox(
            width: width / 1.2,
            height: height / 2.60,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: availableItems.length,
              itemBuilder: (ctx, index) {
                AFModel model = availableItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          model: model,
                          isComeFromMoreSection: false,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    width: width / 1.5,
                    child: Stack(
                      children: [
                        Container(
                          width: width / 1.9,
                          decoration: BoxDecoration(
                            color: model.modelColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 10,
                          child: FadeAnimation(
                            delay: 1.5,
                            child: Text(model.model,
                                style: AppThemes.homeProductModel),
                          ),
                        ),
                        Positioned(
                          top: 75,
                          left: 10,
                          child: FadeAnimation(
                            delay: 2,
                            child: Text("₹ ${model.price.toStringAsFixed(2)}",
                                style: AppThemes.homeProductPrice),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 29,
                          child: FadeAnimation(
                            delay: 2,
                            child: Hero(
                              tag: model.image,
                              child: SizedBox(
                                width: 290,
                                height: 250,
                                child: Image(
                                  image: AssetImage(model.image),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

// More Text Widget Components
  moreTextWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text("More", style: AppThemes.homeMoreText),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {},
              icon: const FaIcon(
                CupertinoIcons.arrow_right,
                size: 27,
              ))
        ],
      ),
    );
  }

// Last Categories Widget Components
  lastCategoriesWidget(width, height) {
    return SizedBox(
      width: width,
      height: height / 4,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: availableItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            AFModel model = availableItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                      model: model,
                      isComeFromMoreSection: true,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: width / 2.24,
                height: height / 4.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      child: FadeAnimation(
                        delay: 1,
                        child: Container(
                          width: width / 13,
                          height: height / 10,
                          color: Colors.red,
                          child: const RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                  child: FadeAnimation(
                                delay: 1.5,
                                child: Text("NEW",
                                    style: AppThemes.homeGridNewText),
                              ))),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 110,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppConstantsColor.darkTextColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      left: 25,
                      child: FadeAnimation(
                        delay: 1.5,
                        child: SizedBox(
                          width: width / 3,
                          height: height / 9,
                          child: Hero(
                            tag: model.model,
                            child: Image(
                              image: AssetImage(model.image),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 124,
                      left: 30,
                      child: FadeAnimation(
                        delay: 2,
                        child: SizedBox(
                          width: width / 3,
                          height: height / 42,
                          child: FittedBox(
                            child: Text("${model.name} - ${model.model}",
                                style: AppThemes.homeGridNameAndModel),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 45,
                      child: FadeAnimation(
                        delay: 2.2,
                        child: SizedBox(
                          width: width / 4,
                          height: height / 42,
                          child: FittedBox(
                            child: Text("₹ ${model.price.toStringAsFixed(2)}",
                                style: AppThemes.homeGridPrice),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
