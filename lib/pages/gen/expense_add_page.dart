import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class ExpenseAddPage extends StatelessWidget {
  const ExpenseAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1580,
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
                        '记一笔开支',
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
                      to: 'Expenses',
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
                  pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: hcol(
                    [
                      Text('金额（元）', style: hts(13, Color(0xFF71717A), lh: 18)),
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
                                  40,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 48,
                                  ls: -1.2,
                                  tab: true,
                                ),
                                value: '1,260.00',
                                keyboard: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.baseline,
                        gap: 6,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 6,
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
                        '分类',
                        style: hts(
                          14,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 20,
                        ),
                      ),
                      hcol([
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(0, 12, 0, 10),
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hbox(
                                          w: 36,
                                          h: 36,
                                          bg: Color(0xFFE1F0FE),
                                          radius: BorderRadius.circular(12),
                                          child: hrow(
                                            [hsvg(Svgs.s35, w: 19, h: 19)],
                                            main: MainAxisAlignment.center,
                                            cross: CrossAxisAlignment.center,
                                            gap: 0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '房租',
                                        style: hts(
                                          12,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                label: '房租',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  bg: Color(0xFFF4F8FE),
                                  radius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Color(0xFF0485F7),
                                    width: 2,
                                  ),
                                  pad: EdgeInsets.fromLTRB(0, 12, 0, 10),
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hbox(
                                          w: 36,
                                          h: 36,
                                          bg: Color(0xFFFDEFD6),
                                          radius: BorderRadius.circular(12),
                                          child: hrow(
                                            [hsvg(Svgs.s36, w: 19, h: 19)],
                                            main: MainAxisAlignment.center,
                                            cross: CrossAxisAlignment.center,
                                            gap: 0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '水电',
                                        style: hts(
                                          12,
                                          Color(0xFF18181B),
                                          w: FontWeight.w600,
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                label: '水电',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(0, 12, 0, 10),
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hbox(
                                          w: 36,
                                          h: 36,
                                          bg: Color(0xFFDDF6E7),
                                          radius: BorderRadius.circular(12),
                                          child: hrow(
                                            [hsvg(Svgs.s37, w: 19, h: 19)],
                                            main: MainAxisAlignment.center,
                                            cross: CrossAxisAlignment.center,
                                            gap: 0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '人工',
                                        style: hts(
                                          12,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                label: '人工',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(0, 12, 0, 10),
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hbox(
                                          w: 36,
                                          h: 36,
                                          bg: Color(0xFFE1F0FE),
                                          radius: BorderRadius.circular(12),
                                          child: hrow(
                                            [hsvg(Svgs.s38, w: 19, h: 19)],
                                            main: MainAxisAlignment.center,
                                            cross: CrossAxisAlignment.center,
                                            gap: 0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '材料采购',
                                        style: hts(
                                          12,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                label: '材料采购',
                              ),
                            ),
                          ],
                          cross: CrossAxisAlignment.stretch,
                          gap: 8,
                          intrinsic: true,
                          min: false,
                        ),
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(0, 12, 0, 10),
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hbox(
                                          w: 36,
                                          h: 36,
                                          bg: Color(0xFFEEEEF0),
                                          radius: BorderRadius.circular(12),
                                          child: hrow(
                                            [hsvg(Svgs.s39, w: 19, h: 19)],
                                            main: MainAxisAlignment.center,
                                            cross: CrossAxisAlignment.center,
                                            gap: 0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '设备维修',
                                        style: hts(
                                          12,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                label: '设备维修',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(0, 12, 0, 10),
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hbox(
                                          w: 36,
                                          h: 36,
                                          bg: Color(0xFFFFE1E2),
                                          radius: BorderRadius.circular(12),
                                          child: hrow(
                                            [hsvg(Svgs.s40, w: 19, h: 19)],
                                            main: MainAxisAlignment.center,
                                            cross: CrossAxisAlignment.center,
                                            gap: 0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '营销推广',
                                        style: hts(
                                          12,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                label: '营销推广',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(0, 12, 0, 10),
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hbox(
                                          w: 36,
                                          h: 36,
                                          bg: Color(0xFFEEEEF0),
                                          radius: BorderRadius.circular(12),
                                          child: hrow(
                                            [hsvg(Svgs.s41, w: 19, h: 19)],
                                            main: MainAxisAlignment.center,
                                            cross: CrossAxisAlignment.center,
                                            gap: 0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '税费',
                                        style: hts(
                                          12,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                label: '税费',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(0, 12, 0, 10),
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hbox(
                                          w: 36,
                                          h: 36,
                                          bg: Color(0xFFEEEEF0),
                                          radius: BorderRadius.circular(12),
                                          child: hrow(
                                            [hsvg(Svgs.s42, w: 19, h: 19)],
                                            main: MainAxisAlignment.center,
                                            cross: CrossAxisAlignment.center,
                                            gap: 0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '其他',
                                        style: hts(
                                          12,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                label: '其他',
                              ),
                            ),
                          ],
                          cross: CrossAxisAlignment.stretch,
                          gap: 8,
                          intrinsic: true,
                          min: false,
                        ),
                      ], gap: 8),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 12,
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
                        minH: 54,
                        pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '日期',
                                style: hts(14, Color(0xFF52525B), lh: 20),
                              ),
                            ),
                            Text(
                              '今天 10.31',
                              style: hts(15, Color(0xFF18181B), lh: 22),
                            ),
                            hsvg(Svgs.s9, w: 16, h: 16),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 12,
                        ),
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      ),
                      hbox(
                        minH: 54,
                        pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '支付账户',
                                style: hts(14, Color(0xFF52525B), lh: 20),
                              ),
                            ),
                            Text(
                              '微信',
                              style: hts(15, Color(0xFF18181B), lh: 22),
                            ),
                            hsvg(Svgs.s9, w: 16, h: 16),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 12,
                        ),
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      ),
                      hbox(
                        minH: 54,
                        pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '收款方',
                                style: hts(14, Color(0xFF52525B), lh: 20),
                              ),
                            ),
                            Text(
                              '市供电局',
                              style: hts(15, Color(0xFF18181B), lh: 22),
                            ),
                            hsvg(Svgs.s9, w: 16, h: 16),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 12,
                        ),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 0,
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
                        '付款状态',
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
                                    '已付款',
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
                                    '已付款',
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
                              ctrl: g1[0],
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
                                    '挂账待付',
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
                                    '挂账待付',
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
                      Text.rich(
                        TextSpan(
                          style: hts(
                            14,
                            Color(0xFF18181B),
                            w: FontWeight.w600,
                            lh: 20,
                          ),
                          children: [
                            TextSpan(
                              text: '备注 ',
                              style: hts(
                                14,
                                Color(0xFF18181B),
                                w: FontWeight.w600,
                                lh: 20,
                              ),
                            ),
                            TextSpan(
                              text: '· 选填',
                              style: hts(14, Color(0xFF71717A), lh: 20),
                            ),
                          ],
                        ),
                      ),
                      hbox(
                        minH: 64,
                        bg: Color(0xFFF4F4F5),
                        radius: BorderRadius.circular(14),
                        pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                        child: HInput(
                          style: hts(14, Color(0xFF18181B), lh: 20),
                          maxLines: 4,
                          hint: '如：10 月电费，含空调',
                        ),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 8,
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
                      Text.rich(
                        TextSpan(
                          style: hts(
                            14,
                            Color(0xFF18181B),
                            w: FontWeight.w600,
                            lh: 20,
                          ),
                          children: [
                            TextSpan(
                              text: '凭证 ',
                              style: hts(
                                14,
                                Color(0xFF18181B),
                                w: FontWeight.w600,
                                lh: 20,
                              ),
                            ),
                            TextSpan(
                              text: '· 发票、收据、转账截图',
                              style: hts(14, Color(0xFF71717A), lh: 20),
                            ),
                          ],
                        ),
                      ),
                      hrow(
                        [
                          hTap(
                            context,
                            hbox(
                              w: 72,
                              h: 72,
                              radius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color(0xFFC7C7CC),
                                width: 1.5,
                              ),
                              child: hrow(
                                [hsvg(Svgs.s43, w: 24, h: 24)],
                                main: MainAxisAlignment.center,
                                cross: CrossAxisAlignment.center,
                                gap: 0,
                              ),
                            ),
                            label: '拍照添加凭证',
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 10,
                        intrinsic: true,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 14,
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
                        minH: 54,
                        pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hcol(
                                [
                                  Text(
                                    '每月重复记账',
                                    style: hts(14, Color(0xFF18181B), lh: 20),
                                  ),
                                  Text(
                                    '适合房租、物业费等固定开支，到期自动生成',
                                    style: hts(12, Color(0xFF71717A), lh: 16),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.stretch,
                                gap: 1,
                              ),
                            ),
                            HSwitch(initial: false),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 12,
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
                      bg: Color(0xFF18181B),
                      radius: BorderRadius.circular(25),
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '保存',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Expenses',
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
