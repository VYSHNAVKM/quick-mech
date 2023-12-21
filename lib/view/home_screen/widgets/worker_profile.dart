import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/fav_controller/fav_controller.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/database/database_for%20_favourite.dart';

class CustomWorkerProfileContainer extends StatelessWidget {
  const CustomWorkerProfileContainer({super.key, required this.index});

  // final bool _isClicked = false;

  final int index;

  @override
  Widget build(BuildContext context) {
    var item = context.select<FavouriteModel, Item>(
        (favouritelist) => favouritelist.getByPosition(index));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4.0, 4), //(x,y)
                    blurRadius: 6.0,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorConstants.bannerColor),
                color: ColorConstants.primaryWhite,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.image, height: 90, width: double.infinity,
                      // Provider.of<MechanicController>(context, listen: false)
                      //     .mechanicList[index]
                      //     .image
                      //     .toString(),
                      // height: 100,
                      // width: double.infinity,
                    ),
                  ),
                  Text(item.name),
                  Text(item.ratting)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [AddButton(item: item)],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    var isInFavouritePage = context.select<FavouriterController, bool>(
        (favouritepage) => favouritepage.favitems.contains(item));
    return IconButton(
        onPressed: isInFavouritePage
            ? () {
                var favouritePage = context.read<FavouriterController>();
                favouritePage.remove(item);
              }
            : () {
                var favouritePage = context.read<FavouriterController>();
                favouritePage.add(item);
              },
        icon: isInFavouritePage
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(Icons.favorite_border));
  }
}
