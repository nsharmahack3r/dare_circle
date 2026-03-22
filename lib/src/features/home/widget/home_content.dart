import 'package:dare_circle/src/features/game/view/create_game_view.dart';
import 'package:dare_circle/src/features/home/widget/game_action_button.dart';
import 'package:dare_circle/src/features/home/widget/room_id_field.dart';
import 'package:dare_circle/src/features/home/widget/user_card.dart';
import 'package:dare_circle/src/resources/app_colors.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final _roomIdController = TextEditingController();

  @override
  void dispose() {
    _roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const UserCard(),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ).createShader(bounds),
                child: const Text(
                  'Dare Circle',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Watch Every Step',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.5),
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 48),

              // Divider with "JOIN A GAME" label
              _buildSectionLabel('JOIN A GAME'),
              const SizedBox(height: 16),

              RoomIdField(controller: _roomIdController),
              const SizedBox(height: 16),

              GameActionButton(
                label: 'JOIN ROOM',
                icon: Icons.login_rounded,
                onPressed: () {
                  // TODO: join room logic
                },
              ),

              const SizedBox(height: 40),

              // Divider with "OR" label
              _buildDividerWithText('OR'),
              const SizedBox(height: 40),

              _buildSectionLabel('START FRESH'),
              const SizedBox(height: 16),

              GameActionButton(
                label: 'CREATE GAME',
                icon: Icons.add_circle_outline_rounded,
                isPrimary: false,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CreateGameView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white.withValues(alpha: 0.4),
        letterSpacing: 3,
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0),
                  Colors.white.withValues(alpha: 0.15),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.3),
              letterSpacing: 2,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.15),
                  Colors.white.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
