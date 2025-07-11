import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/main_screen_controller.dart';
import '../../video_input/views/video_input_view.dart';
import '../../subtitle_editor/views/subtitle_editor_view.dart';
import '../../prompt_manager/views/prompt_manager_view.dart';
import '../../app_settings/views/app_settings_view.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            VideoInputView(), // Tab 0
            SubtitleEditorView(), // Tab 1
            PromptManagerView(), // Tab 2
            AppSettingsView(), // Tab 3
          ],
        ),
      ),
      bottomNavigationBar: _buildResponsiveNavBar(),
    );
  }

  Widget _buildResponsiveNavBar() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return _buildMobileNavBar();
        } else {
          return _buildTabletNavBar();
        }
      },
    );
  }

  Widget _buildMobileNavBar() {
    final isDark = Theme.of(Get.context!).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.r,
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(0, Iconsax.video, 'Videos', true),
                _buildNavItem(1, Iconsax.edit, 'Editor', true),
                _buildNavItem(2, Iconsax.message_text, 'Prompts', true),
                _buildNavItem(3, Iconsax.setting_2, 'Settings', true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabletNavBar() {
    final isDark = Theme.of(Get.context!).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.r,
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Obx(() {
            final isDark = Theme.of(Get.context!).brightness == Brightness.dark;
            return GNav(
              rippleColor: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              hoverColor: isDark ? Colors.grey[800]! : Colors.grey[100]!,
              gap: 8.w,
              activeColor: Theme.of(Get.context!).colorScheme.primary,
              iconSize: 24.r,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: isDark
                  ? Colors.grey[800]!
                  : Colors.grey[100]!,
              color: Theme.of(Get.context!).colorScheme.onSurface,
              tabs: [
                GButton(
                  icon: Iconsax.video,
                  text: 'Videos',
                  textStyle: TextStyle(fontSize: 12.sp),
                ),
                GButton(
                  icon: Iconsax.edit,
                  text: 'Editor',
                  textStyle: TextStyle(fontSize: 12.sp),
                ),
                GButton(
                  icon: Iconsax.message_text,
                  text: 'Prompts',
                  textStyle: TextStyle(fontSize: 12.sp),
                ),
                GButton(
                  icon: Iconsax.setting_2,
                  text: 'Settings',
                  textStyle: TextStyle(fontSize: 12.sp),
                ),
              ],
              selectedIndex: controller.currentIndex.value,
              onTabChange: (index) {
                controller.changeTabIndex(index);
              },
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, bool isMobile) {
    final isSelected = controller.currentIndex.value == index;
    final theme = Theme.of(Get.context!);

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTabIndex(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 4.w : 8.w,
            vertical: isMobile ? 6.h : 8.h,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? theme.colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: isMobile ? 18.r : 20.r,
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              SizedBox(height: 2.h),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: isMobile ? 9.sp : 10.sp,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withOpacity(0.6),
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
