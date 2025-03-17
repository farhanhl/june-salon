// ignore_for_file: avoid_returning_null_for_void

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:june_salon/app/utils/enums/languages.dart';
import 'package:june_salon/app/utils/widgets/june_buttons.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  VoidCallback? videoListener;
  late VideoPlayerController videoController;
  Languages language = Languages.id;
  int videoPosition = 0;
  late Timer timer;
  RxInt duration = 10.obs;

  @override
  void onInit() async {
    super.onInit();
    initializeVideo();
  }

  void initializeVideo() {
    videoPosition = 0;
    duration = 10.obs;
    videoController = VideoPlayerController.asset(
      "assets/videos/JuneSilent.mp4",
    )..initialize().then((_) {
        videoController.play();
        videoController.setLooping(true);
        update();
      });
  }

  void doChangeLanguage(BuildContext context, Languages selectedLanguage) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    language = selectedLanguage;
    String newLocale = language.toString().split('.').last;

    localizationDelegate.changeLocale(Locale(newLocale));
    videoController.pause();
    videoController.dispose();

    String videoPath = _getVideoPath(language, videoPosition);

    videoController = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        videoController.play();
        videoController.setLooping(false);
        update();
      });
  }

  String _getVideoPath(Languages language, int position) {
    if (position == 0) {
      return "assets/videos/JuneSilent.mp4";
    } else {
      switch (language) {
        case Languages.id:
          return "assets/videos/JuneIndo$position.mp4";
        case Languages.en:
          return "assets/videos/JuneEnglish$position.mp4";
        case Languages.fr:
          return "assets/videos/JuneFr$position.mp4";
      }
    }
  }

  void doChangeVideo(
    int position,
  ) {
    videoController.pause();
    videoController.dispose();

    videoPosition = position;
    String videoPath;

    switch (language) {
      case Languages.id:
        videoPath = "assets/videos/JuneIndo$videoPosition.mp4";
        break;
      case Languages.en:
        videoPath = "assets/videos/JuneEnglish$videoPosition.mp4";
        break;
      case Languages.fr:
        videoPath = "assets/videos/JuneFr$videoPosition.mp4";
        break;
    }

    videoController = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        videoController.play();
        videoController.setLooping(false);
        update();
        videoController.addListener(() {
          if (videoController.value.position ==
              videoController.value.duration) {
            onVideoCompleted();
          }
        });
      });
  }

  void onVideoCompleted() {
    videoController.pause();
    videoController.dispose();
    videoController = VideoPlayerController.asset(
      "assets/videos/JuneSilent.mp4",
    )..initialize().then((_) {
        videoController.play();
        videoController.setLooping(true);
        update();
      });
  }

  Widget content0() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () => doChangeVideo(1),
                text: 'video0_title',
                isFirst: true,
              ),
            ),
          ],
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget content1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video1_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    2,
                  );
                },
                text: 'video1_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    8,
                  );
                },
                text: 'video1_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    13,
                  );
                },
                text: 'video1_button3',
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: 'video1_button2',
                ),
              ),
            ),
          ],
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget content2() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video2_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    3,
                  );
                },
                text: 'video2_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    4,
                  );
                },
                text: 'video2_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    5,
                  );
                },
                text: 'video2_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    6,
                  );
                },
                text: 'video2_button4',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    7,
                  );
                },
                text: 'video2_button5',
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget content3() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        product3(),
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video3_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    4,
                  );
                },
                text: 'video3_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    5,
                  );
                },
                text: 'video3_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    6,
                  );
                },
                text: 'video3_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    7,
                  );
                },
                text: 'video3_button4',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video3_button5',
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget content4() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        product4(),
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video4_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    3,
                  );
                },
                text: 'video4_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    5,
                  );
                },
                text: 'video4_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    6,
                  );
                },
                text: 'video4_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    7,
                  );
                },
                text: 'video4_button4',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video4_button5',
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget content5() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        product5(),
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video5_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    3,
                  );
                },
                text: 'video5_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    4,
                  );
                },
                text: 'video5_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    6,
                  );
                },
                text: 'video5_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    7,
                  );
                },
                text: 'video5_button4',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video5_button5',
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget content6() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        product5(),
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video6_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    3,
                  );
                },
                text: 'video6_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    4,
                  );
                },
                text: 'video6_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    5,
                  );
                },
                text: 'video6_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    7,
                  );
                },
                text: 'video6_button4',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video6_button5',
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget content7() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        product7(),
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video7_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    3,
                  );
                },
                text: 'video7_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    4,
                  );
                },
                text: 'video7_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    5,
                  );
                },
                text: 'video7_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    6,
                  );
                },
                text: 'video7_button4',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video7_button5',
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget content8() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video8_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    9,
                  );
                },
                text: 'video8_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    10,
                  );
                },
                text: 'video8_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    11,
                  );
                },
                text: 'video8_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    12,
                  );
                },
                text: 'video8_button4',
              ),
            ),
          ],
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget content9() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video9_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    10,
                  );
                },
                text: 'video9_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    11,
                  );
                },
                text: 'video9_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    12,
                  );
                },
                text: 'video9_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video9_button4',
              ),
            ),
          ],
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {
                    null;
                  },
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget content10() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video10_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    9,
                  );
                },
                text: 'video10_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    11,
                  );
                },
                text: 'video10_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    12,
                  );
                },
                text: 'video10_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video10_button4',
              ),
            ),
          ],
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget content11() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video11_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    9,
                  );
                },
                text: 'video11_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    10,
                  );
                },
                text: 'video11_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    12,
                  );
                },
                text: 'video11_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video11_button4',
              ),
            ),
          ],
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget content12() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video12_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    9,
                  );
                },
                text: 'video12_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    10,
                  );
                },
                text: 'video12_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    11,
                  );
                },
                text: 'video12_button3',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video12_button4',
              ),
            ),
          ],
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget content13() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            Expanded(
              child: JuneButtons.primaryButton(
                onPressed: () {
                  update();
                },
                text: 'video13_title',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    2,
                  );
                },
                text: 'video13_button1',
              ),
            ),
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    8,
                  );
                },
                text: 'video13_button2',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: JuneButtons.secondaryButton(
                onPressed: () {
                  doChangeVideo(
                    1,
                  );
                },
                text: 'video13_button3',
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
            ),
          ],
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 24,
            children: [
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
              Expanded(
                child: JuneButtons.secondaryButton(
                  onPressed: () {},
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget product3() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video3_product1.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video3_product2.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video3_product3.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video3_product4.png",
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  Widget product4() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video4_product1.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video4_product2.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video4_product3.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video4_product4.png",
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  Widget product5() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video5_product1.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video5_product2.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video5_product3.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video5_product4.png",
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  Widget product6() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video6_product1.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video6_product2.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video6_product3.png",
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  Widget product7() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video7_product1.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video7_product2.png",
              height: 200,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/video7_product3.png",
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
