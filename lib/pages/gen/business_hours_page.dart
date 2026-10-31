import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class BusinessHoursPage extends StatelessWidget {
  const BusinessHoursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1171,
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
                          [hsvg(Svgs.s0, w: 20, h: 20)],
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
                        '营业时间与工位',
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
                      to: 'Settings',
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
                      Text(
                        '营业时间',
                        style: hts(14, Color(0xFF18181B), w: FontWeight.w600),
                      ),
                      HStrHolder(
                        initial: '09:00',
                        builder: (context, s1) => HStrHolder(
                          initial: '20:00',
                          builder: (context, s2) => hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hTap(
                                  context,
                                  hbox(
                                    h: 48,
                                    bg: Color(0xFFF4F4F5),
                                    radius: BorderRadius.circular(14),
                                    child: Align(
                                      alignment: Alignment(0, 0),
                                      widthFactor: 1,
                                      child: hStr(
                                        s1,
                                        hts(
                                          17,
                                          Color(0xFF18181B),
                                          w: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () => hPick(context, 'time', '开始', s1),
                                ),
                              ),
                              Text('至', style: hts(16, Color(0xFFA1A1AA))),
                              Expanded(
                                flex: 1,
                                child: hTap(
                                  context,
                                  hbox(
                                    h: 48,
                                    bg: Color(0xFFF4F4F5),
                                    radius: BorderRadius.circular(14),
                                    child: Align(
                                      alignment: Alignment(0, 0),
                                      widthFactor: 1,
                                      child: hStr(
                                        s2,
                                        hts(
                                          17,
                                          Color(0xFF18181B),
                                          w: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () => hPick(context, 'time', '结束', s2),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 10,
                          ),
                        ),
                      ),
                      hbox(h: 1, bg: Color(0xFFEFEFF1)),
                      Text(
                        '营业日',
                        style: hts(14, Color(0xFF18181B), w: FontWeight.w600),
                      ),
                      HSelHolder(
                        groups: [
                          ({0, 1, 2, 3, 4, 5, 6}, true),
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
                                    '周一',
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
                                    '周一',
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
                                    '周二',
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
                                    '周二',
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
                                    '周三',
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
                                    '周三',
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
                              index: 3,
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
                                    '周四',
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
                                    '周四',
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
                              index: 4,
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
                                    '周五',
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
                                    '周五',
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
                              index: 5,
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
                                    '周六',
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
                                    '周六',
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
                              index: 6,
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
                                    '周日',
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
                                    '周日',
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
                    gap: 12,
                  ),
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '节假日',
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
                          hTap(
                            context,
                            hbox(
                              minH: 54,
                              pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: hrow(
                                [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '国庆 10.01 – 10.07',
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '正常营业',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'HolidayEdit',
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hTap(
                            context,
                            hbox(
                              minH: 54,
                              pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: hrow(
                                [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '春节 2027.02.05 – 02.11',
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '休息',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'HolidayEdit',
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hTap(
                            context,
                            hbox(
                              minH: 54,
                              pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: hrow(
                                [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '添加休息日',
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                    ),
                                  ),
                                  SizedBox.shrink(),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'HolidayEdit',
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
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '工位 · 共 6 个',
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
                          hTap(
                            context,
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
                                          '1 号工位',
                                          style: hts(
                                            15,
                                            Color(0xFF18181B),
                                            lh: 22,
                                          ),
                                        ),
                                        Text(
                                          '洗车',
                                          style: hts(
                                            12,
                                            Color(0xFF71717A),
                                            lh: 16,
                                          ),
                                        ),
                                      ],
                                      main: MainAxisAlignment.start,
                                      cross: CrossAxisAlignment.stretch,
                                      gap: 0,
                                    ),
                                  ),
                                  hbox(
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(9),
                                    pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      '可预约',
                                      style: hts(
                                        11,
                                        Color(0xFF2B7745),
                                        w: FontWeight.w600,
                                        lh: 18,
                                      ),
                                      softWrap: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'BayEdit',
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hTap(
                            context,
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
                                          '2 号工位',
                                          style: hts(
                                            15,
                                            Color(0xFF18181B),
                                            lh: 22,
                                          ),
                                        ),
                                        Text(
                                          '洗车',
                                          style: hts(
                                            12,
                                            Color(0xFF71717A),
                                            lh: 16,
                                          ),
                                        ),
                                      ],
                                      main: MainAxisAlignment.start,
                                      cross: CrossAxisAlignment.stretch,
                                      gap: 0,
                                    ),
                                  ),
                                  hbox(
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(9),
                                    pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      '可预约',
                                      style: hts(
                                        11,
                                        Color(0xFF2B7745),
                                        w: FontWeight.w600,
                                        lh: 18,
                                      ),
                                      softWrap: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'BayEdit',
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hTap(
                            context,
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
                                          '3 号工位',
                                          style: hts(
                                            15,
                                            Color(0xFF18181B),
                                            lh: 22,
                                          ),
                                        ),
                                        Text(
                                          '美容',
                                          style: hts(
                                            12,
                                            Color(0xFF71717A),
                                            lh: 16,
                                          ),
                                        ),
                                      ],
                                      main: MainAxisAlignment.start,
                                      cross: CrossAxisAlignment.stretch,
                                      gap: 0,
                                    ),
                                  ),
                                  hbox(
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(9),
                                    pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      '可预约',
                                      style: hts(
                                        11,
                                        Color(0xFF2B7745),
                                        w: FontWeight.w600,
                                        lh: 18,
                                      ),
                                      softWrap: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'BayEdit',
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hTap(
                            context,
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
                                          '4 号工位',
                                          style: hts(
                                            15,
                                            Color(0xFF18181B),
                                            lh: 22,
                                          ),
                                        ),
                                        Text(
                                          '美容',
                                          style: hts(
                                            12,
                                            Color(0xFF71717A),
                                            lh: 16,
                                          ),
                                        ),
                                      ],
                                      main: MainAxisAlignment.start,
                                      cross: CrossAxisAlignment.stretch,
                                      gap: 0,
                                    ),
                                  ),
                                  hbox(
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(9),
                                    pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      '可预约',
                                      style: hts(
                                        11,
                                        Color(0xFF2B7745),
                                        w: FontWeight.w600,
                                        lh: 18,
                                      ),
                                      softWrap: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'BayEdit',
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hTap(
                            context,
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
                                          '贴膜间 A',
                                          style: hts(
                                            15,
                                            Color(0xFF18181B),
                                            lh: 22,
                                          ),
                                        ),
                                        Text(
                                          '贴膜 · 施工周期长',
                                          style: hts(
                                            12,
                                            Color(0xFF71717A),
                                            lh: 16,
                                          ),
                                        ),
                                      ],
                                      main: MainAxisAlignment.start,
                                      cross: CrossAxisAlignment.stretch,
                                      gap: 0,
                                    ),
                                  ),
                                  hbox(
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(9),
                                    pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      '可预约',
                                      style: hts(
                                        11,
                                        Color(0xFF2B7745),
                                        w: FontWeight.w600,
                                        lh: 18,
                                      ),
                                      softWrap: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'BayEdit',
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hTap(
                            context,
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
                                          '贴膜间 B',
                                          style: hts(
                                            15,
                                            Color(0xFF18181B),
                                            lh: 22,
                                          ),
                                        ),
                                        Text(
                                          '贴膜 · 施工周期长',
                                          style: hts(
                                            12,
                                            Color(0xFF71717A),
                                            lh: 16,
                                          ),
                                        ),
                                      ],
                                      main: MainAxisAlignment.start,
                                      cross: CrossAxisAlignment.stretch,
                                      gap: 0,
                                    ),
                                  ),
                                  hbox(
                                    bg: Color(0xFFEEEEF0),
                                    radius: BorderRadius.circular(9),
                                    pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      '仅内部',
                                      style: hts(
                                        11,
                                        Color(0xFF52525B),
                                        w: FontWeight.w600,
                                        lh: 18,
                                      ),
                                      softWrap: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                  hsvg(Svgs.s2, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'BayEdit',
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
                hTap(
                  context,
                  hbox(
                    h: 48,
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
                    child: hrow(
                      [
                        hsvg(Svgs.s31, w: 18, h: 18),
                        Flexible(
                          flex: 60,
                          child: Text(
                            '添加工位',
                            style: hts(
                              15,
                              Color(0xFF1E63AE),
                              w: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.center,
                      cross: CrossAxisAlignment.center,
                      gap: 6,
                    ),
                  ),
                  to: 'BayEdit',
                ),
                Text(
                  '工位数量受套餐限制，当前专业版最多 20 个',
                  style: hts(12, Color(0xFFA1A1AA)),
                  textAlign: TextAlign.center,
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
      overlays: [],
    );
  }
}
