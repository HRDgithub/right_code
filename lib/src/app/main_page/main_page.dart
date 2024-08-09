import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:right_code_app/src/app/main_page/widgets/bottom_nav_item.dart';
import 'package:right_code_app/src/app/main_page/widgets/custom_logo_app_bar.dart';
import 'package:right_code_app/src/app/profile/profile_page.dart';
import 'package:right_code_app/src/app/recipes/presentation/add_edit_item_recipes_page.dart';
import 'package:right_code_app/src/app/recipes/presentation/my_recipes_page.dart';
import 'package:right_code_app/src/app/refrigerator/presentation/add_edit_item_refrigerator_page.dart';
import 'package:right_code_app/src/app/refrigerator/presentation/my_refrigerator_page.dart';
import 'package:right_code_app/src/app/storage_tips/presentation/add_edit_item_storage_tips.dart';
import 'package:right_code_app/src/app/storage_tips/presentation/my_storage_tips_page.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';

class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);

    final pages = [
      const Center(
        child: MyRefrigeratorPage(),
      ),
      const Center(
        child: RecipesPage(),
      ),
      const Center(
        child: MyStorageTipsPage(),
      ),
      const Center(
        child: ProfilePage(),
      ),
    ];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 80),
          child: const CustomAppBar()),
      floatingActionButton: BoxButton(
        width: 60,
        height: 60,
        onPressed: () async {
          switch (currentIndex.value) {
            case 0:
              await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AddEditItemRefrigeratorPage();
                },
              ));
            case 1:
              await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AddEditItemRecipesPage();
                },
              ));
            case 2:
              await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AddEditItemStorageTipPage();
                },
              ));

            default:
          }
        },
        bgColor: AppTheme.buttonColor,
        bgColorOpacity: 1,
        raduis: AppTheme.raduisCirlce,
        child: const Icon(
          FontAwesome.plus_solid,
          color: AppTheme.whiteText,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 80,
        backgroundColor: AppTheme.primary,
        activeIndex: currentIndex.value,
        leftCornerRadius: 8,
        rightCornerRadius: 8,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {
          currentIndex.value = index;
        },

        //* Custom Icons
        itemCount: pages.length,
        tabBuilder: (index, isActive) {
          switch (index) {
            case 0:
              return BottomNavItem(
                isActive: isActive,
                iconPath: "assets/imgs/refrigerator.png",
                title: 'Fridge',
              );
            case 1:
              return BottomNavItem(
                isActive: isActive,
                iconPath: "assets/imgs/recipes.png",
                title: 'Recipes',
              );
            case 2:
              return BottomNavItem(
                isActive: isActive,
                iconPath: "assets/imgs/tips.png",
                title: 'Tips',
              );
            case 3:
              return BottomNavItem(
                isActive: isActive,
                iconPath: "assets/imgs/user.png",
                title: 'Profile',
              );
            default:
              return Container();
          }
        },
      ),
      body: pages[currentIndex.value],
    );
  }
}
