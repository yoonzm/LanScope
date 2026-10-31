import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class RechargePage extends StatelessWidget {
  const RechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 960,
      fixedHeight: false,
      flow: hcol(
        [
          hbox(
            pad: EdgeInsets.fromLTRB(20, topInset(context), 20, 0),
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
                        '会员充值',
                        style: hts(
                          17,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    hbox(w: 44),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hbox(
                  bg: Color(0xFF18181B),
                  radius: BorderRadius.circular(28),
                  pad: EdgeInsets.fromLTRB(20, 18, 20, 18),
                  clip: true,
                  child: hstack(
                    hcol(
                      [
                        hrow(
                          [
                            hbox(
                              w: 36,
                              h: 36,
                              bg: Color(0xFFF5D78E),
                              radius: BorderRadius.circular(18),
                              align: Alignment(0, 0),
                              child: Text(
                                '王',
                                style: hts(
                                  14,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text.rich(
                                TextSpan(
                                  style: hts(
                                    15,
                                    Color(0xFFFAFAFA),
                                    w: FontWeight.w500,
                                    lh: 22,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '王建国 ',
                                      style: hts(
                                        15,
                                        Color(0xFFFAFAFA),
                                        w: FontWeight.w500,
                                        lh: 22,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '· 138 **** 6021',
                                      style: hts(12, Color(0xFFA1A1AA), lh: 22),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            hbox(
                              bg: Color(0xFFF5D78E),
                              radius: BorderRadius.circular(10),
                              pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text(
                                '黑金会员',
                                style: hts(
                                  11,
                                  Color(0xFF18181B),
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
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hcol(
                                [
                                  Text(
                                    '当前余额',
                                    style: hts(12, Color(0xFFA1A1AA), lh: 16),
                                  ),
                                  Text(
                                    '¥3,680.00',
                                    style: hts(
                                      24,
                                      Color(0xFFFAFAFA),
                                      w: FontWeight.w600,
                                      lh: 30,
                                      tab: true,
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.stretch,
                                gap: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              child: hsvg(Svgs.s118, w: 20, h: 20),
                            ),
                            hcol(
                              [
                                Text(
                                  '充值后',
                                  style: hts(12, Color(0xFFA1A1AA), lh: 16),
                                ),
                                Text(
                                  '¥5,980.00',
                                  style: hts(
                                    24,
                                    Color(0xFFF5D78E),
                                    w: FontWeight.w600,
                                    lh: 30,
                                    tab: true,
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.end,
                              gap: 2,
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.end,
                          gap: 12,
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.stretch,
                      gap: 14,
                    ),
                    [],
                    behind: [
                      Positioned(
                        right: -80,
                        bottom: -110,
                        child: hsvg(Svgs.s117, w: 220, h: 220),
                      ),
                    ],
                  ),
                ),
                hbox(
                  bg: Color(0xFFE9E9EB),
                  radius: BorderRadius.circular(20),
                  pad: EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: HSelHolder(
                    groups: [
                      ({0}, false),
                    ],
                    builder: (context, g1) => hrow(
                      [
                        Expanded(
                          flex: 1,
                          child: HSel(
                            ctrl: g1[0],
                            index: 0,
                            on: hbox(
                              h: 34,
                              bg: Color(0xFFFFFFFF),
                              radius: BorderRadius.circular(17),
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
                              ],
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '储值充值',
                                  style: hts(
                                    14,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 20,
                                  ),
                                ),
                              ),
                            ),
                            off: hbox(
                              h: 34,
                              radius: BorderRadius.circular(17),
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '储值充值',
                                  style: hts(
                                    14,
                                    Color(0xFF52525B),
                                    w: FontWeight.w500,
                                    lh: 20,
                                  ),
                                ),
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
                              h: 34,
                              bg: Color(0xFFFFFFFF),
                              radius: BorderRadius.circular(17),
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
                              ],
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '购买次卡',
                                  style: hts(
                                    14,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 20,
                                  ),
                                ),
                              ),
                            ),
                            off: hbox(
                              h: 34,
                              radius: BorderRadius.circular(17),
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '购买次卡',
                                  style: hts(
                                    14,
                                    Color(0xFF52525B),
                                    w: FontWeight.w500,
                                    lh: 20,
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
                hcol([
                  hrow(
                    [
                      Expanded(
                        flex: 1,
                        child: hTap(
                          context,
                          hbox(
                            bg: Color(0xFFFFFFFF),
                            radius: BorderRadius.circular(20),
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
                            pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                            child: hcol(
                              [
                                Text(
                                  '¥1,000',
                                  style: hts(
                                    20,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
                                    lh: 28,
                                  ),
                                ),
                                Text(
                                  '送 ¥100',
                                  style: hts(
                                    12,
                                    Color(0xFF2B7745),
                                    w: FontWeight.w500,
                                    lh: 16,
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 4,
                            ),
                          ),
                          label: '¥1,000送 ¥100',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: hTap(
                          context,
                          hbox(
                            bg: Color(0xFFF3F9FF),
                            radius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xFF0485F7),
                              width: 2,
                            ),
                            pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                            child: hstack(
                              hcol(
                                [
                                  Text(
                                    '¥2,000',
                                    style: hts(
                                      20,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 28,
                                    ),
                                  ),
                                  Text(
                                    '送 ¥300 + 洗车 2 次',
                                    style: hts(
                                      12,
                                      Color(0xFF2B7745),
                                      w: FontWeight.w500,
                                      lh: 16,
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.stretch,
                                gap: 4,
                              ),
                              [
                                Positioned(
                                  top: -8,
                                  right: 12,
                                  child: hbox(
                                    bg: Color(0xFF18181B),
                                    radius: BorderRadius.circular(9),
                                    pad: EdgeInsets.fromLTRB(7, 0, 7, 0),
                                    child: Text(
                                      '最多人选',
                                      style: hts(
                                        11,
                                        Color(0xFFFFFFFF),
                                        w: FontWeight.w600,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          label: '最多人选¥2,000送 ¥3',
                        ),
                      ),
                    ],
                    cross: CrossAxisAlignment.stretch,
                    gap: 10,
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
                            bg: Color(0xFFFFFFFF),
                            radius: BorderRadius.circular(20),
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
                            pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                            child: hcol(
                              [
                                Text(
                                  '¥5,000',
                                  style: hts(
                                    20,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
                                    lh: 28,
                                  ),
                                ),
                                Text(
                                  '送 ¥1,000',
                                  style: hts(
                                    12,
                                    Color(0xFF2B7745),
                                    w: FontWeight.w500,
                                    lh: 16,
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 4,
                            ),
                          ),
                          label: '¥5,000送 ¥1,000',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: hTap(
                          context,
                          hbox(
                            bg: Color(0xFFFFFFFF),
                            radius: BorderRadius.circular(20),
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
                            pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                            child: hcol(
                              [
                                Text(
                                  '¥10,000',
                                  style: hts(
                                    20,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
                                    lh: 28,
                                  ),
                                ),
                                Text(
                                  '送 ¥2,500 + 镀晶 1 次',
                                  style: hts(
                                    12,
                                    Color(0xFF2B7745),
                                    w: FontWeight.w500,
                                    lh: 16,
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 4,
                            ),
                          ),
                          label: '¥10,000送 ¥2,50',
                        ),
                      ),
                    ],
                    cross: CrossAxisAlignment.stretch,
                    gap: 10,
                    intrinsic: true,
                    min: false,
                  ),
                  hrow(
                    [
                      Expanded(
                        flex: 2,
                        child: hbox(
                          h: 52,
                          bg: Color(0xFFFFFFFF),
                          radius: BorderRadius.circular(20),
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
                          pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: hrow(
                            [
                              Text(
                                '自定义金额',
                                style: hts(
                                  14,
                                  Color(0xFF18181B),
                                  w: FontWeight.w500,
                                  lh: 20,
                                ),
                              ),
                              Expanded(
                                child: HInput(
                                  style: hts(14, Color(0xFF18181B), lh: 20),
                                  hint: '输入金额，不享赠送',
                                  keyboard: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  align: TextAlign.right,
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
                    cross: CrossAxisAlignment.stretch,
                    gap: 10,
                    intrinsic: true,
                    min: false,
                  ),
                ], gap: 10),
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
                        '收款方式',
                        style: hts(
                          15,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 22,
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
                                  h: 64,
                                  bg: Color(0xFF18181B),
                                  radius: BorderRadius.circular(16),
                                  child: hcol(
                                    [
                                      hsvg(Svgs.s119, w: 20, h: 20),
                                      Text(
                                        '扫码收款',
                                        style: hts(
                                          13,
                                          Color(0xFFFAFAFA),
                                          w: FontWeight.w500,
                                          lh: 18,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.center,
                                    cross: CrossAxisAlignment.center,
                                    gap: 4,
                                    min: false,
                                  ),
                                ),
                                label: '扫码收款',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  h: 64,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  child: hcol(
                                    [
                                      hsvg(Svgs.s120, w: 20, h: 20),
                                      Text(
                                        '现金',
                                        style: hts(
                                          13,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 18,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.center,
                                    cross: CrossAxisAlignment.center,
                                    gap: 4,
                                    min: false,
                                  ),
                                ),
                                label: '现金',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  h: 64,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  child: hcol(
                                    [
                                      hsvg(Svgs.s121, w: 20, h: 20),
                                      Text(
                                        'POS 刷卡',
                                        style: hts(
                                          13,
                                          Color(0xFF18181B),
                                          w: FontWeight.w500,
                                          lh: 18,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.center,
                                    cross: CrossAxisAlignment.center,
                                    gap: 4,
                                    min: false,
                                  ),
                                ),
                                label: 'POS 刷卡',
                              ),
                            ),
                          ],
                          cross: CrossAxisAlignment.stretch,
                          gap: 8,
                          intrinsic: true,
                          min: false,
                        ),
                      ], gap: 8),
                      hrow(
                        [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '经办人',
                              style: hts(13, Color(0xFF52525B), lh: 18),
                            ),
                          ),
                          Text(
                            '陈明（店长）',
                            style: hts(
                              13,
                              Color(0xFF18181B),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 8,
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
      overlays: [
        HBottomDock(
          child: hbox(
            bg: Color(0xFFFFFFFF),
            shadow: [
              BoxShadow(
                color: Color(0xFFE8E8EA),
                offset: Offset(0, -1),
                blurRadius: 0,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.04),
                offset: Offset(0, -8),
                blurRadius: 24,
                spreadRadius: 0,
              ),
            ],
            pad: EdgeInsets.fromLTRB(20, 12, 20, bottomInset(context)),
            child: hrow(
              [
                Expanded(
                  flex: 1,
                  child: hcol(
                    [
                      Text(
                        '实收 · 到账 ¥2,300 + 洗车 2 次',
                        style: hts(12, Color(0xFF71717A), lh: 16),
                      ),
                      Text(
                        '¥2,000.00',
                        style: hts(
                          24,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 30,
                          ls: -0.48,
                          tab: true,
                        ),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 2,
                  ),
                ),
                hTap(
                  context,
                  hbox(
                    h: 50,
                    bg: Color(0xFF0485F7),
                    radius: BorderRadius.circular(25),
                    pad: EdgeInsets.fromLTRB(28, 0, 28, 0),
                    child: Align(
                      alignment: Alignment(0, 0),
                      widthFactor: 1,
                      child: Text(
                        '确认收款',
                        style: hts(
                          16,
                          Color(0xFFFFFFFF),
                          w: FontWeight.w600,
                          lh: 24,
                        ),
                      ),
                    ),
                  ),
                  to: 'RechargeSuccess',
                ),
              ],
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.center,
              gap: 12,
            ),
          ),
        ),
      ],
    );
  }
}
