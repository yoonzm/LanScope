import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class BindH5Page extends StatelessWidget {
  const BindH5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 900,
      fixedHeight: false,
      flow: hcol(
        [
          hbox(
            pad: EdgeInsets.fromLTRB(20, topInset(context), 20, 0),
            child: hcol(
              [
                hbox(
                  bg: Color(0xFF18181B),
                  radius: BorderRadius.circular(28),
                  pad: EdgeInsets.fromLTRB(20, 22, 20, 22),
                  clip: true,
                  child: hstack(
                    hcol(
                      [
                        hrow(
                          [
                            hbox(
                              w: 48,
                              h: 48,
                              bg: Color(0xFFF5D78E),
                              radius: BorderRadius.circular(24),
                              align: Alignment(0, 0),
                              child: Text(
                                '驰',
                                style: hts(
                                  18,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 97,
                              child: IntrinsicWidth(
                                child: hcol(
                                  [
                                    Text(
                                      '驰光汽车美容',
                                      style: hts(
                                        16,
                                        Color(0xFFFAFAFA),
                                        w: FontWeight.w600,
                                        lh: 22,
                                      ),
                                    ),
                                    Text(
                                      '徐汇店 · 会员中心',
                                      style: hts(12, Color(0xFFA1A1AA), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 12,
                        ),
                        Text(
                          '绑定会员\n余额次卡一手掌握',
                          style: hts(
                            24,
                            Color(0xFFFAFAFA),
                            w: FontWeight.w600,
                            lh: 32,
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.stretch,
                      gap: 16,
                    ),
                    [],
                    behind: [
                      Positioned(
                        top: -90,
                        right: -90,
                        child: hsvg(Svgs.s2, w: 240, h: 240),
                      ),
                    ],
                  ),
                ),
                hrow(
                  [
                    Expanded(
                      flex: 1,
                      child: hbox(
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
                        pad: EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: hcol(
                          [
                            hbox(
                              w: 32,
                              h: 32,
                              bg: Color(0xFFE1F0FE),
                              radius: BorderRadius.circular(10),
                              child: hrow(
                                [hsvg(Svgs.s14, w: 18, h: 18)],
                                main: MainAxisAlignment.center,
                                cross: CrossAxisAlignment.center,
                                gap: 0,
                              ),
                            ),
                            Text(
                              '查余额',
                              style: hts(12, Color(0xFF3F3F46), lh: 16),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 6,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: hbox(
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
                        pad: EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: hcol(
                          [
                            hbox(
                              w: 32,
                              h: 32,
                              bg: Color(0xFFDDF6E7),
                              radius: BorderRadius.circular(10),
                              child: hrow(
                                [hsvg(Svgs.s15, w: 18, h: 18)],
                                main: MainAxisAlignment.center,
                                cross: CrossAxisAlignment.center,
                                gap: 0,
                              ),
                            ),
                            Text(
                              '看次卡',
                              style: hts(12, Color(0xFF3F3F46), lh: 16),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 6,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: hbox(
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
                        pad: EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: hcol(
                          [
                            hbox(
                              w: 32,
                              h: 32,
                              bg: Color(0xFFFFE1E2),
                              radius: BorderRadius.circular(10),
                              child: hrow(
                                [hsvg(Svgs.s16, w: 18, h: 18)],
                                main: MainAxisAlignment.center,
                                cross: CrossAxisAlignment.center,
                                gap: 0,
                              ),
                            ),
                            Text(
                              '收通知',
                              style: hts(12, Color(0xFF3F3F46), lh: 16),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 6,
                        ),
                      ),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
                  gap: 10,
                  intrinsic: true,
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
                        '请验证您在店内登记的手机号，验证后即可绑定',
                        style: hts(13, Color(0xFF71717A), lh: 18),
                      ),
                      hcol(
                        [
                          Text(
                            '手机号',
                            style: hts(
                              13,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 18,
                            ),
                          ),
                          hbox(
                            h: 48,
                            bg: Color(0xFFF4F4F5),
                            radius: BorderRadius.circular(16),
                            pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                            align: Alignment.centerLeft,
                            child: HInput(
                              style: hts(
                                15,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
                                lh: 22,
                              ),
                              value: '139 **** 5530',
                              keyboard: TextInputType.phone,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hcol(
                        [
                          Text(
                            '验证码',
                            style: hts(
                              13,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 18,
                            ),
                          ),
                          hrow(
                            [
                              Expanded(
                                child: hbox(
                                  h: 48,
                                  minW: 0,
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  align: Alignment.centerLeft,
                                  child: HInput(
                                    style: hts(
                                      17,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 24,
                                      ls: 4,
                                    ),
                                    value: '4 8 2 0',
                                    keyboard: TextInputType.number,
                                  ),
                                ),
                              ),
                              hTap(
                                context,
                                hbox(
                                  h: 48,
                                  bg: Color(0xFFE1F0FE),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '52 秒后重发',
                                      style: hts(
                                        13,
                                        Color(0xFF1E63AE),
                                        w: FontWeight.w600,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                label: '52 秒后重发',
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 8,
                            intrinsic: true,
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hrow(
                        [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: HCheck(
                              initial: true,
                              size: 16,
                              color: Color(0xFF0485F7),
                            ),
                          ),
                          Flexible(
                            flex: 348,
                            child: Text(
                              '同意商家向我发送消费、充值及到期提醒等服务通知，可随时关闭',
                              style: hts(12, Color(0xFF71717A), lh: 18),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.start,
                        gap: 8,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 14,
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
            bg: Color.fromRGBO(255, 255, 255, 0.92),
            shadow: [
              BoxShadow(
                color: Color(0xFFE4E4E7),
                offset: Offset(0, -1),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
            pad: EdgeInsets.fromLTRB(20, 12, 20, bottomInset(context)),
            child: hcol(
              [
                hTap(
                  context,
                  hbox(
                    h: 50,
                    bg: Color(0xFF0485F7),
                    radius: BorderRadius.circular(25),
                    child: Align(
                      alignment: Alignment(0, 0),
                      widthFactor: 1,
                      child: Text(
                        '确认绑定',
                        style: hts(
                          15,
                          Color(0xFFFFFFFF),
                          w: FontWeight.w600,
                          lh: 22,
                        ),
                      ),
                    ),
                  ),
                  to: 'BindDone',
                ),
              ],
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.stretch,
              gap: 0,
            ),
          ),
        ),
      ],
    );
  }
}
