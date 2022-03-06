import 'package:hive/hive.dart';

import 'discount_percentage.dart';
import 'size_price.dart';

part 'hive_item.g.dart';

@HiveType(typeId: 2)
class HiveItem {
  @HiveField(0)
  String id;
  @HiveField(1)
  String photo;
  @HiveField(2)
  String photo2;
  @HiveField(3)
  String photo3;
  @HiveField(4)
  String desc;
  @HiveField(5)
  String name;
  @HiveField(6)
  String brand;
  @HiveField(7)
  String deliverytime;
  @HiveField(8)
  int price;
  @HiveField(9)
  int discountprice;
  @HiveField(10)
  String color;
  @HiveField(11)
  List<SizePrice> sizePrice;
  @HiveField(12)
  List<DiscountPercentage> discountPercentage;
  @HiveField(13)
  int star;
  @HiveField(14)
  String category;
  HiveItem({
    required this.id,
    required this.photo,
    required this.photo2,
    required this.photo3,
    required this.name,
    required this.brand,
    required this.deliverytime,
    required this.price,
    required this.discountprice,
    required this.desc,
    required this.color,
    required this.sizePrice,
    required this.discountPercentage,
    required this.star,
    required this.category,
  });
}
