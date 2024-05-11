import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_list/theme/app_images.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 19, left: 32, bottom: 30),
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(20),
            child: const Image(
              fit: BoxFit.cover,
              image: AppImages.profile,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${'home.hello'.tr()}, Göksu',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'goksueren5@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
