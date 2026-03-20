import 'dart:math';

import 'package:dare_circle/src/features/game/widget/dare_category_chip.dart';
import 'package:dare_circle/src/features/game/widget/game_setting_tile.dart';
import 'package:dare_circle/src/features/game/widget/player_count_selector.dart';
import 'package:dare_circle/src/features/game/widget/room_code_display.dart';
import 'package:dare_circle/src/features/home/widget/animated_background.dart';
import 'package:dare_circle/src/features/home/widget/game_action_button.dart';
import 'package:dare_circle/src/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CreateGameView extends StatefulWidget {
  const CreateGameView({super.key});

  static const routePath = "/create-game";

  @override
  State<CreateGameView> createState() => _CreateGameViewState();
}

class _CreateGameViewState extends State<CreateGameView> {
  int _playerCount = 4;
  int _rounds = 3;
  int _timerSeconds = 30;
  final Set<String> _selectedCategories = {'Fun', 'Silly'};

  final List<String> _allCategories = [
    'Fun',
    'Silly',
    'Brave',
    'Creative',
    'Spicy',
    'Athletic',
  ];

  String get _roomCode {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final rng = Random();
    return List.generate(6, (_) => chars[rng.nextInt(chars.length)]).join();
  }

  late final String _generatedCode = _roomCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Column(
              children: [
                // App bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.white,
                        iconSize: 24,
                      ),
                      const Spacer(),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.primary, AppColors.secondary],
                        ).createShader(bounds),
                        child: const Text(
                          'CREATE GAME',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Room code
                        Text(
                          'YOUR ROOM CODE',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.4),
                            letterSpacing: 3,
                          ),
                        ),
                        const SizedBox(height: 12),
                        RoomCodeDisplay(code: _generatedCode),
                        const SizedBox(height: 8),
                        Text(
                          'Share this code with friends to join',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),

                        const SizedBox(height: 36),
                        _buildSectionHeader('GAME SETTINGS'),
                        const SizedBox(height: 16),

                        // Player count
                        PlayerCountSelector(
                          count: _playerCount,
                          onChanged: (v) => setState(() => _playerCount = v),
                        ),
                        const SizedBox(height: 12),

                        // Rounds
                        GameSettingTile(
                          icon: Icons.repeat_rounded,
                          label: 'ROUNDS',
                          value: '$_rounds rounds',
                          onTap: () => _showRoundsPicker(),
                        ),
                        const SizedBox(height: 12),

                        // Timer
                        GameSettingTile(
                          icon: Icons.timer_outlined,
                          label: 'DARE TIMER',
                          value: '${_timerSeconds}s per dare',
                          onTap: () => _showTimerPicker(),
                        ),

                        const SizedBox(height: 36),
                        _buildSectionHeader('DARE CATEGORIES'),
                        const SizedBox(height: 16),

                        // Category chips
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: _allCategories.map((category) {
                            return DareCategoryChip(
                              label: category,
                              isSelected:
                                  _selectedCategories.contains(category),
                              onTap: () {
                                setState(() {
                                  if (_selectedCategories
                                      .contains(category)) {
                                    if (_selectedCategories.length > 1) {
                                      _selectedCategories.remove(category);
                                    }
                                  } else {
                                    _selectedCategories.add(category);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Select at least one category',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Start game button
                        GameActionButton(
                          label: 'START GAME',
                          icon: Icons.play_arrow_rounded,
                          onPressed: () {
                            // TODO: start game logic
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white.withValues(alpha: 0.4),
          letterSpacing: 3,
        ),
      ),
    );
  }

  void _showRoundsPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.neutral,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'SELECT ROUNDS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [1, 2, 3, 5, 7, 10].map((rounds) {
                  final isSelected = rounds == _rounds;
                  return GestureDetector(
                    onTap: () {
                      setState(() => _rounds = rounds);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: isSelected
                            ? const LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.secondary,
                                ],
                              )
                            : null,
                        color: isSelected
                            ? null
                            : Colors.white.withValues(alpha: 0.07),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.white.withValues(alpha: 0.12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$rounds',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showTimerPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.neutral,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'DARE TIMER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [15, 30, 45, 60, 90, 120].map((seconds) {
                  final isSelected = seconds == _timerSeconds;
                  final label = seconds >= 60
                      ? '${seconds ~/ 60}m${seconds % 60 > 0 ? ' ${seconds % 60}s' : ''}'
                      : '${seconds}s';
                  return GestureDetector(
                    onTap: () {
                      setState(() => _timerSeconds = seconds);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 72,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: isSelected
                            ? const LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.secondary,
                                ],
                              )
                            : null,
                        color: isSelected
                            ? null
                            : Colors.white.withValues(alpha: 0.07),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.white.withValues(alpha: 0.12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
