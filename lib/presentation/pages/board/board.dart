import 'package:cocomu/app/utils/styles/dimens.dart';
import 'package:cocomu/app/widgets/app.snak_bar.dart';
import 'package:cocomu/presentation/controllers/board/board_controller.dart';
import 'package:cocomu/presentation/pages/board/widgets/cocomu_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Board extends GetView<BoardController> {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Obx(() {
            return IndexedStack(
              index: controller.pos[Pos.cur],
              children: [
                CocomuWebview(
                  controller: controller.webViewControllers[0],
                  loading: controller.loadings[0],
                ),
                CocomuWebview(
                  controller: controller.webViewControllers[1],
                  loading: controller.loadings[1],
                ),
                CocomuWebview(
                  controller: controller.webViewControllers[2],
                  loading: controller.loadings[2],
                )
              ],
            );
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimens.size(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Container(
                    width: 50, // 원의 지름
                    height: 50, // 원의 지름
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          if (controller.prevUrls.isEmpty) {
                            notifyNoItems();
                          } else {
                            controller.moveToPrev();
                          }
                        }),
                  ),
                  const Spacer(),
                  Container(
                    width: 50, // 원의 지름
                    height: 50, // 원의 지름
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black, // 검정색 배경
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward,
                          color: Colors.white), // 아이콘의 색상을 흰색으로 설정
                      onPressed: controller.moveToNext,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
          // Positioned(
          //   bottom: 0,
          //   top: MediaQuery.of(context).size.height / 2,
          //   child: Container(
          //     width: 50, // 원의 지름
          //     height: 50, // 원의 지름
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.black, // 검정색 배경
          //     ),
          //     child: IconButton(
          //       icon: const Icon(Icons.arrow_back,
          //           color: Colors.white), // 아이콘의 색상을 흰색으로 설정
          //       onPressed: controller.moveToNext,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   top: MediaQuery.of(context).size.height / 2,
          //   child: Container(
          //     width: 50, // 원의 지름
          //     height: 50, // 원의 지름
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.black, // 검정색 배경
          //     ),
          //     child: IconButton(
          //       icon: const Icon(Icons.arrow_back,
          //           color: Colors.white), // 아이콘의 색상을 흰색으로 설정
          //       onPressed: controller.moveToNext,
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
