import 'package:flutter/material.dart';

/// 收起软键盘。
void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

/// 点击输入框之外的区域时收起键盘（用于所有 TextField 的 onTapOutside）。
void onTapOutsideDismiss(PointerDownEvent _) => dismissKeyboard();

/// 全局包裹：键盘弹出时，在键盘上方显示一条「完成」工具栏。
/// iOS 的数字键盘没有“完成/收起”键，没有这条栏就无法关闭键盘。
class KeyboardDoneBar extends StatelessWidget {
  final Widget child;
  const KeyboardDoneBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final kb = MediaQuery.of(context).viewInsets.bottom;
    return Stack(
      children: [
        child,
        if (kb > 0)
          Positioned(
            left: 0,
            right: 0,
            bottom: kb,
            child: Material(
              color: const Color(0xFFF2F2F7),
              elevation: 0,
              child: Container(
                height: 44,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFFD1D1D6), width: 0.5),
                  ),
                ),
                child: TextButton(
                  onPressed: dismissKeyboard,
                  child: const Text(
                    '完成',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0485F7),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
