import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class BudgetAdjustSheet extends StatelessWidget {
  const BudgetAdjustSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return hbox(
      bg: Color(0xFFFFFFFF),
      radius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
        bottomRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
      ),
      pad: EdgeInsets.fromLTRB(20, 10, 20, bottomInset(context)),
      child: hcol(
        [
          Align(
            alignment: Alignment.topCenter,
            child: hbox(
              w: 40,
              h: 5,
              bg: Color(0xFFD4D4D8),
              radius: BorderRadius.circular(3),
            ),
          ),
          Text(
            '追加预算 · 材料采购',
            style: hts(20, Color(0xFF18181B), w: FontWeight.w600, lh: 28),
          ),
          HSelHolder(
            groups: [
              ({2}, false),
            ],
            builder: (context, g1) => hrow(
              [
                Expanded(
                  flex: 1,
                  child: HSel(
                    ctrl: g1[0],
                    index: 0,
                    on: hbox(
                      bg: Color(0xFFFFE1E2),
                      radius: BorderRadius.circular(16),
                      pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: hcol(
                        [
                          Text(
                            '当前预算',
                            style: hts(11, Color(0xFF71717A), lh: 14),
                          ),
                          Text(
                            '¥32,000',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 2,
                      ),
                    ),
                    off: hbox(
                      bg: Color(0xFFF4F4F5),
                      radius: BorderRadius.circular(16),
                      pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: hcol(
                        [
                          Text(
                            '当前预算',
                            style: hts(11, Color(0xFF71717A), lh: 14),
                          ),
                          Text(
                            '¥32,000',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HSel(
                    ctrl: g1[0],
                    index: 1,
                    on: hbox(
                      bg: Color(0xFFFFE1E2),
                      radius: BorderRadius.circular(16),
                      pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: hcol(
                        [
                          Text('已用', style: hts(11, Color(0xFF71717A), lh: 14)),
                          Text(
                            '¥36,570',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 2,
                      ),
                    ),
                    off: hbox(
                      bg: Color(0xFFF4F4F5),
                      radius: BorderRadius.circular(16),
                      pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: hcol(
                        [
                          Text('已用', style: hts(11, Color(0xFF71717A), lh: 14)),
                          Text(
                            '¥36,570',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HSel(
                    ctrl: g1[0],
                    index: 2,
                    on: hbox(
                      bg: Color(0xFFFFE1E2),
                      radius: BorderRadius.circular(16),
                      pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: hcol(
                        [
                          Text('超支', style: hts(11, Color(0xFFA43433), lh: 14)),
                          Text(
                            '¥4,570',
                            style: hts(
                              15,
                              Color(0xFFA43433),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 2,
                      ),
                    ),
                    off: hbox(
                      bg: Color(0xFFF4F4F5),
                      radius: BorderRadius.circular(16),
                      pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: hcol(
                        [
                          Text('超支', style: hts(11, Color(0xFFA43433), lh: 14)),
                          Text(
                            '¥4,570',
                            style: hts(
                              15,
                              Color(0xFFA43433),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 2,
                      ),
                    ),
                  ),
                ),
              ],
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.stretch,
              gap: 8,
              intrinsic: true,
            ),
          ),
          hcol(
            [
              Text(
                '追加金额',
                style: hts(14, Color(0xFF18181B), w: FontWeight.w600, lh: 20),
              ),
              hrow(
                [
                  Text(
                    '¥',
                    style: hts(
                      22,
                      Color(0xFF71717A),
                      w: FontWeight.w600,
                      lh: 30,
                    ),
                  ),
                  Expanded(
                    child: hbox(
                      minW: 0,
                      child: HInput(
                        style: hts(
                          32,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 40,
                          tab: true,
                        ),
                        value: '5,000',
                        keyboard: TextInputType.number,
                      ),
                    ),
                  ),
                ],
                main: MainAxisAlignment.start,
                cross: CrossAxisAlignment.baseline,
                gap: 6,
              ),
              HSelHolder(
                groups: [
                  ({1}, false),
                ],
                builder: (context, g2) => hwrap(
                  [
                    HSel(
                      ctrl: g2[0],
                      index: 0,
                      on: hbox(
                        h: 34,
                        bg: Color(0xFFE1F0FE),
                        radius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Color(0xFF0485F7),
                          width: 1.5,
                        ),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '补齐超支 ¥4,570',
                            style: hts(
                              13,
                              Color(0xFF1E63AE),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                      off: hbox(
                        h: 34,
                        bg: Color(0xFFF4F4F5),
                        radius: BorderRadius.circular(17),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '补齐超支 ¥4,570',
                            style: hts(
                              13,
                              Color(0xFF3F3F46),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    HSel(
                      ctrl: g2[0],
                      index: 1,
                      on: hbox(
                        h: 34,
                        bg: Color(0xFFE1F0FE),
                        radius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Color(0xFF0485F7),
                          width: 1.5,
                        ),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '¥5,000',
                            style: hts(
                              13,
                              Color(0xFF1E63AE),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                      off: hbox(
                        h: 34,
                        bg: Color(0xFFF4F4F5),
                        radius: BorderRadius.circular(17),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '¥5,000',
                            style: hts(
                              13,
                              Color(0xFF3F3F46),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    HSel(
                      ctrl: g2[0],
                      index: 2,
                      on: hbox(
                        h: 34,
                        bg: Color(0xFFE1F0FE),
                        radius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Color(0xFF0485F7),
                          width: 1.5,
                        ),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '¥8,000',
                            style: hts(
                              13,
                              Color(0xFF1E63AE),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                      off: hbox(
                        h: 34,
                        bg: Color(0xFFF4F4F5),
                        radius: BorderRadius.circular(17),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '¥8,000',
                            style: hts(
                              13,
                              Color(0xFF3F3F46),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  gap: 8,
                  rowGap: 8,
                  cross: WrapCrossAlignment.start,
                ),
              ),
            ],
            main: MainAxisAlignment.start,
            cross: CrossAxisAlignment.stretch,
            gap: 8,
          ),
          hcol(
            [
              hbox(
                pad: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  '资金来源',
                  style: hts(14, Color(0xFF18181B), w: FontWeight.w600, lh: 20),
                ),
              ),
              HSelHolder(
                groups: [
                  ({1}, false),
                ],
                builder: (context, g3) => hwrap(
                  [
                    HSel(
                      ctrl: g3[0],
                      index: 0,
                      on: hbox(
                        h: 34,
                        bg: Color(0xFFE1F0FE),
                        radius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Color(0xFF0485F7),
                          width: 1.5,
                        ),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '总预算余额 ¥3,930',
                            style: hts(
                              13,
                              Color(0xFF1E63AE),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                      off: hbox(
                        h: 34,
                        bg: Color(0xFFF4F4F5),
                        radius: BorderRadius.circular(17),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '总预算余额 ¥3,930',
                            style: hts(
                              13,
                              Color(0xFF3F3F46),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    HSel(
                      ctrl: g3[0],
                      index: 1,
                      on: hbox(
                        h: 34,
                        bg: Color(0xFFE1F0FE),
                        radius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Color(0xFF0485F7),
                          width: 1.5,
                        ),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '其他分类调剂',
                            style: hts(
                              13,
                              Color(0xFF1E63AE),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                      off: hbox(
                        h: 34,
                        bg: Color(0xFFF4F4F5),
                        radius: BorderRadius.circular(17),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '其他分类调剂',
                            style: hts(
                              13,
                              Color(0xFF3F3F46),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    HSel(
                      ctrl: g3[0],
                      index: 2,
                      on: hbox(
                        h: 34,
                        bg: Color(0xFFE1F0FE),
                        radius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Color(0xFF0485F7),
                          width: 1.5,
                        ),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '追加总预算',
                            style: hts(
                              13,
                              Color(0xFF1E63AE),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                      off: hbox(
                        h: 34,
                        bg: Color(0xFFF4F4F5),
                        radius: BorderRadius.circular(17),
                        pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Text(
                            '追加总预算',
                            style: hts(
                              13,
                              Color(0xFF3F3F46),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  gap: 8,
                  rowGap: 8,
                  cross: WrapCrossAlignment.start,
                ),
              ),
            ],
            main: MainAxisAlignment.start,
            cross: CrossAxisAlignment.stretch,
            gap: 0,
          ),
          HStrHolder(
            initial: '可调剂 ¥2,200',
            builder: (context, s4) => hTap(
              context,
              hbox(
                bg: Color(0xFFF4F4F5),
                radius: BorderRadius.circular(16),
                pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                child: hrow(
                  [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '从 营销 调剂',
                        style: hts(14, Color(0xFF18181B), lh: 20),
                      ),
                    ),
                    hStr(s4, hts(13, Color(0xFF71717A), lh: 18)),
                    hsvg(Svgs.s9, w: 16, h: 16),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 12,
                ),
              ),
              onTap: () => hPick(context, 'budgetFrom', '从 营销 调剂', s4),
            ),
          ),
          hcol(
            [
              Text(
                '追加原因',
                style: hts(14, Color(0xFF18181B), w: FontWeight.w600, lh: 20),
              ),
              hbox(
                minH: 56,
                bg: Color(0xFFF4F4F5),
                radius: BorderRadius.circular(14),
                pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: HInput(
                  style: hts(14, Color(0xFF18181B), lh: 20),
                  maxLines: 4,
                  value: '10 月接了两台全车隐形车衣，贴膜材料集中采购',
                ),
              ),
            ],
            main: MainAxisAlignment.start,
            cross: CrossAxisAlignment.stretch,
            gap: 6,
          ),
          hbox(
            pad: EdgeInsets.fromLTRB(0, 4, 0, 0),
            child: hrow(
              [
                Expanded(
                  flex: 1,
                  child: hTap(
                    context,
                    hbox(
                      h: 50,
                      bg: Color(0xFFEEEEF0),
                      radius: BorderRadius.circular(25),
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '取消',
                          style: hts(
                            15,
                            Color(0xFF18181B),
                            w: FontWeight.w500,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'ExpenseBudget',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: hTap(
                    context,
                    hbox(
                      h: 50,
                      bg: Color(0xFF18181B),
                      radius: BorderRadius.circular(25),
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '确认追加',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'ExpenseBudget',
                  ),
                ),
              ],
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.stretch,
              gap: 10,
              intrinsic: true,
            ),
          ),
        ],
        main: MainAxisAlignment.start,
        cross: CrossAxisAlignment.stretch,
        gap: 16,
      ),
    );
  }
}
