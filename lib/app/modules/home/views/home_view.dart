import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:june_salon/app/utils/enums/languages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.videoController.value.size.width,
                      height: controller.videoController.value.size.height,
                      child: VideoPlayer(controller.videoController),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () => controller.initializeVideo(),
                      child: Image.asset("assets/images/home.png"),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 4,
                            child: controller.language == Languages.id
                                ? Image.asset(
                                    "assets/images/indonesia_active.png")
                                : GestureDetector(
                                    onTap: () => controller.doChangeLanguage(
                                      context,
                                      Languages.id,
                                    ),
                                    child: Image.asset(
                                      "assets/images/indonesia_inactive.png",
                                    ),
                                  ),
                          ),
                          SizedBox(
                            width: Get.width / 4,
                            child: controller.language == Languages.en
                                ? Image.asset(
                                    "assets/images/english_active.png")
                                : GestureDetector(
                                    onTap: () => controller.doChangeLanguage(
                                      context,
                                      Languages.en,
                                    ),
                                    child: Image.asset(
                                        "assets/images/english_inactive.png"),
                                  ),
                          ),
                          SizedBox(
                            width: Get.width / 4,
                            child: controller.language == Languages.fr
                                ? Image.asset("assets/images/france_active.png")
                                : GestureDetector(
                                    onTap: () => controller.doChangeLanguage(
                                      context,
                                      Languages.fr,
                                    ),
                                    child: Image.asset(
                                        "assets/images/france_inactive.png"),
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.0, 1),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: controller.videoPosition == 0
                      ? controller.content0()
                      : controller.videoPosition == 1
                          ? controller.content1()
                          : controller.videoPosition == 2
                              ? controller.content2()
                              : controller.videoPosition == 3
                                  ? controller.content3()
                                  : controller.videoPosition == 4
                                      ? controller.content4()
                                      : controller.videoPosition == 5
                                          ? controller.content5()
                                          : controller.videoPosition == 6
                                              ? controller.content6()
                                              : controller.videoPosition == 7
                                                  ? controller.content7()
                                                  : controller.videoPosition ==
                                                          8
                                                      ? controller.content8()
                                                      : controller.videoPosition ==
                                                              9
                                                          ? controller
                                                              .content9()
                                                          : controller.videoPosition ==
                                                                  10
                                                              ? controller
                                                                  .content10()
                                                              : controller.videoPosition ==
                                                                      11
                                                                  ? controller
                                                                      .content11()
                                                                  : controller.videoPosition ==
                                                                          12
                                                                      ? controller
                                                                          .content12()
                                                                      : controller.videoPosition ==
                                                                              13
                                                                          ? controller
                                                                              .content13()
                                                                          : SizedBox
                                                                              .shrink(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
