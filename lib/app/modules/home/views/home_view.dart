import 'package:flutter/material.dart';
import 'package:task_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';
import 'package:task_management_app/app/utils/widget/Header.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/UpcomingTask.dart';
import 'package:task_management_app/app/utils/widget/myFriends.dart';
import 'package:task_management_app/app/utils/widget/myTask.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
          children: [
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: SideBar(),
                  )
                : const SizedBox(),
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const Header()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Flutter Management",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primaryText),
                                  ),
                                  Text(
                                    "Manage Task easily",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryText),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.notifications,
                                  color: AppColors.primaryText, size: 30),
                              const SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      "https://www.seputargame.com/wp-content/uploads/2022/04/20210720_150110.jpg"),
                                ),
                              ),
                            ],
                          ),
                        ),
                  // Content Page Screen
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(20)
                          : const EdgeInsets.all(20),
                      margin: !context.isPhone
                          ? const EdgeInsets.all(10)
                          : const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.26,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "My Tasks",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.secondaryText,
                                  ),
                                ),

                                // my task
                                MyTask(),
                              ],
                            ),
                          ),
                          // Upcoming & My friends
                          !context.isPhone
                              ? Expanded(
                                  child: Row(
                                    children: const [
                                      UpcomingTask(),
                                      MyFriends(),
                                    ],
                                  ),
                                )
                              : const UpcomingTask(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
