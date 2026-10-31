import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class NotifySettingsPage extends StatelessWidget {
  const NotifySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1320,
      fixedHeight: false,
      flow: hcol(
        [
          hbox(
            pad: EdgeInsets.fromLTRB(20, topInset(context), 20, 40),
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
                        '通知与消息',
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
                  pad: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  clip: true,
                  child: hstack(
                    hcol(
                      [
                        hcol(
                          [
                            Text(
                              '本月已通知会员',
                              style: hts(13, Color(0xFFA1A1AA), lh: 18),
                            ),
                            hrow(
                              [
                                Flexible(
                                  flex: 63,
                                  child: Text(
                                    '326',
                                    style: hts(
                                      36,
                                      Color(0xFFFAFAFA),
                                      w: FontWeight.w600,
                                      lh: 44,
                                      ls: -0.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 14,
                                  child: Text(
                                    '条',
                                    style: hts(14, Color(0xFFA1A1AA)),
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
                          gap: 4,
                        ),
                        hcol(
                          [
                            hbox(
                              h: 8,
                              radius: BorderRadius.circular(4),
                              clip: true,
                              child: hrow(
                                [
                                  Expanded(
                                    flex: 760,
                                    child: hbox(
                                      bg: Color(0xFF17C964),
                                      radius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 240,
                                    child: hbox(
                                      bg: Color(0xFF0485F7),
                                      radius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.stretch,
                                gap: 2,
                                intrinsic: true,
                              ),
                            ),
                            hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hrow(
                                    [
                                      hbox(
                                        w: 8,
                                        h: 8,
                                        bg: Color(0xFF17C964),
                                        radius: BorderRadius.circular(4),
                                      ),
                                      Flexible(
                                        flex: 101,
                                        child: Text(
                                          '微信 248 条 · 免费',
                                          style: hts(
                                            12,
                                            Color(0xFFD4D4D8),
                                            lh: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 6,
                                  ),
                                ),
                                hrow(
                                  [
                                    hbox(
                                      w: 8,
                                      h: 8,
                                      bg: Color(0xFF0485F7),
                                      radius: BorderRadius.circular(4),
                                    ),
                                    Flexible(
                                      flex: 112,
                                      child: Text(
                                        '短信 78 条 · 约 ¥4.7',
                                        style: hts(
                                          12,
                                          Color(0xFFD4D4D8),
                                          lh: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 6,
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.center,
                              gap: 0,
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
                    [
                      Positioned(
                        top: -90,
                        right: -90,
                        child: hsvg(Svgs.s2, w: 240, h: 240),
                      ),
                    ],
                  ),
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '发送渠道 · 商家自选',
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
                            minH: 76,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hTap(
                                    context,
                                    hbox(
                                      minH: 76,
                                      child: hrow(
                                        [
                                          hbox(
                                            w: 40,
                                            h: 40,
                                            bg: Color(0xFFDDF6E7),
                                            radius: BorderRadius.circular(13),
                                            child: hrow(
                                              [hsvg(Svgs.s92, w: 22, h: 22)],
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
                                                  '微信模板消息',
                                                  style: hts(
                                                    15,
                                                    Color(0xFF18181B),
                                                    w: FontWeight.w500,
                                                    lh: 22,
                                                  ),
                                                ),
                                                hrow(
                                                  [
                                                    hbox(
                                                      w: 6,
                                                      h: 6,
                                                      bg: Color(0xFF17C964),
                                                      radius:
                                                          BorderRadius.circular(
                                                            3,
                                                          ),
                                                    ),
                                                    Flexible(
                                                      flex: 157,
                                                      child: Text(
                                                        '已授权 · 驰光汽车美容服务号',
                                                        style: hts(
                                                          12,
                                                          Color(0xFF2B7745),
                                                          lh: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  main: MainAxisAlignment.start,
                                                  cross:
                                                      CrossAxisAlignment.center,
                                                  gap: 5,
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
                                    to: 'ChannelConfig',
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
                            margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                          ),
                          hbox(
                            minH: 76,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hTap(
                                    context,
                                    hbox(
                                      minH: 76,
                                      child: hrow(
                                        [
                                          hbox(
                                            w: 40,
                                            h: 40,
                                            bg: Color(0xFFE1F0FE),
                                            radius: BorderRadius.circular(13),
                                            child: hrow(
                                              [hsvg(Svgs.s93, w: 22, h: 22)],
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
                                                  '短信',
                                                  style: hts(
                                                    15,
                                                    Color(0xFF18181B),
                                                    w: FontWeight.w500,
                                                    lh: 22,
                                                  ),
                                                ),
                                                hrow(
                                                  [
                                                    hbox(
                                                      w: 6,
                                                      h: 6,
                                                      bg: Color(0xFF17C964),
                                                      radius:
                                                          BorderRadius.circular(
                                                            3,
                                                          ),
                                                    ),
                                                    Flexible(
                                                      flex: 159,
                                                      child: Text(
                                                        '【驰光汽车】· 剩余 1,240 条',
                                                        style: hts(
                                                          12,
                                                          Color(0xFF52525B),
                                                          lh: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  main: MainAxisAlignment.start,
                                                  cross:
                                                      CrossAxisAlignment.center,
                                                  gap: 5,
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
                                    to: 'ChannelConfig',
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
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '发送策略',
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
                      child: HSelHolder(
                        groups: [
                          ({0}, false),
                        ],
                        builder: (context, g1) => hcol(
                          [
                            HSel(
                              ctrl: g1[0],
                              index: 0,
                              on: hTap(
                                context,
                                hbox(
                                  minH: 60,
                                  pad: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: hrow(
                                    [
                                      Expanded(
                                        flex: 1,
                                        child: hcol(
                                          [
                                            hcol(
                                              [
                                                Text(
                                                  '优先微信，失败转短信',
                                                  style: hts(
                                                    15,
                                                    Color(0xFF18181B),
                                                    w: FontWeight.w500,
                                                    lh: 22,
                                                  ),
                                                ),
                                                hbox(
                                                  bg: Color(0xFFE1F0FE),
                                                  radius: BorderRadius.circular(
                                                    8,
                                                  ),
                                                  pad: EdgeInsets.fromLTRB(
                                                    6,
                                                    1,
                                                    6,
                                                    1,
                                                  ),
                                                  child: Text(
                                                    '推荐',
                                                    style: hts(
                                                      11,
                                                      Color(0xFF1E63AE),
                                                      w: FontWeight.w600,
                                                      lh: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              main: MainAxisAlignment.start,
                                              cross: CrossAxisAlignment.stretch,
                                              gap: 0,
                                            ),
                                            Text(
                                              '会员已关注公众号走微信，否则自动发短信',
                                              style: hts(
                                                12,
                                                Color(0xFF71717A),
                                                lh: 16,
                                              ),
                                            ),
                                          ],
                                          main: MainAxisAlignment.start,
                                          cross: CrossAxisAlignment.stretch,
                                          gap: 2,
                                        ),
                                      ),
                                      hbox(
                                        w: 22,
                                        h: 22,
                                        bg: Color(0xFF0485F7),
                                        radius: BorderRadius.circular(11),
                                        child: hrow(
                                          [
                                            hbox(
                                              w: 8,
                                              h: 8,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(4),
                                            ),
                                          ],
                                          main: MainAxisAlignment.center,
                                          cross: CrossAxisAlignment.center,
                                          gap: 0,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
                                hbox(
                                  minH: 60,
                                  pad: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: hrow(
                                    [
                                      Expanded(
                                        flex: 1,
                                        child: hcol(
                                          [
                                            hcol(
                                              [
                                                Text(
                                                  '优先微信，失败转短信',
                                                  style: hts(
                                                    15,
                                                    Color(0xFF18181B),
                                                    w: FontWeight.w500,
                                                    lh: 22,
                                                  ),
                                                ),
                                                hbox(
                                                  bg: Color(0xFFE1F0FE),
                                                  radius: BorderRadius.circular(
                                                    8,
                                                  ),
                                                  pad: EdgeInsets.fromLTRB(
                                                    6,
                                                    1,
                                                    6,
                                                    1,
                                                  ),
                                                  child: Text(
                                                    '推荐',
                                                    style: hts(
                                                      11,
                                                      Color(0xFF1E63AE),
                                                      w: FontWeight.w600,
                                                      lh: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              main: MainAxisAlignment.start,
                                              cross: CrossAxisAlignment.stretch,
                                              gap: 0,
                                            ),
                                            Text(
                                              '会员已关注公众号走微信，否则自动发短信',
                                              style: hts(
                                                12,
                                                Color(0xFF71717A),
                                                lh: 16,
                                              ),
                                            ),
                                          ],
                                          main: MainAxisAlignment.start,
                                          cross: CrossAxisAlignment.stretch,
                                          gap: 2,
                                        ),
                                      ),
                                      hbox(
                                        w: 22,
                                        h: 22,
                                        bg: Color(0xFF0485F7),
                                        radius: BorderRadius.circular(11),
                                        child: hrow(
                                          [
                                            hbox(
                                              w: 8,
                                              h: 8,
                                              bg: Color(0xFFFFFFFF),
                                              radius: BorderRadius.circular(4),
                                            ),
                                          ],
                                          main: MainAxisAlignment.center,
                                          cross: CrossAxisAlignment.center,
                                          gap: 0,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                              ),
                            ),
                            hbox(
                              h: 1,
                              bg: Color(0xFFEFEFF1),
                              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            ),
                            HSel(
                              ctrl: g1[0],
                              index: 1,
                              on: hTap(
                                context,
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
                                              '仅微信',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w500,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '不产生费用，未关注公众号的会员收不到',
                                              style: hts(
                                                12,
                                                Color(0xFF71717A),
                                                lh: 16,
                                              ),
                                            ),
                                          ],
                                          main: MainAxisAlignment.start,
                                          cross: CrossAxisAlignment.stretch,
                                          gap: 2,
                                        ),
                                      ),
                                      hbox(
                                        w: 22,
                                        h: 22,
                                        radius: BorderRadius.circular(11),
                                        border: Border.all(
                                          color: Color(0xFFD4D4D8),
                                          width: 2,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
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
                                              '仅微信',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w500,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '不产生费用，未关注公众号的会员收不到',
                                              style: hts(
                                                12,
                                                Color(0xFF71717A),
                                                lh: 16,
                                              ),
                                            ),
                                          ],
                                          main: MainAxisAlignment.start,
                                          cross: CrossAxisAlignment.stretch,
                                          gap: 2,
                                        ),
                                      ),
                                      hbox(
                                        w: 22,
                                        h: 22,
                                        radius: BorderRadius.circular(11),
                                        border: Border.all(
                                          color: Color(0xFFD4D4D8),
                                          width: 2,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                              ),
                            ),
                            hbox(
                              h: 1,
                              bg: Color(0xFFEFEFF1),
                              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            ),
                            HSel(
                              ctrl: g1[0],
                              index: 2,
                              on: hTap(
                                context,
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
                                              '仅短信',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w500,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '所有会员都能收到，按条计费',
                                              style: hts(
                                                12,
                                                Color(0xFF71717A),
                                                lh: 16,
                                              ),
                                            ),
                                          ],
                                          main: MainAxisAlignment.start,
                                          cross: CrossAxisAlignment.stretch,
                                          gap: 2,
                                        ),
                                      ),
                                      hbox(
                                        w: 22,
                                        h: 22,
                                        radius: BorderRadius.circular(11),
                                        border: Border.all(
                                          color: Color(0xFFD4D4D8),
                                          width: 2,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
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
                                              '仅短信',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w500,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '所有会员都能收到，按条计费',
                                              style: hts(
                                                12,
                                                Color(0xFF71717A),
                                                lh: 16,
                                              ),
                                            ),
                                          ],
                                          main: MainAxisAlignment.start,
                                          cross: CrossAxisAlignment.stretch,
                                          gap: 2,
                                        ),
                                      ),
                                      hbox(
                                        w: 22,
                                        h: 22,
                                        radius: BorderRadius.circular(11),
                                        border: Border.all(
                                          color: Color(0xFFD4D4D8),
                                          width: 2,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                              ),
                            ),
                            hbox(
                              h: 1,
                              bg: Color(0xFFEFEFF1),
                              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            ),
                            HSel(
                              ctrl: g1[0],
                              index: 3,
                              on: hTap(
                                context,
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
                                              '微信 + 短信同时发',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w500,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '重要通知双保险，费用最高',
                                              style: hts(
                                                12,
                                                Color(0xFF71717A),
                                                lh: 16,
                                              ),
                                            ),
                                          ],
                                          main: MainAxisAlignment.start,
                                          cross: CrossAxisAlignment.stretch,
                                          gap: 2,
                                        ),
                                      ),
                                      hbox(
                                        w: 22,
                                        h: 22,
                                        radius: BorderRadius.circular(11),
                                        border: Border.all(
                                          color: Color(0xFFD4D4D8),
                                          width: 2,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                              ),
                              off: hTap(
                                context,
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
                                              '微信 + 短信同时发',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w500,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '重要通知双保险，费用最高',
                                              style: hts(
                                                12,
                                                Color(0xFF71717A),
                                                lh: 16,
                                              ),
                                            ),
                                          ],
                                          main: MainAxisAlignment.start,
                                          cross: CrossAxisAlignment.stretch,
                                          gap: 2,
                                        ),
                                      ),
                                      hbox(
                                        w: 22,
                                        h: 22,
                                        radius: BorderRadius.circular(11),
                                        border: Border.all(
                                          color: Color(0xFFD4D4D8),
                                          width: 2,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.center,
                                    gap: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.stretch,
                          gap: 0,
                        ),
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
                        '通知场景 · 点击编辑内容',
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
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hTap(
                                    context,
                                    hbox(
                                      minH: 64,
                                      child: hrow(
                                        [
                                          hbox(
                                            w: 32,
                                            h: 32,
                                            bg: Color(0xFFE1F0FE),
                                            radius: BorderRadius.circular(10),
                                            child: hrow(
                                              [hsvg(Svgs.s62, w: 18, h: 18)],
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
                                                  '消费扣款',
                                                  style: hts(
                                                    15,
                                                    Color(0xFF18181B),
                                                    lh: 22,
                                                  ),
                                                ),
                                                hrow(
                                                  [
                                                    Flexible(
                                                      flex: 34,
                                                      child: hbox(
                                                        bg: Color(0xFFDDF6E7),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '微信',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF2B7745),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 34,
                                                      child: hbox(
                                                        bg: Color(0xFFE1F0FE),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '短信',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF1E63AE),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  main: MainAxisAlignment.start,
                                                  cross: CrossAxisAlignment
                                                      .stretch,
                                                  gap: 4,
                                                  intrinsic: true,
                                                ),
                                              ],
                                              main: MainAxisAlignment.start,
                                              cross: CrossAxisAlignment.stretch,
                                              gap: 3,
                                            ),
                                          ),
                                          hsvg(Svgs.s9, w: 16, h: 16),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 12,
                                      ),
                                    ),
                                    to: 'NotifyTemplate',
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
                            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hTap(
                                    context,
                                    hbox(
                                      minH: 64,
                                      child: hrow(
                                        [
                                          hbox(
                                            w: 32,
                                            h: 32,
                                            bg: Color(0xFFDDF6E7),
                                            radius: BorderRadius.circular(10),
                                            child: hrow(
                                              [hsvg(Svgs.s94, w: 18, h: 18)],
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
                                                  '储值充值',
                                                  style: hts(
                                                    15,
                                                    Color(0xFF18181B),
                                                    lh: 22,
                                                  ),
                                                ),
                                                hrow(
                                                  [
                                                    Flexible(
                                                      flex: 34,
                                                      child: hbox(
                                                        bg: Color(0xFFDDF6E7),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '微信',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF2B7745),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 34,
                                                      child: hbox(
                                                        bg: Color(0xFFE1F0FE),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '短信',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF1E63AE),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  main: MainAxisAlignment.start,
                                                  cross: CrossAxisAlignment
                                                      .stretch,
                                                  gap: 4,
                                                  intrinsic: true,
                                                ),
                                              ],
                                              main: MainAxisAlignment.start,
                                              cross: CrossAxisAlignment.stretch,
                                              gap: 3,
                                            ),
                                          ),
                                          hsvg(Svgs.s9, w: 16, h: 16),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 12,
                                      ),
                                    ),
                                    to: 'NotifyTemplate',
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
                            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hTap(
                                    context,
                                    hbox(
                                      minH: 64,
                                      child: hrow(
                                        [
                                          hbox(
                                            w: 32,
                                            h: 32,
                                            bg: Color(0xFFEEEEF0),
                                            radius: BorderRadius.circular(10),
                                            child: hrow(
                                              [hsvg(Svgs.s95, w: 18, h: 18)],
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
                                                  '次卡核销',
                                                  style: hts(
                                                    15,
                                                    Color(0xFF18181B),
                                                    lh: 22,
                                                  ),
                                                ),
                                                hrow(
                                                  [
                                                    Flexible(
                                                      flex: 34,
                                                      child: hbox(
                                                        bg: Color(0xFFDDF6E7),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '微信',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF2B7745),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  main: MainAxisAlignment.start,
                                                  cross: CrossAxisAlignment
                                                      .stretch,
                                                  gap: 4,
                                                  intrinsic: true,
                                                ),
                                              ],
                                              main: MainAxisAlignment.start,
                                              cross: CrossAxisAlignment.stretch,
                                              gap: 3,
                                            ),
                                          ),
                                          hsvg(Svgs.s9, w: 16, h: 16),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 12,
                                      ),
                                    ),
                                    to: 'NotifyTemplate',
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
                            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hTap(
                                    context,
                                    hbox(
                                      minH: 64,
                                      child: hrow(
                                        [
                                          hbox(
                                            w: 32,
                                            h: 32,
                                            bg: Color(0xFFFFE1E2),
                                            radius: BorderRadius.circular(10),
                                            child: hrow(
                                              [hsvg(Svgs.s96, w: 18, h: 18)],
                                              main: MainAxisAlignment.center,
                                              cross: CrossAxisAlignment.center,
                                              gap: 0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: hcol(
                                              [
                                                Text.rich(
                                                  TextSpan(
                                                    style: hts(
                                                      15,
                                                      Color(0xFF18181B),
                                                      lh: 22,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '余额不足 ',
                                                        style: hts(
                                                          15,
                                                          Color(0xFF18181B),
                                                          lh: 22,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '· 低于 ¥300',
                                                        style: hts(
                                                          12,
                                                          Color(0xFF71717A),
                                                          lh: 22,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                hrow(
                                                  [
                                                    Flexible(
                                                      flex: 34,
                                                      child: hbox(
                                                        bg: Color(0xFFE1F0FE),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '短信',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF1E63AE),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  main: MainAxisAlignment.start,
                                                  cross: CrossAxisAlignment
                                                      .stretch,
                                                  gap: 4,
                                                  intrinsic: true,
                                                ),
                                              ],
                                              main: MainAxisAlignment.start,
                                              cross: CrossAxisAlignment.stretch,
                                              gap: 3,
                                            ),
                                          ),
                                          hsvg(Svgs.s9, w: 16, h: 16),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 12,
                                      ),
                                    ),
                                    to: 'NotifyTemplate',
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
                            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hTap(
                                    context,
                                    hbox(
                                      minH: 64,
                                      child: hrow(
                                        [
                                          hbox(
                                            w: 32,
                                            h: 32,
                                            bg: Color(0xFFFDEFD6),
                                            radius: BorderRadius.circular(10),
                                            child: hrow(
                                              [hsvg(Svgs.s97, w: 18, h: 18)],
                                              main: MainAxisAlignment.center,
                                              cross: CrossAxisAlignment.center,
                                              gap: 0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: hcol(
                                              [
                                                Text.rich(
                                                  TextSpan(
                                                    style: hts(
                                                      15,
                                                      Color(0xFF18181B),
                                                      lh: 22,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '次卡将到期 ',
                                                        style: hts(
                                                          15,
                                                          Color(0xFF18181B),
                                                          lh: 22,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '· 提前 7 天',
                                                        style: hts(
                                                          12,
                                                          Color(0xFF71717A),
                                                          lh: 22,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                hrow(
                                                  [
                                                    Flexible(
                                                      flex: 34,
                                                      child: hbox(
                                                        bg: Color(0xFFDDF6E7),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '微信',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF2B7745),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 34,
                                                      child: hbox(
                                                        bg: Color(0xFFE1F0FE),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '短信',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF1E63AE),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  main: MainAxisAlignment.start,
                                                  cross: CrossAxisAlignment
                                                      .stretch,
                                                  gap: 4,
                                                  intrinsic: true,
                                                ),
                                              ],
                                              main: MainAxisAlignment.start,
                                              cross: CrossAxisAlignment.stretch,
                                              gap: 3,
                                            ),
                                          ),
                                          hsvg(Svgs.s9, w: 16, h: 16),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 12,
                                      ),
                                    ),
                                    to: 'NotifyTemplate',
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
                            margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          ),
                          hbox(
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hTap(
                                    context,
                                    hbox(
                                      minH: 64,
                                      child: hrow(
                                        [
                                          hbox(
                                            w: 32,
                                            h: 32,
                                            bg: Color(0xFFF5D78E),
                                            radius: BorderRadius.circular(10),
                                            child: hrow(
                                              [hsvg(Svgs.s98, w: 18, h: 18)],
                                              main: MainAxisAlignment.center,
                                              cross: CrossAxisAlignment.center,
                                              gap: 0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: hcol(
                                              [
                                                Text.rich(
                                                  TextSpan(
                                                    style: hts(
                                                      15,
                                                      Color(0xFF18181B),
                                                      lh: 22,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '生日祝福 ',
                                                        style: hts(
                                                          15,
                                                          Color(0xFF18181B),
                                                          lh: 22,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '· 当天 09:00',
                                                        style: hts(
                                                          12,
                                                          Color(0xFF71717A),
                                                          lh: 22,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                hrow(
                                                  [
                                                    Flexible(
                                                      flex: 67,
                                                      child: hbox(
                                                        bg: Color(0xFFEEEEF0),
                                                        radius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        pad:
                                                            EdgeInsets.fromLTRB(
                                                              6,
                                                              0,
                                                              6,
                                                              0,
                                                            ),
                                                        child: Text(
                                                          '未选择渠道',
                                                          style: hts(
                                                            11,
                                                            Color(0xFF71717A),
                                                            w: FontWeight.w500,
                                                            lh: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  main: MainAxisAlignment.start,
                                                  cross: CrossAxisAlignment
                                                      .stretch,
                                                  gap: 4,
                                                  intrinsic: true,
                                                ),
                                              ],
                                              main: MainAxisAlignment.start,
                                              cross: CrossAxisAlignment.stretch,
                                              gap: 3,
                                            ),
                                          ),
                                          hsvg(Svgs.s9, w: 16, h: 16),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 12,
                                      ),
                                    ),
                                    to: 'NotifyTemplate',
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
                hTap(
                  context,
                  hbox(
                    h: 56,
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
                    pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: hrow(
                      [
                        hbox(
                          w: 32,
                          h: 32,
                          bg: Color(0xFFEEEEF0),
                          radius: BorderRadius.circular(10),
                          child: hrow(
                            [hsvg(Svgs.s99, w: 18, h: 18)],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '发送记录',
                            style: hts(15, Color(0xFF18181B), lh: 22),
                          ),
                        ),
                        Text(
                          '今日 12 条 · 1 条失败',
                          style: hts(13, Color(0xFF71717A), lh: 18),
                        ),
                        hsvg(Svgs.s9, w: 16, h: 16),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 12,
                    ),
                  ),
                  to: 'NotifyLog',
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
