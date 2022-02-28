import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/data/enum.dart';
import 'package:kozarni_ecome/data/township_list.dart';
import 'package:kozarni_ecome/routes/routes.dart';
import 'package:kozarni_ecome/widgets/custom_checkbox.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController controller = Get.find();
    controller.updateSubTotal(false); //Make Sure To Update SubTotal

    return Column(
      children: [
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.myCart.length,
              itemBuilder: (_, i) => Card(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            controller.getItem(controller.myCart[i].id).photo,
                        // "$baseUrl$itemUrl${controller.getItem(controller.myCart[i].id).photo}/get",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.getItem(controller.myCart[i].id).name,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          SizedBox(height: 5),
                          Text(
                            "${controller.myCart[i].color}",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${controller.myCart[i].size}",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${controller.myCart[i].price} ကျပ်",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.remove(controller.myCart[i]);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(controller.myCart[i].count.toString()),
                          IconButton(
                            onPressed: () {
                              controller.addCount(controller.myCart[i]);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        GetBuilder<HomeController>(builder: (controller) {
          return Container(
            width: double.infinity,
            height: 200,
            child: Card(
              margin: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ကုန်ပစ္စည်းအတွက် ကျသင့်ငွေ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "${controller.subTotal} ကျပ်",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ပို့ဆောင်စရိတ်",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        //DropDown TownShip List
                        Container(
                          width: 150,
                          height: 50,
                          child:
                              GetBuilder<HomeController>(builder: (controller) {
                            return DropdownButtonFormField(
                              value: controller.townshipName,
                              hint: Text(
                                'Township',
                                style: TextStyle(fontSize: 12),
                              ),
                              onChanged: (String? e) {
                                print("*******************$e************");
                                controller.setTownshipName(e);
                              },
                              items:
                                  List.generate(townshipList.length, (index) {
                                return DropdownMenuItem(
                                  value: "${townshipList[index].name}",
                                  onTap: () {
                                    controller.setTownship(townshipList[
                                        index]); //SET TOWNSHIP OBJECT
                                  },
                                  child: SizedBox(
                                    width: 120,
                                    child: Center(
                                      child: Text(
                                        townshipList[index].name,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          }),
                        ),
                        GetBuilder<HomeController>(builder: (controller) {
                          return Text(
                            controller.township == null
                                ? "0ကျပ်"
                                : " ${controller.township!.fee} ကျပ်",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 10,
                      right: 10,
                    ),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(25, 25, 25, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "စုစုပေါင်း ကျသင့်ငွေ   =  ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        GetBuilder<HomeController>(builder: (controller) {
                          return Text(
                            controller.township == null
                                ? "${controller.subTotal}"
                                : "${controller.subTotal + controller.township!.fee} ကျပ်",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        Container(
          width: double.infinity,
          height: 45,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(homeIndicatorColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              if (controller.myCart.isNotEmpty &&
                  !(controller.townshipName == null) &&
                  !(controller.township == null)) {
                //TODO: SHOW DIALOG TO CHOOSE OPTION,THEN GO TO CHECKOUT
                Get.defaultDialog(
                  backgroundColor: Colors.white70,
                  titlePadding: EdgeInsets.all(8),
                  contentPadding: EdgeInsets.all(0),
                  title: "ငွေချေမည့် နည်းလမ်း",
                  content: PaymentOptionContent(),
                  barrierDismissible: false,
                  confirm: nextButton(),
                );
                //Get.toNamed(checkOutScreen);
              } else {
                Get.snackbar('Error', "Cart is empty");
              }
            },
            child: Text("Order တင်ရန် နှိပ်ပါ"),
          ),
        )
      ],
    );
  }
}

class PaymentOptionContent extends StatelessWidget {
  const PaymentOptionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomCheckBox(
          height: 60,
          options: PaymentOptions.CashOnDelivery,
          icon: FontAwesomeIcons.truck,
          iconColor: Colors.amber,
          text: "ပစ္စည်း ရောက်မှ ငွေချေမယ်",
        ),
        SizedBox(height: 10),
        CustomCheckBox(
          height: 60,
          options: PaymentOptions.PrePay,
          icon: FontAwesomeIcons.dollarSign,
          iconColor: Colors.blue,
          text: "Bank မှ တဆင့် ငွေကြိုလွှဲမယ်",
        ),
      ]),
    );
  }
}

Widget nextButton() {
  HomeController controller = Get.find();
  return //Next
      Container(
    height: 55,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    child: TextButton(
      onPressed: () {
        if (controller.paymentOptions != PaymentOptions.None) {
          //Go To CheckOut Screen
          Navigator.of(Get.context!).pop();
          Get.toNamed(checkOutScreen);
        }
      },
      child: Text("OK", style: TextStyle(color: Colors.white)),
    ),
  );
}