import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_ui/res/app_assets.dart';
import 'package:pokemon_ui/res/app_colors.dart';
import 'package:pokemon_ui/view/collections/collection_screen.dart';
import 'package:pokemon_ui/view/inventory/inventory_screen.dart';
import 'package:pokemon_ui/view/pokemon/pokemon_screen.dart';
import 'package:pokemon_ui/view/sets/sets_screen.dart';
import 'package:pokemon_ui/view/settings/setting_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CollectionsScreen(),
    SetsScreen(),
    PokemonScreen(),
    InventoryScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // 🔽 Background bar with items
          Container(
            height: 70,
            color: AppColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navItem(AppAssets.homeIconPng, "Collections", 0),
                _navItem(AppAssets.setsIconPng, "Sets", 1),
                _navItem(AppAssets.pokemonIconPng, "Pokémon", 2),
                _navItem(AppAssets.inventoryIconPng, "Inventory", 3),
                _navItem(AppAssets.settingsIconPng, "Setting", 4),
              ],
            ),
          ),
          // Raised Circular "Collections" Button at Left
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: -40,
            left: _getButtonLeftPosition(_selectedIndex),
            child: GestureDetector(
              onTap: () => _onItemTapped(_selectedIndex),
              child: Container(
                height: 84, // increased to account for border thickness
                width: 84,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF3AD963), // light green
                      Color(0xFF0D3317), // dark green
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2), // border thickness
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _getSelectedIconPath(_selectedIndex),
                          height: 20.h,
                          width: 20.w,
                          color: Colors.white,
                        ),
                        Text(
                          _getSelectedLabel(_selectedIndex),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Calculate left position dynamically
  double _getButtonLeftPosition(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / 5;

    // Apply a small offset for edge cases to fix alignment
    // double basePosition = (itemWidth * index) + (itemWidth / 2) - 10;
    double basePosition =
        (itemWidth * index) +
        (itemWidth / 2) -
        (index == 0
            ? 20
            : index == 1
            ? 25
            : 40);

    // Conditional offset based on index

    // Apply correction for left and right alignment issue
    if (index == 0) return basePosition - 8; // Slight push right
    if (index == 4) return basePosition - 4; // Slight pull left
    return basePosition;
  }

  String _getSelectedIconPath(int index) {
    switch (index) {
      case 0:
        return AppAssets.homeIconPng;
      case 1:
        return AppAssets.setsIconPng;
      case 2:
        return AppAssets.pokemonIconPng;
      case 3:
        return AppAssets.inventoryIconPng;
      case 4:
        return AppAssets.settingsIconPng;
      default:
        return AppAssets.homeIconPng;
    }
  }

  String _getSelectedLabel(int index) {
    switch (index) {
      case 0:
        return "Collections";
      case 1:
        return "Sets";
      case 2:
        return "Pokémon";
      case 3:
        return "Inventory";
      case 4:
        return "Setting";
      default:
        return "";
    }
  }

  Widget _navItem(String iconPath, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected
              ? const SizedBox(height: 24, width: 24)
              : Image.asset(
                iconPath,
                height: 24,
                width: 24,
                color: AppColors.whiteColor,
              ),
          SizedBox(height: 2.5),
          Text(
            isSelected ? '' : label,
            style: TextStyle(
              color:
                  isSelected ? AppColors.containerColor : AppColors.whiteColor,
              fontSize: 10.sp,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
