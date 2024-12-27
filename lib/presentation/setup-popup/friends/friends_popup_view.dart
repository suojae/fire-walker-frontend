import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fire_walker/di_container.dart'; // 의존성 주입 설정
import 'friends_popup_cubit.dart';

class FriendsPopupView extends StatelessWidget {
  const FriendsPopupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FriendsPopupCubit>(),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0E091C),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "친구 추가",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "친구 닉네임을 입력해주세요.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<FriendsPopupCubit, String?>(
                  builder: (context, nickname) {
                    return TextField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      onChanged: (value) {
                        context.read<FriendsPopupCubit>().updateNickname(value);
                      },
                      decoration: const InputDecoration(
                        hintText: "닉네임",
                        hintStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "취소",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    BlocBuilder<FriendsPopupCubit, String?>(
                      builder: (context, nickname) {
                        return TextButton(
                          onPressed: nickname == null || nickname.isEmpty
                              ? null
                              : () async {
                            try {
                              await context
                                  .read<FriendsPopupCubit>()
                                  .submitFriendRequest();
                              Navigator.of(context).pop();
                            } catch (e) {
                              // 에러 처리 (옵션)
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("친구 추가에 실패했습니다: $e"),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "확인",
                            style: TextStyle(
                              color: nickname == null || nickname.isEmpty
                                  ? Colors.white30
                                  : Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
