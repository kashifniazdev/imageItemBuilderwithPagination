import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qoute_a_pic/Controllers/home_controller.dart';
import 'package:qoute_a_pic/Widgets/image_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) => Scaffold(
              body: ListView.separated(
                controller: controller.scrollController,
                itemCount: controller.imagesList.length,
                itemBuilder: (BuildContext context, int index) =>
                    ImageCard(item: controller.imagesList[index]),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ));
  }
}
