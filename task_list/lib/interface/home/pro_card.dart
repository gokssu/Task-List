import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_list/theme/app_images.dart';
import 'package:task_list/theme/custom_colors.dart';

class ProCard extends StatelessWidget {
  const ProCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 24, bottom: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).extension<CustomColors>()!.proColor!,
            border: Border.all(
              width: 2,
              color: Theme.of(context).extension<CustomColors>()!.proColorBorder!,
            ),
          ),
          child: Row(
            children: [
              const Image(
                image: AppImages.pro,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: SizedBox(
                  width: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'home.pro_title'.tr(),
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Theme.of(context).colorScheme.outlineVariant,
                            ),
                      ),
                      Text(
                        'home.pro_subtitle'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.outlineVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            width: 65,
            height: 71,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            child: Center(
              child: Text('home.money'.tr(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).extension<CustomColors>()!.moneyColor!,
                      )),
            ),
          ),
        )
      ],
    );
  }
}
