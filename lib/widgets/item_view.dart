import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:furniture_app/utils/theme.dart';
import 'package:get/get.dart';

import 'cache_image_widget.dart';

class ItemView extends StatefulWidget {
  ItemView({
    Key? key,
    required this.title,
    required this.image,
    required this.fav,
    required this.subtitle,
    required this.price,
    required this.onAdd,
    required this.favOnPress,
    required this.onView,
  }) : super(key: key);

  ///[title] Item's title
  final String title;

  ///[image] Item's image
  final String image;

  ///[fav] Item's fav. status
  final bool? fav;

  ///[subtitle] Item's subtitle
  final String subtitle;

  ///[price] Item's price
  final int price;

  ///[onAdd] Item's add to cart press callback
  final Function? onAdd;

  ///[onView] Item's press callback
  final Function? onView;

  ///[favOnPress] Item's fav press callback
  final Function? favOnPress;

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onView as void Function()?,
      child: Container(
        height: 240,
        width: 170,
        margin: EdgeInsets.only(right: 18, left: 18),
        child: Stack(
          children: <Widget>[
            // The containers in the background
            Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Theme.of(context).cardColor,
                  ),
                  height: 229,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.headline3!
                                    .copyWith(fontSize: 24),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Styles.iconGold,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Styles.iconGold,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Styles.greyColorLight,
                              size: 16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.headline6!.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Constants.pricesFormatter(widget.price),
                              style: Get.textTheme.headline3!
                                  .copyWith(fontSize: 20),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(400),
                                  color: Theme.of(context).hoverColor),
                              height: 35,
                              width: 35,
                              child: Icon(Icons.add),
                              padding: EdgeInsets.zero,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CacheImageWidget(
                image: widget.image,
                favOnPress: widget.favOnPress,
                fav: widget.fav,
                height: 178.0,
                width: 160.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
