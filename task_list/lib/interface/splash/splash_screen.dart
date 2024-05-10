import 'package:easy_localization/easy_localization.dart';
import 'package:task_list/interface/widgets/base_page.dart';
import 'package:task_list/providers/router_provider.dart';
import 'package:task_list/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        context.replace(Routes.main);
      }
    });
    return BasePage(
      resizeToAvoidBottomInset: true,
      childBody: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AppImages.logo,
                    width: 100,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'app.name'.tr(),
                      style: Theme.of(context).textTheme.headlineLarge,
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
