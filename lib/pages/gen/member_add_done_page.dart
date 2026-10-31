import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class MemberAddDonePage extends StatelessWidget {
  const MemberAddDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: dk(context, Color(0xFFF4F4F5), Color(0xFF09090B)),
      height: 1120,
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
                        bg: dk(context, Color(0xFFFFFFFF), Color(0xFF18181B)),
                        radius: BorderRadius.circular(22),
                        shadow: dk(
                          context,
                          [
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
                          [
                            BoxShadow(
                              color: Color(0xFF26262B),
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: hrow(
                          [hsvg(dk(context, Svgs.s26, Svgs.s27), w: 20, h: 20)],
                          main: MainAxisAlignment.center,
                          cross: CrossAxisAlignment.center,
                          gap: 0,
                        ),
                      ),
                      back: true,
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 0,
                ),
                hbox(
                  pad: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: hcol(
                    [
                      hbox(
                        w: 96,
                        h: 96,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: hstack(
                          hrow(
                            [
                              hbox(
                                w: 72,
                                h: 72,
                                bg: Color(0xFF17C964),
                                radius: BorderRadius.circular(36),
                                shadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(23, 201, 100, 0.35),
                                    offset: Offset(0, 8),
                                    blurRadius: 20,
                                    spreadRadius: 0,
                                  ),
                                ],
                                child: hrow(
                                  [hsvg(Svgs.s29, w: 36, h: 36)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                          [],
                          behind: [
                            Positioned(
                              left: -32,
                              top: -32,
                              child: hsvg(Svgs.s28, w: 160, h: 160),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '开卡成功',
                        style: hts(
                          17,
                          dk(context, Color(0xFF2B7745), Color(0xFF5FD48C)),
                          w: FontWeight.w600,
                          lh: 24,
                        ),
                      ),
                      Text(
                        '已为李女士建立金卡会员档案',
                        style: hts(
                          13,
                          dk(context, Color(0xFF71717A), Color(0xFF9A9AA3)),
                          lh: 18,
                        ),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.center,
                    gap: 6,
                  ),
                ),
                hbox(
                  bg: dk(context, Color(0xFFFFFFFF), Color(0xFF18181B)),
                  radius: BorderRadius.circular(24),
                  shadow: dk(
                    context,
                    [
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
                    [
                      BoxShadow(
                        color: Color(0xFF26262B),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  pad: EdgeInsets.fromLTRB(18, 6, 18, 6),
                  child: hcol(
                    [
                      hbox(
                        minH: 36,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '会员',
                                style: hts(
                                  14,
                                  dk(
                                    context,
                                    Color(0xFF71717A),
                                    Color(0xFF9A9AA3),
                                  ),
                                  lh: 20,
                                ),
                              ),
                            ),
                            Text(
                              '李女士 · 139 **** 5530',
                              style: hts(
                                14,
                                dk(
                                  context,
                                  Color(0xFF18181B),
                                  Color(0xFFFAFAFA),
                                ),
                                w: FontWeight.w500,
                                lh: 20,
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.baseline,
                          gap: 12,
                        ),
                      ),
                      hbox(
                        h: 1,
                        bg: dk(context, Color(0xFFEFEFF1), Color(0xFF2A2A2E)),
                      ),
                      hbox(
                        minH: 36,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '卡种',
                                style: hts(
                                  14,
                                  dk(
                                    context,
                                    Color(0xFF71717A),
                                    Color(0xFF9A9AA3),
                                  ),
                                  lh: 20,
                                ),
                              ),
                            ),
                            Text(
                              '金卡会员（9.2 折）',
                              style: hts(
                                14,
                                dk(
                                  context,
                                  Color(0xFF18181B),
                                  Color(0xFFFAFAFA),
                                ),
                                w: FontWeight.w600,
                                lh: 20,
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.baseline,
                          gap: 12,
                        ),
                      ),
                      hbox(
                        h: 1,
                        bg: dk(context, Color(0xFFEFEFF1), Color(0xFF2A2A2E)),
                      ),
                      hbox(
                        minH: 36,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '车辆',
                                style: hts(
                                  14,
                                  dk(
                                    context,
                                    Color(0xFF71717A),
                                    Color(0xFF9A9AA3),
                                  ),
                                  lh: 20,
                                ),
                              ),
                            ),
                            Text(
                              '宝马 5系 525Li · 沪A·8K29M',
                              style: hts(
                                14,
                                dk(
                                  context,
                                  Color(0xFF18181B),
                                  Color(0xFFFAFAFA),
                                ),
                                w: FontWeight.w500,
                                lh: 20,
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.baseline,
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
                  bg: dk(context, Color(0xFFFFFFFF), Color(0xFF18181B)),
                  radius: BorderRadius.circular(24),
                  shadow: dk(
                    context,
                    [
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
                    [
                      BoxShadow(
                        color: Color(0xFF26262B),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  pad: EdgeInsets.fromLTRB(18, 18, 18, 18),
                  child: hcol(
                    [
                      hrow(
                        [
                          hbox(
                            w: 32,
                            h: 32,
                            bg: dk(
                              context,
                              Color(0xFFDDF6E7),
                              Color.fromRGBO(23, 201, 100, 0.16),
                            ),
                            radius: BorderRadius.circular(10),
                            child: hrow(
                              [
                                hsvg(
                                  dk(context, Svgs.s188, Svgs.s189),
                                  w: 18,
                                  h: 18,
                                ),
                              ],
                              main: MainAxisAlignment.center,
                              cross: CrossAxisAlignment.center,
                              gap: 0,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '让会员扫码绑定微信',
                              style: hts(
                                16,
                                dk(
                                  context,
                                  Color(0xFF18181B),
                                  Color(0xFFFAFAFA),
                                ),
                                w: FontWeight.w600,
                                lh: 22,
                              ),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 10,
                      ),
                      Text(
                        '现在绑定，第一笔充值和消费就能收到免费微信通知，也可以自己查余额。',
                        style: hts(
                          13,
                          dk(context, Color(0xFF52525B), Color(0xFFA8A8B3)),
                          lh: 20,
                        ),
                      ),
                      hrow(
                        [
                          hbox(
                            bg: dk(
                              context,
                              Color(0xFFFFFFFF),
                              Color(0xFF18181B),
                            ),
                            radius: BorderRadius.circular(20),
                            border: dk(
                              context,
                              Border.all(color: Color(0xFFE4E4E7), width: 1),
                              Border.all(color: Color(0xFF3A3A40), width: 1),
                            ),
                            pad: EdgeInsets.fromLTRB(14, 14, 14, 14),
                            child: hrow(
                              [hsvg(Svgs.s190, w: 132, h: 132)],
                              main: MainAxisAlignment.center,
                              cross: CrossAxisAlignment.center,
                              gap: 0,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.center,
                        cross: CrossAxisAlignment.stretch,
                        gap: 0,
                        intrinsic: true,
                      ),
                      hbox(
                        pad: EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hcol(
                                [
                                  hbox(
                                    w: 24,
                                    h: 24,
                                    bg: dk(
                                      context,
                                      Color(0xFF18181B),
                                      Color(0xFF34343A),
                                    ),
                                    radius: BorderRadius.circular(12),
                                    align: Alignment(0, 0),
                                    child: Text(
                                      '1',
                                      style: hts(
                                        12,
                                        Color(0xFFFFFFFF),
                                        w: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    '扫码关注公众号',
                                    style: hts(
                                      12,
                                      dk(
                                        context,
                                        Color(0xFF52525B),
                                        Color(0xFFA8A8B3),
                                      ),
                                      lh: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 6,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hcol(
                                [
                                  hbox(
                                    w: 24,
                                    h: 24,
                                    bg: dk(
                                      context,
                                      Color(0xFF18181B),
                                      Color(0xFF34343A),
                                    ),
                                    radius: BorderRadius.circular(12),
                                    align: Alignment(0, 0),
                                    child: Text(
                                      '2',
                                      style: hts(
                                        12,
                                        Color(0xFFFFFFFF),
                                        w: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    '授权手机号',
                                    style: hts(
                                      12,
                                      dk(
                                        context,
                                        Color(0xFF52525B),
                                        Color(0xFFA8A8B3),
                                      ),
                                      lh: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 6,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hcol(
                                [
                                  hbox(
                                    w: 24,
                                    h: 24,
                                    bg: dk(
                                      context,
                                      Color(0xFF18181B),
                                      Color(0xFF34343A),
                                    ),
                                    radius: BorderRadius.circular(12),
                                    align: Alignment(0, 0),
                                    child: Text(
                                      '3',
                                      style: hts(
                                        12,
                                        Color(0xFFFFFFFF),
                                        w: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    '自动绑定并补发通知',
                                    style: hts(
                                      12,
                                      dk(
                                        context,
                                        Color(0xFF52525B),
                                        Color(0xFFA8A8B3),
                                      ),
                                      lh: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 6,
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.start,
                          gap: 4,
                        ),
                      ),
                      hrow(
                        [
                          Expanded(
                            flex: 1,
                            child: hTap(
                              context,
                              hbox(
                                h: 46,
                                bg: dk(
                                  context,
                                  Color(0xFFEEEEF0),
                                  Color(0xFF27272A),
                                ),
                                radius: BorderRadius.circular(23),
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  widthFactor: 1,
                                  child: Text(
                                    '改发短信邀请',
                                    style: hts(
                                      13,
                                      dk(
                                        context,
                                        Color(0xFF18181B),
                                        Color(0xFFFAFAFA),
                                      ),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                              to: 'BindInvite',
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: hTap(
                              context,
                              hbox(
                                h: 46,
                                radius: BorderRadius.circular(23),
                                border: Border.all(
                                  color: Color(0xFFC7C7CC),
                                  width: 1.5,
                                ),
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  widthFactor: 1,
                                  child: Text(
                                    '会员已扫码（演示）',
                                    style: hts(
                                      13,
                                      dk(
                                        context,
                                        Color(0xFF52525B),
                                        Color(0xFFA8A8B3),
                                      ),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              label: '会员已扫码（演示）',
                            ),
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
            bg: dk(
              context,
              Color.fromRGBO(255, 255, 255, 0.92),
              Color.fromRGBO(9, 9, 11, 0.92),
            ),
            shadow: dk(
              context,
              [
                BoxShadow(
                  color: Color(0xFFE4E4E7),
                  offset: Offset(0, -1),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
              [
                BoxShadow(
                  color: Color(0xFF3A3A40),
                  offset: Offset(0, -1),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
            ),
            pad: EdgeInsets.fromLTRB(20, 12, 20, bottomInset(context)),
            child: hrow(
              [
                Expanded(
                  flex: 1,
                  child: hTap(
                    context,
                    hbox(
                      h: 50,
                      bg: dk(context, Color(0xFFEEEEF0), Color(0xFF27272A)),
                      radius: BorderRadius.circular(25),
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '稍后绑定',
                          style: hts(
                            15,
                            dk(context, Color(0xFF18181B), Color(0xFFFAFAFA)),
                            w: FontWeight.w500,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'MemberDetail',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: hTap(
                    context,
                    hbox(
                      h: 50,
                      bg: dk(context, Color(0xFF18181B), Color(0xFFFAFAFA)),
                      radius: BorderRadius.circular(25),
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '去充值',
                          style: hts(
                            15,
                            dk(context, Color(0xFFFFFFFF), Color(0xFF18181B)),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Recharge',
                  ),
                ),
              ],
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.stretch,
              gap: 10,
              intrinsic: true,
            ),
          ),
        ),
      ],
    );
  }
}
