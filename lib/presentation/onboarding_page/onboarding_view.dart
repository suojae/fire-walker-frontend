import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:fire_walker/presentation/step_page/step_view.dart';

import '../../design/custom_rive.dart';

final class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _selectedSteps = 5000; // 초기값
  final TextEditingController _nicknameController = TextEditingController(); // 닉네임 컨트롤러

  @override
  void dispose() {
    _nicknameController.dispose(); // 사용이 끝나면 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E091C),
      body: IntroductionScreen(
        pages: [
          // 첫 번째 페이지: 닉네임 입력 텍스트 필드
          PageViewModel(
            title: "닉네임을 입력해주세요",
            bodyWidget: Column(
              children: [
                const Text(
                  "친구와 걸음수를 공유할 때 사용될거예요",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: TextField(
                    controller: _nicknameController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3),
                      ),
                      hintText: "닉네임을 입력하세요",
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                ),
              ],
            ),
            image: RiveWidget.runnerBoy(250, 250),
            decoration: getPageDecoration(),
          ),
          // 두 번째 페이지: 걸음수 목표 설정
          PageViewModel(
            title: "하루 걸음수를 정해주세요",
            bodyWidget: Column(
              children: [
                const Text(
                  "하루 5000보 이상을 권장드려요",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    final result = await showModalBottomSheet<int>(
                      context: context,
                      builder: (context) => _CupertinoStepPicker(
                        initialSteps: _selectedSteps,
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        _selectedSteps = result;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 3),
                      ),
                    ),
                    child: Text(
                      "$_selectedSteps 걸음",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            image: RiveWidget.runnerBoy(250, 250),
            decoration: getPageDecoration(),
          ),
          // 세 번째 페이지
          PageViewModel(
            title: "준비가 완료되었어요",
            body: "아래 버튼을 눌러 걷기운동을 시작해주세요!",
            image: RiveWidget.runnerBoy(250, 250),
            decoration: getPageDecoration(),
          ),
        ],
        done: const Text(
          '완료',
          style: TextStyle(color: Colors.white),
        ),
        onDone: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const StepView()),
          );
        },
        next: const Icon(Icons.arrow_forward, color: Colors.white),
        globalBackgroundColor: const Color(0xFF0E091C),
        showBackButton: true,
        back: const Text(
          '뒤로가기',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white70,
      ),
      imagePadding: EdgeInsets.only(top: 40),
      pageColor: Color(0xFF0E091C),
    );
  }
}

// 걸음수 피커
class _CupertinoStepPicker extends StatelessWidget {
  final int initialSteps;

  const _CupertinoStepPicker({required this.initialSteps, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedValue = initialSteps;

    return Container(
      height: 250,
      color: const Color(0xFF0E091C),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: (initialSteps ~/ 1000) - 1,
              ),
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                selectedValue = (index + 1) * 1000;
              },
              children: List<Widget>.generate(
                50,
                    (index) => Center(
                  child: Text(
                    "${(index + 1) * 1000} 걸음",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(selectedValue);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "설정",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
