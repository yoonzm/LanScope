import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class CardTierEditPage extends StatelessWidget {
  const CardTierEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1140,
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
                      to: 'CardTiers',
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '编辑卡种',
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
                      to: 'CardTiers',
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hbox(
                  h: 168,
                  bg: Color(0xFF18181B),
                  radius: BorderRadius.circular(24),
                  pad: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  clip: true,
                  child: hstack(
                    hcol(
                      [
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '驰光汽车美容',
                                style: hts(
                                  12,
                                  Color(0xFFA1A1AA),
                                  lh: 16,
                                  ls: 0.96,
                                ),
                              ),
                            ),
                            Text(
                              '卡面预览',
                              style: hts(11, Color(0xFFA1A1AA), lh: 18),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 8,
                        ),
                        Text(
                          '黑金卡',
                          style: hts(
                            26,
                            Color(0xFFF5D78E),
                            w: FontWeight.w600,
                            lh: 32,
                            ls: 1.56,
                          ),
                        ),
                        Text(
                          'NO. 0000 0028 · 全场 9 折',
                          style: hts(13, Color(0xFFD4D4D8), lh: 18, tab: true),
                        ),
                      ],
                      main: MainAxisAlignment.spaceBetween,
                      cross: CrossAxisAlignment.stretch,
                      gap: 0,
                      min: false,
                    ),
                    [
                      Positioned(
                        right: -80,
                        bottom: -110,
                        child: hsvg(Svgs.s29, w: 240, h: 240),
                      ),
                    ],
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
                              w: 72,
                              child: Text(
                                '卡种名称',
                                style: hts(14, Color(0xFF52525B), lh: 20),
                              ),
                            ),
                            Expanded(
                              child: HInput(
                                style: hts(15, Color(0xFF18181B), lh: 22),
                                value: '黑金卡',
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
                        minH: 60,
                        pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '卡面颜色',
                                style: hts(14, Color(0xFF52525B), lh: 20),
                              ),
                            ),
                            HSelHolder(
                              groups: [
                                ({0}, false),
                              ],
                              builder: (context, g1) => hrow(
                                [
                                  HSel(
                                    ctrl: g1[0],
                                    index: 0,
                                    on: hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFF18181B),
                                      radius: BorderRadius.circular(16),
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
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFF3E2B3),
                                      radius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  HSel(
                                    ctrl: g1[0],
                                    index: 1,
                                    on: hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFF18181B),
                                      radius: BorderRadius.circular(16),
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
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFF3E2B3),
                                      radius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  HSel(
                                    ctrl: g1[0],
                                    index: 2,
                                    on: hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFF18181B),
                                      radius: BorderRadius.circular(16),
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
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFF3E2B3),
                                      radius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  HSel(
                                    ctrl: g1[0],
                                    index: 3,
                                    on: hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFF18181B),
                                      radius: BorderRadius.circular(16),
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
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFF3E2B3),
                                      radius: BorderRadius.circular(16),
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
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '开卡条件（满足任一即可）',
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
                                  child: Text(
                                    '单次充值满',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                ),
                                Text(
                                  '¥',
                                  style: hts(15, Color(0xFF71717A), lh: 22),
                                ),
                                Expanded(
                                  child: hbox(
                                    w: 72,
                                    child: HInput(
                                      style: hts(
                                        15,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                        lh: 22,
                                      ),
                                      value: '10,000',
                                      keyboard: TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      align: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.center,
                              gap: 8,
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
                                    '累计消费满',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                ),
                                Text(
                                  '¥',
                                  style: hts(15, Color(0xFF71717A), lh: 22),
                                ),
                                Expanded(
                                  child: hbox(
                                    w: 72,
                                    child: HInput(
                                      style: hts(
                                        15,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                        lh: 22,
                                      ),
                                      value: '30,000',
                                      keyboard: TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      align: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.center,
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
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '会员权益',
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
                            minH: 58,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                hbox(
                                  w: 32,
                                  h: 32,
                                  bg: Color(0xFFFDEFD6),
                                  radius: BorderRadius.circular(10),
                                  align: Alignment(0, 0),
                                  child: Text(
                                    '%',
                                    style: hts(
                                      13,
                                      Color(0xFF855F2E),
                                      w: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '项目折扣',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                ),
                                hrow(
                                  [
                                    hTap(
                                      context,
                                      hbox(
                                        w: 30,
                                        h: 30,
                                        bg: Color(0xFFEEEEF0),
                                        radius: BorderRadius.circular(15),
                                        align: Alignment.center,
                                        child: Text(
                                          '−',
                                          style: hts(
                                            17,
                                            Color(0xFF18181B),
                                            w: FontWeight.w500,
                                            lh: 17,
                                          ),
                                        ),
                                      ),
                                      label: '降低折扣',
                                    ),
                                    hbox(
                                      w: 52,
                                      child: Text(
                                        '9.0 折',
                                        style: hts(
                                          15,
                                          Color(0xFF18181B),
                                          w: FontWeight.w600,
                                          lh: 22,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    hTap(
                                      context,
                                      hbox(
                                        w: 30,
                                        h: 30,
                                        bg: Color(0xFF18181B),
                                        radius: BorderRadius.circular(15),
                                        align: Alignment.center,
                                        child: Text(
                                          '+',
                                          style: hts(
                                            17,
                                            Color(0xFFFFFFFF),
                                            w: FontWeight.w500,
                                            lh: 17,
                                          ),
                                        ),
                                      ),
                                      label: '提高折扣',
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
                            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          ),
                          hbox(
                            minH: 58,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                hbox(
                                  w: 32,
                                  h: 32,
                                  bg: Color(0xFFE1F0FE),
                                  radius: BorderRadius.circular(10),
                                  child: hrow(
                                    [hsvg(Svgs.s30, w: 18, h: 18)],
                                    main: MainAxisAlignment.center,
                                    cross: CrossAxisAlignment.center,
                                    gap: 0,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '积分倍率',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                ),
                                Text(
                                  '2 倍',
                                  style: hts(
                                    15,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
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
                          hbox(
                            h: 1,
                            bg: Color(0xFFEFEFF1),
                            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          ),
                          hbox(
                            minH: 58,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                hbox(
                                  w: 32,
                                  h: 32,
                                  bg: Color(0xFFFFE1E2),
                                  radius: BorderRadius.circular(10),
                                  child: hrow(
                                    [hsvg(Svgs.s31, w: 18, h: 18)],
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
                                        '生日礼',
                                        style: hts(
                                          15,
                                          Color(0xFF18181B),
                                          lh: 22,
                                        ),
                                      ),
                                      Text(
                                        '赠精致洗车 2 次',
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
                            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          ),
                          hbox(
                            minH: 58,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                hbox(
                                  w: 32,
                                  h: 32,
                                  bg: Color(0xFFDDF6E7),
                                  radius: BorderRadius.circular(10),
                                  child: hrow(
                                    [hsvg(Svgs.s32, w: 18, h: 18)],
                                    main: MainAxisAlignment.center,
                                    cross: CrossAxisAlignment.center,
                                    gap: 0,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '预约优先排期',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                ),
                                HSwitch(initial: true),
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
                        '有效期',
                        style: hts(
                          15,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 22,
                        ),
                      ),
                      hbox(
                        bg: Color(0xFFEEEEF0),
                        radius: BorderRadius.circular(18),
                        pad: EdgeInsets.fromLTRB(4, 4, 4, 4),
                        child: HSelHolder(
                          groups: [
                            ({0}, false),
                          ],
                          builder: (context, g2) => hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: HSel(
                                  ctrl: g2[0],
                                  index: 0,
                                  on: hbox(
                                    h: 32,
                                    bg: Color(0xFFFFFFFF),
                                    radius: BorderRadius.circular(16),
                                    shadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.08),
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '永久有效',
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
                                    h: 32,
                                    radius: BorderRadius.circular(16),
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '永久有效',
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
                              Expanded(
                                flex: 1,
                                child: HSel(
                                  ctrl: g2[0],
                                  index: 1,
                                  on: hbox(
                                    h: 32,
                                    bg: Color(0xFFFFFFFF),
                                    radius: BorderRadius.circular(16),
                                    shadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.08),
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '1 年',
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
                                    h: 32,
                                    radius: BorderRadius.circular(16),
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '1 年',
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
                              Expanded(
                                flex: 1,
                                child: HSel(
                                  ctrl: g2[0],
                                  index: 2,
                                  on: hbox(
                                    h: 32,
                                    bg: Color(0xFFFFFFFF),
                                    radius: BorderRadius.circular(16),
                                    shadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.08),
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '2 年',
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
                                    h: 32,
                                    radius: BorderRadius.circular(16),
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '2 年',
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
                    cross: CrossAxisAlignment.stretch,
                    gap: 10,
                  ),
                ),
                hTap(
                  context,
                  hbox(
                    h: 48,
                    radius: BorderRadius.circular(24),
                    child: Align(
                      alignment: Alignment.center,
                      widthFactor: 1,
                      child: Text(
                        '停用此卡种',
                        style: hts(
                          15,
                          Color(0xFFA43433),
                          w: FontWeight.w500,
                          lh: 22,
                        ),
                      ),
                    ),
                  ),
                  onTap: () => hConfirmPop(context, '停用此卡种'),
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
