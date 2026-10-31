import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class BudgetTotalPage extends StatelessWidget {
  const BudgetTotalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1760,
      fixedHeight: false,
      flow: hcol(
        [
          hbox(
            pad: EdgeInsets.fromLTRB(20, topInset(context), 20, 120),
            child: hcol(
              [
                hrow(
                  [
                    hTap(
                      context,
                      hbox(
                        w: 44,
                        h: 44,
                        bg: Color(0xFFFFFFFF),
                        radius: BorderRadius.circular(22),
                        shadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.04),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            offset: Offset(0, 0),
                            blurRadius: 1,
                            spreadRadius: 0,
                          ),
                        ],
                        child: hrow(
                          [hsvg(Svgs.s10, w: 20, h: 20)],
                          main: MainAxisAlignment.center,
                          cross: CrossAxisAlignment.center,
                          gap: 0,
                        ),
                      ),
                      back: true,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '调整预算',
                        style: hts(
                          17,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    hTap(
                      context,
                      hbox(
                        h: 44,
                        minW: 44,
                        child: Align(
                          alignment: Alignment(1, 0),
                          widthFactor: 1,
                          child: Text(
                            '保存',
                            style: hts(
                              15,
                              Color(0xFF0485F7),
                              w: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      to: 'ExpenseBudget',
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hbox(
                  bg: Color(0xFFFFFFFF),
                  radius: BorderRadius.circular(24),
                  shadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ],
                  pad: EdgeInsets.fromLTRB(18, 18, 18, 18),
                  child: hcol(
                    [
                      Text(
                        '10 月总预算（元）',
                        style: hts(13, Color(0xFF71717A), lh: 18),
                      ),
                      hrow(
                        [
                          Text(
                            '¥',
                            style: hts(
                              26,
                              Color(0xFF71717A),
                              w: FontWeight.w600,
                              lh: 34,
                            ),
                          ),
                          Expanded(
                            child: hbox(
                              minW: 0,
                              child: HInput(
                                style: hts(
                                  38,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 46,
                                  ls: -1.14,
                                  tab: true,
                                ),
                                value: '171,000',
                                keyboard: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.baseline,
                        gap: 6,
                      ),
                      hwrap(
                        [
                          hbox(
                            bg: Color(0xFFE1F0FE),
                            radius: BorderRadius.circular(9),
                            pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Text(
                              '较上月预算 +3.6%',
                              style: hts(
                                11,
                                Color(0xFF1E63AE),
                                w: FontWeight.w600,
                                lh: 18,
                              ),
                            ),
                          ),
                          hbox(
                            bg: Color(0xFFEEEEF0),
                            radius: BorderRadius.circular(9),
                            pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Text(
                              '占预计营收 52.1%',
                              style: hts(
                                11,
                                Color(0xFF52525B),
                                w: FontWeight.w600,
                                lh: 18,
                              ),
                            ),
                          ),
                        ],
                        gap: 8,
                        rowGap: 8,
                        cross: WrapCrossAlignment.start,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 10,
                  ),
                ),
                hbox(
                  bg: Color(0xFFFFFFFF),
                  radius: BorderRadius.circular(24),
                  shadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ],
                  pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: hcol(
                    [
                      Text(
                        '分配方式',
                        style: hts(
                          14,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 20,
                        ),
                      ),
                      HSelHolder(
                        groups: [
                          ({0}, false),
                        ],
                        builder: (context, g1) => hwrap(
                          [
                            HSel(
                              ctrl: g1[0],
                              index: 0,
                              on: hTap(
                                context,
                                hbox(
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
                                      '手动分配',
                                      style: hts(
                                        13,
                                        Color(0xFF1E63AE),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
                                hbox(
                                  h: 34,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(17),
                                  pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '手动分配',
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
                            ),
                            HSel(
                              ctrl: g1[0],
                              index: 1,
                              on: hTap(
                                context,
                                hbox(
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
                                      '沿用上月预算',
                                      style: hts(
                                        13,
                                        Color(0xFF1E63AE),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
                                hbox(
                                  h: 34,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(17),
                                  pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '沿用上月预算',
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
                            ),
                            HSel(
                              ctrl: g1[0],
                              index: 2,
                              on: hTap(
                                context,
                                hbox(
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
                                      '按上月实际',
                                      style: hts(
                                        13,
                                        Color(0xFF1E63AE),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
                                hbox(
                                  h: 34,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(17),
                                  pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '按上月实际',
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
                            ),
                            HSel(
                              ctrl: g1[0],
                              index: 3,
                              on: hTap(
                                context,
                                hbox(
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
                                      '按营收比例',
                                      style: hts(
                                        13,
                                        Color(0xFF1E63AE),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
                                hbox(
                                  h: 34,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(17),
                                  pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '按营收比例',
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
                            ),
                          ],
                          gap: 8,
                          rowGap: 8,
                          cross: WrapCrossAlignment.start,
                        ),
                      ),
                      Text(
                        '选择后会自动填入各分类金额，仍可逐项修改',
                        style: hts(12, Color(0xFF71717A), lh: 16),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 10,
                  ),
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '分类分配',
                        style: hts(
                          13,
                          Color(0xFF52525B),
                          w: FontWeight.w500,
                          lh: 18,
                        ),
                      ),
                    ),
                    hbox(
                      bg: Color(0xFFFFFFFF),
                      radius: BorderRadius.circular(24),
                      shadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          offset: Offset(0, 2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          offset: Offset(0, 0),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                      pad: EdgeInsets.fromLTRB(0, 4, 0, 4),
                      child: hcol(
                        [
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                            child: hcol(
                              [
                                hrow(
                                  [
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFE1F0FE),
                                      radius: BorderRadius.circular(10),
                                      child: hrow(
                                        [hsvg(Svgs.s21, w: 17, h: 17)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: hcol(
                                        [
                                          Text(
                                            '房租',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          Text(
                                            '占总预算 16%',
                                            style: hts(
                                              11,
                                              Color(0xFF71717A),
                                              lh: 14,
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.stretch,
                                        gap: 0,
                                      ),
                                    ),
                                    hbox(
                                      h: 38,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(12),
                                      pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      child: hrow(
                                        [
                                          Flexible(
                                            flex: 6,
                                            child: Text(
                                              '¥',
                                              style: hts(13, Color(0xFF71717A)),
                                            ),
                                          ),
                                          Expanded(
                                            child: hbox(
                                              w: 70,
                                              child: HInput(
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                value: '28,000',
                                                keyboard: TextInputType.number,
                                                align: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 10,
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 8,
                            ),
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                            child: hcol(
                              [
                                hrow(
                                  [
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFDDF6E7),
                                      radius: BorderRadius.circular(10),
                                      child: hrow(
                                        [hsvg(Svgs.s22, w: 17, h: 17)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: hcol(
                                        [
                                          Text(
                                            '人工',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          Text(
                                            '占总预算 50%',
                                            style: hts(
                                              11,
                                              Color(0xFF71717A),
                                              lh: 14,
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.stretch,
                                        gap: 0,
                                      ),
                                    ),
                                    hbox(
                                      h: 38,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(12),
                                      pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      child: hrow(
                                        [
                                          Flexible(
                                            flex: 6,
                                            child: Text(
                                              '¥',
                                              style: hts(13, Color(0xFF71717A)),
                                            ),
                                          ),
                                          Expanded(
                                            child: hbox(
                                              w: 70,
                                              child: HInput(
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                value: '86,000',
                                                keyboard: TextInputType.number,
                                                align: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 10,
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 8,
                            ),
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                            child: hcol(
                              [
                                hrow(
                                  [
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFE1F0FE),
                                      radius: BorderRadius.circular(10),
                                      child: hrow(
                                        [hsvg(Svgs.s23, w: 17, h: 17)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: hcol(
                                        [
                                          Text(
                                            '材料采购',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          Text(
                                            '占总预算 19%',
                                            style: hts(
                                              11,
                                              Color(0xFF71717A),
                                              lh: 14,
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.stretch,
                                        gap: 0,
                                      ),
                                    ),
                                    hbox(
                                      h: 38,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(12),
                                      pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      child: hrow(
                                        [
                                          Flexible(
                                            flex: 6,
                                            child: Text(
                                              '¥',
                                              style: hts(13, Color(0xFF71717A)),
                                            ),
                                          ),
                                          Expanded(
                                            child: hbox(
                                              w: 70,
                                              child: HInput(
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                value: '32,000',
                                                keyboard: TextInputType.number,
                                                align: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 10,
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 8,
                            ),
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                            child: hcol(
                              [
                                hrow(
                                  [
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFFDEFD6),
                                      radius: BorderRadius.circular(10),
                                      child: hrow(
                                        [hsvg(Svgs.s24, w: 17, h: 17)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: hcol(
                                        [
                                          Text(
                                            '水电',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          Text(
                                            '占总预算 4%',
                                            style: hts(
                                              11,
                                              Color(0xFF71717A),
                                              lh: 14,
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.stretch,
                                        gap: 0,
                                      ),
                                    ),
                                    hbox(
                                      h: 38,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(12),
                                      pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      child: hrow(
                                        [
                                          Flexible(
                                            flex: 6,
                                            child: Text(
                                              '¥',
                                              style: hts(13, Color(0xFF71717A)),
                                            ),
                                          ),
                                          Expanded(
                                            child: hbox(
                                              w: 70,
                                              child: HInput(
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                value: '7,000',
                                                keyboard: TextInputType.number,
                                                align: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 10,
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 8,
                            ),
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                            child: hcol(
                              [
                                hrow(
                                  [
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFFFE1E2),
                                      radius: BorderRadius.circular(10),
                                      child: hrow(
                                        [hsvg(Svgs.s25, w: 17, h: 17)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: hcol(
                                        [
                                          Text(
                                            '营销',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          Text(
                                            '占总预算 7%',
                                            style: hts(
                                              11,
                                              Color(0xFF71717A),
                                              lh: 14,
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.stretch,
                                        gap: 0,
                                      ),
                                    ),
                                    hbox(
                                      h: 38,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(12),
                                      pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      child: hrow(
                                        [
                                          Flexible(
                                            flex: 6,
                                            child: Text(
                                              '¥',
                                              style: hts(13, Color(0xFF71717A)),
                                            ),
                                          ),
                                          Expanded(
                                            child: hbox(
                                              w: 70,
                                              child: HInput(
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                value: '12,000',
                                                keyboard: TextInputType.number,
                                                align: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 10,
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 8,
                            ),
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                            child: hcol(
                              [
                                hrow(
                                  [
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFEEEEF0),
                                      radius: BorderRadius.circular(10),
                                      child: hrow(
                                        [hsvg(Svgs.s26, w: 17, h: 17)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: hcol(
                                        [
                                          Text(
                                            '其他',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          Text(
                                            '占总预算 4%',
                                            style: hts(
                                              11,
                                              Color(0xFF71717A),
                                              lh: 14,
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.stretch,
                                        gap: 0,
                                      ),
                                    ),
                                    hbox(
                                      h: 38,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(12),
                                      pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      child: hrow(
                                        [
                                          Flexible(
                                            flex: 6,
                                            child: Text(
                                              '¥',
                                              style: hts(13, Color(0xFF71717A)),
                                            ),
                                          ),
                                          Expanded(
                                            child: hbox(
                                              w: 70,
                                              child: HInput(
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                value: '6,000',
                                                keyboard: TextInputType.number,
                                                align: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 10,
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 8,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 0,
                      ),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
                  gap: 8,
                ),
                hbox(
                  bg: Color(0xFFDDF6E7),
                  radius: BorderRadius.circular(20),
                  pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: hrow(
                    [
                      hsvg(Svgs.s27, w: 18, h: 18),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '已分配 ¥171,000 · 未分配 ¥0',
                          style: hts(
                            14,
                            Color(0xFF1E5C34),
                            w: FontWeight.w600,
                            lh: 20,
                          ),
                        ),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.center,
                    gap: 10,
                  ),
                ),
                hbox(
                  bg: Color(0xFFFFFFFF),
                  radius: BorderRadius.circular(24),
                  shadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ],
                  pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: hcol(
                    [
                      Text(
                        '生效范围',
                        style: hts(
                          14,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 20,
                        ),
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
                              on: hTap(
                                context,
                                hbox(
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
                                      '仅本月',
                                      style: hts(
                                        13,
                                        Color(0xFF1E63AE),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
                                hbox(
                                  h: 34,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(17),
                                  pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '仅本月',
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
                            ),
                            HSel(
                              ctrl: g2[0],
                              index: 1,
                              on: hTap(
                                context,
                                hbox(
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
                                      '本月起每月沿用',
                                      style: hts(
                                        13,
                                        Color(0xFF1E63AE),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
                                hbox(
                                  h: 34,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(17),
                                  pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '本月起每月沿用',
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
                    gap: 10,
                  ),
                ),
              ],
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.stretch,
              gap: 16,
            ),
          ),
        ],
        main: MainAxisAlignment.start,
        cross: CrossAxisAlignment.stretch,
        gap: 0,
      ),
      overlays: [
        HBottomDock(
          child: hbox(
            bg: Color.fromRGBO(255, 255, 255, 0.94),
            shadow: [
              BoxShadow(
                color: Color(0xFFE4E4E7),
                offset: Offset(0, -1),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
            pad: EdgeInsets.fromLTRB(20, 12, 20, bottomInset(context)),
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
                          '保存预算',
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
              cross: CrossAxisAlignment.center,
              gap: 10,
            ),
          ),
        ),
      ],
    );
  }
}
