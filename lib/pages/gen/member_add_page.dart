import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class MemberAddPage extends StatelessWidget {
  const MemberAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1200,
      fixedHeight: false,
      flow: hcol(
        [
          hbox(
            pad: EdgeInsets.fromLTRB(20, topInset(context), 20, 32),
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
                          [hsvg(Svgs.s28, w: 20, h: 20)],
                          main: MainAxisAlignment.center,
                          cross: CrossAxisAlignment.center,
                          gap: 0,
                        ),
                      ),
                      to: 'Members',
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '新增会员',
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
                        bg: Color(0xFF0485F7),
                        radius: BorderRadius.circular(22),
                        pad: EdgeInsets.fromLTRB(18, 0, 18, 0),
                        child: Align(
                          alignment: Alignment(-1, 0),
                          widthFactor: 1,
                          child: Text(
                            '保存',
                            style: hts(
                              14,
                              Color(0xFFFFFFFF),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                        ),
                      ),
                      to: 'MemberAddDone',
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hTap(
                  context,
                  hbox(
                    bg: Color(0xFF18181B),
                    radius: BorderRadius.circular(22),
                    pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                    child: hrow(
                      [
                        hbox(
                          w: 40,
                          h: 40,
                          bg: Color(0xFF0485F7),
                          radius: BorderRadius.circular(12),
                          child: hrow(
                            [hsvg(Svgs.s83, w: 22, h: 22)],
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
                                '扫行驶证快速建档',
                                style: hts(
                                  15,
                                  Color(0xFFFAFAFA),
                                  w: FontWeight.w500,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '自动识别车牌、车型、车架号',
                                style: hts(12, Color(0xFFA1A1AA), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 2,
                          ),
                        ),
                        hsvg(Svgs.s9, w: 16, h: 16),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 12,
                    ),
                  ),
                  label: '扫行驶证快速建档自动识别车牌',
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '客户信息',
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
                                hbox(
                                  w: 64,
                                  child: Text.rich(
                                    TextSpan(
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                      children: [
                                        TextSpan(
                                          text: '手机号 ',
                                          style: hts(
                                            14,
                                            Color(0xFF52525B),
                                            lh: 20,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: hts(
                                            14,
                                            Color(0xFFA43433),
                                            lh: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: HInput(
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                    value: '139 1688 5530',
                                    keyboard: TextInputType.phone,
                                    align: TextAlign.right,
                                  ),
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
                            minH: 54,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                hbox(
                                  w: 64,
                                  child: Text.rich(
                                    TextSpan(
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                      children: [
                                        TextSpan(
                                          text: '姓名 ',
                                          style: hts(
                                            14,
                                            Color(0xFF52525B),
                                            lh: 20,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: hts(
                                            14,
                                            Color(0xFFA43433),
                                            lh: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: HInput(
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                    hint: '请输入客户姓名',
                                    align: TextAlign.right,
                                  ),
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
                            minH: 54,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '称呼',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                hbox(
                                  bg: Color(0xFFEEEEF0),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: HSelHolder(
                                    groups: [
                                      ({0}, false),
                                    ],
                                    builder: (context, g1) => hrow(
                                      [
                                        Flexible(
                                          flex: 54,
                                          child: HSel(
                                            ctrl: g1[0],
                                            index: 0,
                                            on: hbox(
                                              h: 28,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(14),
                                              shadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                    0,
                                                    0,
                                                    0,
                                                    0.08,
                                                  ),
                                                  offset: Offset(0, 1),
                                                  blurRadius: 2,
                                                  spreadRadius: 0,
                                                ),
                                              ],
                                              pad: EdgeInsets.fromLTRB(
                                                14,
                                                0,
                                                14,
                                                0,
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                widthFactor: 1,
                                                child: Text(
                                                  '先生',
                                                  style: hts(
                                                    13,
                                                    Color(0xFF18181B),
                                                    w: FontWeight.w500,
                                                    lh: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            off: hbox(
                                              h: 28,
                                              radius: BorderRadius.circular(14),
                                              pad: EdgeInsets.fromLTRB(
                                                14,
                                                0,
                                                14,
                                                0,
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                widthFactor: 1,
                                                child: Text(
                                                  '先生',
                                                  style: hts(
                                                    13,
                                                    Color(0xFF52525B),
                                                    w: FontWeight.w500,
                                                    lh: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 54,
                                          child: HSel(
                                            ctrl: g1[0],
                                            index: 1,
                                            on: hbox(
                                              h: 28,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(14),
                                              shadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                    0,
                                                    0,
                                                    0,
                                                    0.08,
                                                  ),
                                                  offset: Offset(0, 1),
                                                  blurRadius: 2,
                                                  spreadRadius: 0,
                                                ),
                                              ],
                                              pad: EdgeInsets.fromLTRB(
                                                14,
                                                0,
                                                14,
                                                0,
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                widthFactor: 1,
                                                child: Text(
                                                  '女士',
                                                  style: hts(
                                                    13,
                                                    Color(0xFF18181B),
                                                    w: FontWeight.w500,
                                                    lh: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            off: hbox(
                                              h: 28,
                                              radius: BorderRadius.circular(14),
                                              pad: EdgeInsets.fromLTRB(
                                                14,
                                                0,
                                                14,
                                                0,
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                widthFactor: 1,
                                                child: Text(
                                                  '女士',
                                                  style: hts(
                                                    13,
                                                    Color(0xFF52525B),
                                                    w: FontWeight.w500,
                                                    lh: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      main: MainAxisAlignment.start,
                                      cross: CrossAxisAlignment.stretch,
                                      gap: 2,
                                      intrinsic: true,
                                    ),
                                  ),
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
                                      '生日',
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '选填，用于生日礼',
                                    style: hts(15, Color(0xFF71717A), lh: 22),
                                  ),
                                  hsvg(Svgs.s9, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            label: '生日选填，用于生日礼',
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
                        '车辆信息',
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
                      pad: EdgeInsets.fromLTRB(0, 16, 0, 4),
                      child: hcol(
                        [
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hcol([
                              hrow(
                                [
                                  Expanded(
                                    flex: 1,
                                    child: hbox(
                                      h: 46,
                                      bg: Color(0xFF0B5FD6),
                                      radius: BorderRadius.circular(10),
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 1,
                                        child: Text(
                                          '沪',
                                          style: hts(
                                            18,
                                            Color(0xFFFFFFFF),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: hbox(
                                      h: 46,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(10),
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 1,
                                        child: Text(
                                          'A',
                                          style: hts(
                                            18,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: hbox(
                                      h: 46,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(10),
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 1,
                                        child: Text(
                                          '8',
                                          style: hts(
                                            18,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: hbox(
                                      h: 46,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(10),
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 1,
                                        child: Text(
                                          'K',
                                          style: hts(
                                            18,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: hbox(
                                      h: 46,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(10),
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 1,
                                        child: Text(
                                          '2',
                                          style: hts(
                                            18,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: hbox(
                                      h: 46,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(10),
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 1,
                                        child: Text(
                                          '9',
                                          style: hts(
                                            18,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: hbox(
                                      h: 46,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xFF0485F7),
                                        width: 2,
                                      ),
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 1,
                                        child: Text(
                                          'M',
                                          style: hts(
                                            18,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: hbox(
                                      h: 46,
                                      radius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xFFA1A1AA),
                                        width: 1.5,
                                      ),
                                      child: Align(
                                        alignment: Alignment(0, 0),
                                        widthFactor: 1,
                                        child: Text(
                                          '新能源',
                                          style: hts(
                                            10,
                                            Color(0xFF71717A),
                                            lh: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                cross: CrossAxisAlignment.stretch,
                                gap: 5,
                                intrinsic: true,
                                min: false,
                              ),
                            ], gap: 5),
                          ),
                          hcol(
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
                                          '品牌车型',
                                          style: hts(
                                            14,
                                            Color(0xFF52525B),
                                            lh: 20,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '宝马 5系 525Li',
                                        style: hts(
                                          15,
                                          Color(0xFF18181B),
                                          lh: 22,
                                        ),
                                      ),
                                      hsvg(Svgs.s9, w: 16, h: 16),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                                label: '品牌车型宝马 5系 525L',
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
                                        '车身颜色',
                                        style: hts(
                                          14,
                                          Color(0xFF52525B),
                                          lh: 20,
                                        ),
                                      ),
                                    ),
                                    HSelHolder(
                                      groups: [
                                        ({0}, false),
                                      ],
                                      builder: (context, g2) => hrow(
                                        [
                                          HSel(
                                            ctrl: g2[0],
                                            index: 0,
                                            on: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFF18181B),
                                              radius: BorderRadius.circular(13),
                                              shadow: [
                                                BoxShadow(
                                                  color: Color(0xFFFFFFFF),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 2,
                                                ),
                                                BoxShadow(
                                                  color: Color(0xFF0485F7),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 4,
                                                ),
                                              ],
                                            ),
                                            off: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(13),
                                              border: Border.all(
                                                color: Color(0xFFD4D4D8),
                                                width: 1.5,
                                              ),
                                            ),
                                          ),
                                          HSel(
                                            ctrl: g2[0],
                                            index: 1,
                                            on: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFF18181B),
                                              radius: BorderRadius.circular(13),
                                              shadow: [
                                                BoxShadow(
                                                  color: Color(0xFFFFFFFF),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 2,
                                                ),
                                                BoxShadow(
                                                  color: Color(0xFF0485F7),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 4,
                                                ),
                                              ],
                                            ),
                                            off: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(13),
                                              border: Border.all(
                                                color: Color(0xFFD4D4D8),
                                                width: 1.5,
                                              ),
                                            ),
                                          ),
                                          HSel(
                                            ctrl: g2[0],
                                            index: 2,
                                            on: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFF18181B),
                                              radius: BorderRadius.circular(13),
                                              shadow: [
                                                BoxShadow(
                                                  color: Color(0xFFFFFFFF),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 2,
                                                ),
                                                BoxShadow(
                                                  color: Color(0xFF0485F7),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 4,
                                                ),
                                              ],
                                            ),
                                            off: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(13),
                                              border: Border.all(
                                                color: Color(0xFFD4D4D8),
                                                width: 1.5,
                                              ),
                                            ),
                                          ),
                                          HSel(
                                            ctrl: g2[0],
                                            index: 3,
                                            on: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFF18181B),
                                              radius: BorderRadius.circular(13),
                                              shadow: [
                                                BoxShadow(
                                                  color: Color(0xFFFFFFFF),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 2,
                                                ),
                                                BoxShadow(
                                                  color: Color(0xFF0485F7),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 4,
                                                ),
                                              ],
                                            ),
                                            off: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(13),
                                              border: Border.all(
                                                color: Color(0xFFD4D4D8),
                                                width: 1.5,
                                              ),
                                            ),
                                          ),
                                          HSel(
                                            ctrl: g2[0],
                                            index: 4,
                                            on: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFF18181B),
                                              radius: BorderRadius.circular(13),
                                              shadow: [
                                                BoxShadow(
                                                  color: Color(0xFFFFFFFF),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 2,
                                                ),
                                                BoxShadow(
                                                  color: Color(0xFF0485F7),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 4,
                                                ),
                                              ],
                                            ),
                                            off: hbox(
                                              w: 26,
                                              h: 26,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(13),
                                              border: Border.all(
                                                color: Color(0xFFD4D4D8),
                                                width: 1.5,
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
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 10,
                      ),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
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
                      hrow(
                        [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '开卡',
                              style: hts(
                                15,
                                Color(0xFF18181B),
                                w: FontWeight.w600,
                                lh: 22,
                              ),
                            ),
                          ),
                          hTap(
                            context,
                            Text(
                              '保存后去充值',
                              style: hts(
                                13,
                                Color(0xFF1E63AE),
                                w: FontWeight.w500,
                                lh: 18,
                              ),
                            ),
                            to: 'Recharge',
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.baseline,
                        gap: 0,
                      ),
                      hcol([
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  h: 52,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(14),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '普通',
                                      style: hts(
                                        13,
                                        Color(0xFF18181B),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                label: '普通',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  h: 52,
                                  bg: Color(0xFFE4E4E7),
                                  radius: BorderRadius.circular(14),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '银卡',
                                      style: hts(
                                        13,
                                        Color(0xFF27272A),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                label: '银卡',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  h: 52,
                                  bg: Color(0xFFF3E2B3),
                                  radius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Color(0xFF0485F7),
                                    width: 2,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '金卡',
                                      style: hts(
                                        13,
                                        Color(0xFF3D2B0E),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                label: '金卡',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  h: 52,
                                  bg: Color(0xFF18181B),
                                  radius: BorderRadius.circular(14),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '黑金',
                                      style: hts(
                                        13,
                                        Color(0xFFF5D78E),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                label: '黑金',
                              ),
                            ),
                          ],
                          cross: CrossAxisAlignment.stretch,
                          gap: 8,
                          intrinsic: true,
                          min: false,
                        ),
                      ], gap: 8),
                      Text(
                        '银卡及以上需充值达到开卡门槛后生效',
                        style: hts(12, Color(0xFF71717A), lh: 16),
                      ),
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
                  pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: hcol(
                    [
                      Text(
                        '客户来源',
                        style: hts(
                          15,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 22,
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
                                h: 32,
                                bg: Color(0xFF18181B),
                                radius: BorderRadius.circular(16),
                                pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '到店自然客',
                                    style: hts(
                                      13,
                                      Color(0xFFFFFFFF),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                              off: hbox(
                                h: 32,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(16),
                                pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '到店自然客',
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
                                h: 32,
                                bg: Color(0xFF18181B),
                                radius: BorderRadius.circular(16),
                                pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '老客推荐',
                                    style: hts(
                                      13,
                                      Color(0xFFFFFFFF),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                              off: hbox(
                                h: 32,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(16),
                                pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '老客推荐',
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
                                h: 32,
                                bg: Color(0xFF18181B),
                                radius: BorderRadius.circular(16),
                                pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '团购平台',
                                    style: hts(
                                      13,
                                      Color(0xFFFFFFFF),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                              off: hbox(
                                h: 32,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(16),
                                pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '团购平台',
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
                                h: 32,
                                bg: Color(0xFF18181B),
                                radius: BorderRadius.circular(16),
                                pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '短视频',
                                    style: hts(
                                      13,
                                      Color(0xFFFFFFFF),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                              off: hbox(
                                h: 32,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(16),
                                pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '短视频',
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
                      hTap(
                        context,
                        hbox(
                          bg: Color(0xFFF4F4F5),
                          radius: BorderRadius.circular(14),
                          pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                          child: hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '推荐人',
                                  style: hts(13, Color(0xFF52525B), lh: 18),
                                ),
                              ),
                              Text(
                                '王建国 · 黑金',
                                style: hts(
                                  14,
                                  Color(0xFF18181B),
                                  w: FontWeight.w500,
                                  lh: 20,
                                ),
                              ),
                              hsvg(Svgs.s84, w: 14, h: 14),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 10,
                          ),
                        ),
                        label: '推荐人王建国 · 黑金',
                      ),
                      Text(
                        '备注',
                        style: hts(
                          13,
                          Color(0xFF52525B),
                          w: FontWeight.w500,
                          lh: 18,
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
                          hint: '如：车主偏好、车辆旧伤位置',
                        ),
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
