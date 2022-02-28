import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/expaned_widget.dart';
import 'package:kozarni_ecome/model/hive_item.dart';
import 'home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_full_image_screen/custom_full_image_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
        backgroundColor: detailTextBackgroundColor,
        appBar: AppBar(
          elevation: 0,
                  backgroundColor: detailBackgroundColor,
                  leading: IconButton(
                    onPressed: Get.back,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                    ),
                  ),
                    title: Text(
                      controller.selectedItem.value.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),

          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: detailTextBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Hero(
                        tag: controller.selectedItem.value.photo,
                        child: CarouselSlider(
                          items: [
                            CachedNetworkImage(
                              imageUrl: controller.selectedItem.value.photo,
                              width: double.infinity,
                              fit: BoxFit.cover),
                            CachedNetworkImage(
                              imageUrl: controller.selectedItem.value.photo2,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            CachedNetworkImage(
                              imageUrl: controller.selectedItem.value.photo3,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ],
                          options: CarouselOptions(
                            height: 300,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
  ),
  ),
  ),
  ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      controller.selectedItem.value.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Star
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                size: 20,
                                color:
                                    index <= controller.selectedItem.value.star
                                        ? homeIndicatorColor
                                        : Colors.grey,
                              ),
                            ),
                          ),
                          //Favourite Icon
                          ValueListenableBuilder(
                            valueListenable:
                                Hive.box<HiveItem>(boxName).listenable(),
                            builder: (context, Box<HiveItem> box, widget) {
                              final currentObj =
                                  box.get(controller.selectedItem.value.id);

                              if (!(currentObj == null)) {
                                return IconButton(
                                    onPressed: () {
                                      box.delete(currentObj.id);
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Colors.red,
                                      size: 25,
                                    ));
                              }
                              return IconButton(
                                  onPressed: () {
                                    box.put(
                                      controller.selectedItem.value.id, 
                                      controller.changeHiveItem(controller.selectedItem.value));
                                  },
                                  icon: Icon(
                                    Icons.favorite_outline,
                                    color: Colors.red,
                                    size: 25,
                                  ));
                            },
                          ),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "တစ်ထည်ဈေး (Ratail)    : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "${controller.selectedItem.value.price} Kyats",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.selectedItem.value.brand,
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),

                        Text(
                          "${controller.selectedItem.value.discountprice} Kyats",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpandedWidget(
                      text: controller.selectedItem.value.desc,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "⏰ Delivery Time",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Within 3 Days",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "💁 Availability ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.selectedItem.value.deliverytime,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "📞 Contact Phone ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "     09 44 33 99 751",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ImageCachedFullscreen(
                              imageUrl: controller.selectedItem.value.photo,
                              imageBorderRadius: 7,
                              imageWidth: 150,
                              imageHeight: 200,
                              imageFit: BoxFit.cover,
                              imageDetailsHeight: double.infinity,
                              imageDetailsWidth: double.infinity,
                              imageDetailsFit: BoxFit.fitWidth,
                              withHeroAnimation: true,
                              placeholder: Container(),
                              placeholderDetails: Center(child: CircularProgressIndicator()),),
                            ),
                          ),

                        SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ImageCachedFullscreen(
                                    imageUrl: controller.selectedItem.value.photo2,
                                    imageBorderRadius: 7,
                                    imageWidth: 150,
                                    imageHeight: 200,
                                    imageFit: BoxFit.cover,
                                    imageDetailsHeight: double.infinity,
                                    imageDetailsWidth: double.infinity,
                                    imageDetailsFit: BoxFit.fitWidth,
                                    withHeroAnimation: true,
                                    placeholder: Container(),
                                    placeholderDetails: Center(child: CircularProgressIndicator()),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Center(
                          child: ImageCachedFullscreen(
                            imageUrl: controller.selectedItem.value.photo3,
                            imageBorderRadius: 7,
                            imageWidth: double.infinity,
                            imageHeight: 200,
                            imageFit: BoxFit.cover,
                            imageDetailsHeight: double.infinity,
                            imageDetailsWidth: double.infinity,
                            imageDetailsFit: BoxFit.fitWidth,
                            withHeroAnimation: true,
                            placeholder: Container(),
                            placeholderDetails: Center(child: CircularProgressIndicator()),),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "🏠  Baby & Children's Clothing Store",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'ထိုင်းနိုင်ငံထုတ် အရည်အသွေး ကောင်းမွန်သော ကလေးဝတ် Tshirt နှင့် အဝတ်အထည်များ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

        bottomNavigationBar: Container(
          width: double.infinity,
          height: 65,
          // decoration: BoxDecoration(
          //   color: detailBackgroundColor,
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(20),
          //     topRight: Radius.circular(20),
          //   ),
          // ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: ElevatedButton(
            style: buttonStyle,
            onPressed: () {
              Get.defaultDialog(
                titlePadding: EdgeInsets.all(0),
                contentPadding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10),
                radius: 0,
                title: '',
                content: AddToCart(
                  priceList: [
                    controller.selectedItem.value.price,
                    controller.selectedItem.value.discountprice,
                  ],
                ),
              );
            },
            child: Text("၀ယ်ယူရန်"),
          ),
        ),
      );
  }
}

class AddToCart extends StatefulWidget {
  final List<int> priceList;
  const AddToCart({
    Key? key,
    required this.priceList,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String? colorValue;
  String? sizeValue;
  String? priceType;
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      children: [
        DropdownButtonFormField(
          value: colorValue,
          hint: Text(
            'Color',
            style: TextStyle(fontSize: 12),
          ),
          onChanged: (String? e) {
            colorValue = e;
          },
          items: controller.selectedItem.value.color
              .split(',')
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(fontSize: 12),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
          value: sizeValue,
          hint: Text(
            "Size",
            style: TextStyle(fontSize: 12),
          ),
          onChanged: (String? e) {
            sizeValue = e;
          },
          items: controller.selectedItem.value.size
              .split(',')
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(fontSize: 12),
                    ),
                  ))
              .toList(),
        ),
        //Price Wholesale (or) Retail
        SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
          value: priceType,
          hint: Text(
            "Price",
            style: TextStyle(fontSize: 12),
          ),
          onChanged: (String? e) {
            priceType = e;
          },
          items: List.generate(
            priceList.length,
            (index) => DropdownMenuItem(
              value: priceList[index],
              child: Text(
                priceList[index],
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
            style: buttonStyle,
            onPressed: () {
              if (colorValue != null &&
                  sizeValue != null &&
                  priceType != null) {
                int price = (priceType == priceList[0])
                    ? widget.priceList[0]
                    : widget.priceList[1];
                controller.addToCart(controller.selectedItem.value, colorValue!,
                    sizeValue!, price);
                Get.to(HomeScreen());
              }
            },
            child: Text("၀ယ်ယူရန်"),
          ),
        ),
      ],
    );
  }
}
