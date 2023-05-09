import 'package:action_figure/animation/fadeanimation.dart';
import 'package:action_figure/models/af_model.dart';
import 'package:action_figure/theme/app_theme.dart';
import 'package:action_figure/utils/app_methods.dart';
import 'package:action_figure/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  AFModel model;
  bool isComeFromMoreSection;
  DetailScreen(
      {super.key, required this.model, required this.isComeFromMoreSection});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppConstantsColor.backgroundColor,
          appBar: customAppBar(),
          body: SizedBox(
            width: width,
            height: height * 1.1,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  topInformationWidget(width, height),
                  middleImgListWidget(width, height),
                  SizedBox(
                    height: 20,
                    width: width / 1.1,
                    child: const Divider(
                      thickness: 1.4,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        nameAndPrice(),
                        const SizedBox(height: 10),
                        productInfo(width, height),
                        const SizedBox(
                          height: 5,
                        ),
                        moreDetailsText(width, height),
                        const SizedBox(
                          height: 20,
                        ),
                        materialButton(width, height),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  customAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("John Wick", style: AppThemes.detailsAppBar),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }

  // Top information Widget Components
  topInformationWidget(width, height) {
    return SizedBox(
      width: width,
      height: height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            bottom: 20,
            child: FadeAnimation(
              delay: 0.5,
              child: Container(
                width: 1000,
                height: height / 2.2,
                decoration: BoxDecoration(
                  color: widget.model.modelColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(1500),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag: widget.isComeFromMoreSection
                  ? widget.model.model
                  : widget.model.image,
              child: SizedBox(
                width: width / 1.3,
                height: height / 3.3,
                child: Image(image: AssetImage(widget.model.image)),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Rounded Image Widget About Below method Components
  roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.model.image),
      ),
    );
  }

  // Middle Image List Widget Components
  middleImgListWidget(width, height) {
    return FadeAnimation(
      delay: 0.5,
      child: Container(
        padding: const EdgeInsets.all(2),
        width: width,
        height: height / 11,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            roundedImage(width, height),
            roundedImage(width, height),
            roundedImage(width, height),
            Container(
              padding: const EdgeInsets.all(2),
              width: width / 5,
              height: height / 14,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(widget.model.image),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(1), BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: AppConstantsColor.lightTextColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //MaterialButton Components
  materialButton(width, height) {
    return FadeAnimation(
      delay: 2.5,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: width / 0.2,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {
          AppMethods.addToCart(widget.model, context);
        },
        child: const Text(
          "ADD TO BAG",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  //more details Text Components
  moreDetailsText(width, height) {
    return FadeAnimation(
      delay: 2,
      child: Container(
        padding: const EdgeInsets.only(right: 280),
        height: height / 26,
        child: const FittedBox(
            child: Text('MORE DETAILS', style: AppThemes.detailsMoreText)),
      ),
    );
  }

  //About Product Text Components
  productInfo(width, height) {
    return FadeAnimation(
      delay: 1.5,
      child: SizedBox(
        width: width,
        height: height / 9,
        child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum.",
            style: AppThemes.detailsProductDescriptions),
      ),
    );
  }

  //Name And Price Text Components
  nameAndPrice() {
    return FadeAnimation(
      delay: 1,
      child: Row(
        children: [
          Text(
            widget.model.model,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppConstantsColor.darkTextColor,
            ),
          ),
          Expanded(child: Container()),
          Text('₹ ${widget.model.price.toStringAsFixed(2)}',
              style: AppThemes.detailsProductPrice),
        ],
      ),
    );
  }
}
