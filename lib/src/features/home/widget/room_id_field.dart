import 'package:dare_circle/src/resources/app_colors.dart';
import 'package:flutter/material.dart';

class RoomIdField extends StatelessWidget {
  const RoomIdField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 1.5,
        ),
        color: Colors.white.withValues(alpha: 0.07),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 6,
        ),
        decoration: InputDecoration(
          hintText: 'ENTER ROOM CODE',
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.3),
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
          ),
          filled: false,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          prefixIcon: Icon(
            Icons.tag,
            color: AppColors.primary.withValues(alpha: 0.5),
            size: 22,
          ),
        ),
        textCapitalization: TextCapitalization.characters,
      ),
    );
  }
}
