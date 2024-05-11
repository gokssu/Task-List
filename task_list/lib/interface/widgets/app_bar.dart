import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list/theme/app_images.dart';

class AppBarNav extends StatelessWidget implements PreferredSizeWidget {
  const AppBarNav({
    required this.title,
    super.key,
    this.back,
  });
  final String title;
  final bool? back;

  @override
  Widget build(BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        title: Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20)),
        leading: true == back
            ? IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Image(
                  width: 20,
                  height: 20,
                  image: AppImages.rightArrow,
                ),
              )
            : null,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
