import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/utils/style/AppColor.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: !context.isPhone
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 150,
                      foregroundImage: NetworkImage(
                          "https://www.seputargame.com/wp-content/uploads/2022/04/20210720_150110.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Windah Mikasa",
                        style: TextStyle(
                          fontSize: 40,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Text(
                        "Gamer",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 150,
                      foregroundImage: NetworkImage(
                          "https://www.seputargame.com/wp-content/uploads/2022/04/20210720_150110.jpg"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Windah Mikasa",
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const Text(
                    "Gamer",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
