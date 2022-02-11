import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  const BottomNavBar({required this.icon, required this.isActive, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Icon(
          icon,
          size: 26,
          color: isActive ? const Color(0xff7F74EB) : const Color(0xff989BA1),
        ),
        const Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                  color: Color(0xff7F74EB),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
