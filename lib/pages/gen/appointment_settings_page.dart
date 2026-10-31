import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class AppointmentSettingsPage extends StatelessWidget {
  const AppointmentSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1671,
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
                        '预约设置',
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
                      to: 'Appointments',
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '在线预约',
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
                            minH: 54,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '开放在线预约',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '客户可在会员端、小程序自助预约',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                HSwitch(initial: true),
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
                                  child: hcol(
                                    [
                                      Text(
                                        '预约需商家确认',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '关闭则客户提交后自动确认',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
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
                  gap: 8,
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '可预约时间',
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
                      pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: hcol(
                        [
                          Text(
                            '可预约时段',
                            style: hts(
                              14,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                          hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 44,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(14),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '09:00',
                                      style: hts(
                                        16,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text('至', style: hts(16, Color(0xFFA1A1AA))),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 44,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(14),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '20:00',
                                      style: hts(
                                        16,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 10,
                          ),
                          Text(
                            '与"营业时间与工位"保持一致，修改请前往营业设置',
                            style: hts(12, Color(0xFF71717A), lh: 16),
                          ),
                          hbox(h: 1, bg: Color(0xFFEFEFF1)),
                          Text(
                            '时间间隔',
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
                                          '15 分钟',
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
                                          '15 分钟',
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
                                          '30 分钟',
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
                                          '30 分钟',
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
                                          '60 分钟',
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
                                          '60 分钟',
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
                          hbox(h: 1, bg: Color(0xFFEFEFF1)),
                          Text(
                            '定休日',
                            style: hts(
                              14,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                          hwrap(
                            [
                              hTap(
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
                              hTap(
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
                              hTap(
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
                              hTap(
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
                              hTap(
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
                              hTap(
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
                              hTap(
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
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 12,
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
                        '接待规则',
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
                            minH: 60,
                            pad: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '每个时段最多接待',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '不超过空闲工位数',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                hrow(
                                  [
                                    Flexible(
                                      flex: 81,
                                      child: hrow(
                                        [
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s7, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 9,
                                            child: hbox(
                                              minW: 36,
                                              child: Text(
                                                '2',
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s8, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 13,
                                      child: Text(
                                        '单',
                                        style: hts(13, Color(0xFF71717A)),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 4,
                                ),
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
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            minH: 60,
                            pad: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '最早提前预约',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                hrow(
                                  [
                                    Flexible(
                                      flex: 81,
                                      child: hrow(
                                        [
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s7, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 9,
                                            child: hbox(
                                              minW: 36,
                                              child: Text(
                                                '1',
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s8, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 26,
                                      child: Text(
                                        '小时',
                                        style: hts(13, Color(0xFF71717A)),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 4,
                                ),
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
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            minH: 60,
                            pad: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '最远可预约',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                hrow(
                                  [
                                    Flexible(
                                      flex: 89,
                                      child: hrow(
                                        [
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s7, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 17,
                                            child: hbox(
                                              minW: 36,
                                              child: Text(
                                                '30',
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s8, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 13,
                                      child: Text(
                                        '天',
                                        style: hts(13, Color(0xFF71717A)),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 4,
                                ),
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
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          ),
                          hbox(
                            minH: 60,
                            pad: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '到店保留时长',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '超时后标记"超时未到"',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                hrow(
                                  [
                                    Flexible(
                                      flex: 89,
                                      child: hrow(
                                        [
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s7, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 17,
                                            child: hbox(
                                              minW: 36,
                                              child: Text(
                                                '15',
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s8, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 26,
                                      child: Text(
                                        '分钟',
                                        style: hts(13, Color(0xFF71717A)),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 4,
                                ),
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
                  gap: 8,
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '爽约管理',
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
                            minH: 54,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '爽约限制',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '累计爽约次数达到后，需预付定金才能预约',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                HSwitch(initial: true),
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
                            minH: 60,
                            pad: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '累计爽约',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                hrow(
                                  [
                                    Flexible(
                                      flex: 81,
                                      child: hrow(
                                        [
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s7, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 9,
                                            child: hbox(
                                              minW: 36,
                                              child: Text(
                                                '3',
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s8, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 13,
                                      child: Text(
                                        '次',
                                        style: hts(13, Color(0xFF71717A)),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 4,
                                ),
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
                            minH: 60,
                            pad: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '预付定金',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '抵扣到店消费，爽约不退',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                hrow(
                                  [
                                    Flexible(
                                      flex: 89,
                                      child: hrow(
                                        [
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s7, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 17,
                                            child: hbox(
                                              minW: 36,
                                              child: Text(
                                                '50',
                                                style: hts(
                                                  15,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                  tab: true,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          hTap(
                                            context,
                                            hbox(
                                              w: 32,
                                              h: 32,
                                              bg: Color(0xFFF4F4F5),
                                              radius: BorderRadius.circular(16),
                                              child: hrow(
                                                [hsvg(Svgs.s8, w: 14, h: 14)],
                                                main: MainAxisAlignment.center,
                                                cross:
                                                    CrossAxisAlignment.center,
                                                gap: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 4,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 13,
                                      child: Text(
                                        '元',
                                        style: hts(13, Color(0xFF71717A)),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 4,
                                ),
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
                  gap: 8,
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '预约通知',
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
                            minH: 54,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '预约成功通知客户',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                HSwitch(initial: true),
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
                                  child: hcol(
                                    [
                                      Text(
                                        '到店前提醒客户',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '提前 2 小时发送',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                HSwitch(initial: true),
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
                                  child: hcol(
                                    [
                                      Text(
                                        '预约变动通知店长',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '新预约、改期、取消即时推送',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                  ),
                                ),
                                HSwitch(initial: true),
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
                                      '通知渠道与模板',
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '微信 + 短信',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                  hsvg(Svgs.s9, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'NotifySettings',
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
                          '保存设置',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Appointments',
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
