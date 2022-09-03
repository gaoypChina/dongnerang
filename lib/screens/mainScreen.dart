import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incom/screens/mypage.screen.dart';

import '../constants/colors.constants.dart';
import '../controller/HomeController.dart';
import '../controller/NavigationController.dart';
import 'crawling.screen.dart';
import 'freeComponent_viewpage.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => mainScreenState();
}

class mainScreenState extends State<mainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());
    Get.put(HomeController());
    final navigationController = Get.find<NavigationController>();
    print(navigationController.currentBottomMenuIndex);
    return Scaffold(
      bottomNavigationBar: Obx(
              () => Offstage(
                offstage:HomeController.to.hideBottomMenu.value,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BottomNavigationBar(
                      showUnselectedLabels: true,
                      showSelectedLabels: true,
                      selectedLabelStyle: const TextStyle(color: Colors.red),
                      selectedItemColor: AppColors.primary,
                      unselectedItemColor: AppColors.grey,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.ac_unit),
                          label: "홈",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.ac_unit),
                          label: "마이페이지"
                        )
                      ],
                      onTap: (index) {
                        navigationController.currentBottomMenuIndex.value = index;
                        setState(() {});
                      },
                    )
                  ],
                ),
              )
      ),
      body: Obx(
          () => IndexedStack(
            index: navigationController.currentBottomMenuIndex.value,
            children: const[
              freeComponent_viewpage(),
              // crawlingScreen(),
              mypageScreen(),
            ],
          )
      ),
    );
  }
}
