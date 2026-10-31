import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class ChannelConfigPage extends StatelessWidget {
  const ChannelConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1260,
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
                        '渠道配置',
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
                      to: 'NotifySettings',
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
                        '微信模板消息',
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
                          hrow(
                            [
                              hbox(
                                w: 44,
                                h: 44,
                                bg: Color(0xFFDDF6E7),
                                radius: BorderRadius.circular(22),
                                align: Alignment(0, 0),
                                child: Text(
                                  '驰',
                                  style: hts(
                                    17,
                                    Color(0xFF2B7745),
                                    w: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hcol(
                                  [
                                    Text(
                                      '驰光汽车美容服务号',
                                      style: hts(
                                        15,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                        lh: 22,
                                      ),
                                    ),
                                    hrow(
                                      [
                                        hbox(
                                          w: 6,
                                          h: 6,
                                          bg: Color(0xFF17C964),
                                          radius: BorderRadius.circular(3),
                                        ),
                                        Flexible(
                                          flex: 144,
                                          child: Text(
                                            '已授权 · 2027.03.18 到期',
                                            style: hts(
                                              12,
                                              Color(0xFF2B7745),
                                              lh: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                      main: MainAxisAlignment.start,
                                      cross: CrossAxisAlignment.center,
                                      gap: 5,
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
                                  h: 32,
                                  bg: Color(0xFFEEEEF0),
                                  radius: BorderRadius.circular(16),
                                  pad: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 1,
                                    child: Text(
                                      '重新授权',
                                      style: hts(
                                        13,
                                        Color(0xFF18181B),
                                        w: FontWeight.w500,
                                        lh: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                label: '重新授权',
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 12,
                          ),
                          hbox(
                            bg: Color(0xFFF4F4F5),
                            radius: BorderRadius.circular(18),
                            pad: EdgeInsets.fromLTRB(14, 14, 14, 14),
                            child: hcol(
                              [
                                hrow(
                                  [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '会员已关注公众号',
                                        style: hts(
                                          13,
                                          Color(0xFF52525B),
                                          lh: 18,
                                        ),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        style: hts(
                                          20,
                                          Color(0xFF18181B),
                                          w: FontWeight.w600,
                                          lh: 28,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '412',
                                            style: hts(
                                              20,
                                              Color(0xFF18181B),
                                              w: FontWeight.w600,
                                              lh: 28,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' / 1,086 人',
                                            style: hts(
                                              13,
                                              Color(0xFF71717A),
                                              lh: 28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.baseline,
                                  gap: 0,
                                ),
                                hbox(
                                  h: 8,
                                  bg: Color(0xFFE4E4E7),
                                  radius: BorderRadius.circular(4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: hfrac(
                                          0.38,
                                          hbox(
                                            bg: Color(0xFF17C964),
                                            radius: BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 0,
                                    min: false,
                                  ),
                                ),
                                Text(
                                  '未关注的 674 位会员将按发送策略转为短信，或收不到通知',
                                  style: hts(12, Color(0xFF71717A), lh: 16),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 8,
                            ),
                          ),
                          hrow(
                            [
                              hbox(
                                w: 96,
                                h: 96,
                                bg: Color(0xFFFFFFFF),
                                radius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Color(0xFFE4E4E7),
                                  width: 1,
                                ),
                                child: hrow(
                                  [hsvg(Svgs.s33, w: 76, h: 76)],
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
                                      '引导会员关注',
                                      style: hts(
                                        14,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                        lh: 20,
                                      ),
                                    ),
                                    Text(
                                      '收款成功页会展示此二维码，会员扫码关注后，之后的消费、充值就能收到微信通知',
                                      style: hts(12, Color(0xFF71717A), lh: 18),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: hTap(
                                        context,
                                        hbox(
                                          h: 32,
                                          bg: Color(0xFFE1F0FE),
                                          radius: BorderRadius.circular(16),
                                          pad: EdgeInsets.fromLTRB(
                                            12,
                                            0,
                                            12,
                                            0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            widthFactor: 1,
                                            child: Text(
                                              '保存到相册',
                                              style: hts(
                                                13,
                                                Color(0xFF1E63AE),
                                                w: FontWeight.w500,
                                                lh: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        label: '保存到相册',
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 8,
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 14,
                          ),
                          hbox(h: 1, bg: Color(0xFFEFEFF1)),
                          hTap(
                            context,
                            hbox(
                              minH: 28,
                              child: hrow(
                                [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '模板消息',
                                      style: hts(14, Color(0xFF18181B), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '已启用 5 个模板',
                                    style: hts(13, Color(0xFF71717A), lh: 18),
                                  ),
                                  hsvg(Svgs.s9, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 8,
                              ),
                            ),
                            to: 'NotifyTemplate',
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
                  gap: 8,
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '短信',
                        style: hts(
                          13,
                          Color(0xFF52525B),
                          w: FontWeight.w500,
                          lh: 18,
                        ),
                      ),
                    ),
                    hbox(
                      bg: Color(0xFF18181B),
                      radius: BorderRadius.circular(24),
                      pad: EdgeInsets.fromLTRB(20, 18, 20, 18),
                      clip: true,
                      child: hstack(
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hcol(
                                [
                                  Text(
                                    '短信余量',
                                    style: hts(13, Color(0xFFA1A1AA), lh: 18),
                                  ),
                                  hrow(
                                    [
                                      Flexible(
                                        flex: 90,
                                        child: Text(
                                          '1,240',
                                          style: hts(
                                            32,
                                            Color(0xFFFAFAFA),
                                            w: FontWeight.w600,
                                            lh: 40,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 82,
                                        child: Text(
                                          '条 · 约够 3 周',
                                          style: hts(13, Color(0xFFA1A1AA)),
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.baseline,
                                    gap: 4,
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.stretch,
                                gap: 2,
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 12,
                        ),
                        [
                          Positioned(
                            top: -80,
                            right: -70,
                            child: hsvg(Svgs.s34, w: 200, h: 200),
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
                      pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: hcol(
                        [
                          hcol(
                            [
                              hbox(
                                pad: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text.rich(
                                  TextSpan(
                                    style: hts(
                                      14,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 20,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '充值短信包 ',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          w: FontWeight.w600,
                                          lh: 20,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '· 约 ¥0.05–0.06 / 条',
                                        style: hts(
                                          14,
                                          Color(0xFF71717A),
                                          lh: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              HSelHolder(
                                groups: [
                                  ({1}, false),
                                ],
                                builder: (context, g1) => hrow(
                                  [
                                    Expanded(
                                      flex: 1,
                                      child: HSel(
                                        ctrl: g1[0],
                                        index: 0,
                                        on: hbox(
                                          bg: Color(0xFFE1F0FE),
                                          radius: BorderRadius.circular(16),
                                          border: Border.all(
                                            color: Color(0xFF0485F7),
                                            width: 1.5,
                                          ),
                                          pad: EdgeInsets.fromLTRB(
                                            0,
                                            12,
                                            0,
                                            12,
                                          ),
                                          child: hcol(
                                            [
                                              Text(
                                                '1,000 条',
                                                style: hts(
                                                  16,
                                                  Color(0xFF1E63AE),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                ),
                                              ),
                                              Text(
                                                '¥60',
                                                style: hts(
                                                  12,
                                                  Color(0xFF71717A),
                                                  lh: 16,
                                                ),
                                              ),
                                            ],
                                            main: MainAxisAlignment.start,
                                            cross: CrossAxisAlignment.center,
                                            gap: 2,
                                          ),
                                        ),
                                        off: hbox(
                                          bg: Color(0xFFF4F4F5),
                                          radius: BorderRadius.circular(16),
                                          pad: EdgeInsets.fromLTRB(
                                            0,
                                            12,
                                            0,
                                            12,
                                          ),
                                          child: hcol(
                                            [
                                              Text(
                                                '1,000 条',
                                                style: hts(
                                                  16,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                ),
                                              ),
                                              Text(
                                                '¥60',
                                                style: hts(
                                                  12,
                                                  Color(0xFF71717A),
                                                  lh: 16,
                                                ),
                                              ),
                                            ],
                                            main: MainAxisAlignment.start,
                                            cross: CrossAxisAlignment.center,
                                            gap: 2,
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
                                          bg: Color(0xFFE1F0FE),
                                          radius: BorderRadius.circular(16),
                                          border: Border.all(
                                            color: Color(0xFF0485F7),
                                            width: 1.5,
                                          ),
                                          pad: EdgeInsets.fromLTRB(
                                            0,
                                            12,
                                            0,
                                            12,
                                          ),
                                          child: hcol(
                                            [
                                              Text(
                                                '5,000 条',
                                                style: hts(
                                                  16,
                                                  Color(0xFF1E63AE),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                ),
                                              ),
                                              Text(
                                                '¥270',
                                                style: hts(
                                                  12,
                                                  Color(0xFF1E63AE),
                                                  lh: 16,
                                                ),
                                              ),
                                            ],
                                            main: MainAxisAlignment.start,
                                            cross: CrossAxisAlignment.center,
                                            gap: 2,
                                          ),
                                        ),
                                        off: hbox(
                                          bg: Color(0xFFF4F4F5),
                                          radius: BorderRadius.circular(16),
                                          pad: EdgeInsets.fromLTRB(
                                            0,
                                            12,
                                            0,
                                            12,
                                          ),
                                          child: hcol(
                                            [
                                              Text(
                                                '5,000 条',
                                                style: hts(
                                                  16,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                ),
                                              ),
                                              Text(
                                                '¥270',
                                                style: hts(
                                                  12,
                                                  Color(0xFF18181B),
                                                  lh: 16,
                                                ),
                                              ),
                                            ],
                                            main: MainAxisAlignment.start,
                                            cross: CrossAxisAlignment.center,
                                            gap: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: HSel(
                                        ctrl: g1[0],
                                        index: 2,
                                        on: hbox(
                                          bg: Color(0xFFE1F0FE),
                                          radius: BorderRadius.circular(16),
                                          border: Border.all(
                                            color: Color(0xFF0485F7),
                                            width: 1.5,
                                          ),
                                          pad: EdgeInsets.fromLTRB(
                                            0,
                                            12,
                                            0,
                                            12,
                                          ),
                                          child: hcol(
                                            [
                                              Text(
                                                '2 万条',
                                                style: hts(
                                                  16,
                                                  Color(0xFF1E63AE),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                ),
                                              ),
                                              Text(
                                                '¥1,000',
                                                style: hts(
                                                  12,
                                                  Color(0xFF71717A),
                                                  lh: 16,
                                                ),
                                              ),
                                            ],
                                            main: MainAxisAlignment.start,
                                            cross: CrossAxisAlignment.center,
                                            gap: 2,
                                          ),
                                        ),
                                        off: hbox(
                                          bg: Color(0xFFF4F4F5),
                                          radius: BorderRadius.circular(16),
                                          pad: EdgeInsets.fromLTRB(
                                            0,
                                            12,
                                            0,
                                            12,
                                          ),
                                          child: hcol(
                                            [
                                              Text(
                                                '2 万条',
                                                style: hts(
                                                  16,
                                                  Color(0xFF18181B),
                                                  w: FontWeight.w600,
                                                  lh: 22,
                                                ),
                                              ),
                                              Text(
                                                '¥1,000',
                                                style: hts(
                                                  12,
                                                  Color(0xFF71717A),
                                                  lh: 16,
                                                ),
                                              ),
                                            ],
                                            main: MainAxisAlignment.start,
                                            cross: CrossAxisAlignment.center,
                                            gap: 2,
                                          ),
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
                            cross: CrossAxisAlignment.stretch,
                            gap: 0,
                          ),
                          hTap(
                            context,
                            hbox(
                              h: 46,
                              bg: Color(0xFF18181B),
                              radius: BorderRadius.circular(23),
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '充值 ¥270',
                                  style: hts(
                                    15,
                                    Color(0xFFFFFFFF),
                                    w: FontWeight.w600,
                                    lh: 22,
                                  ),
                                ),
                              ),
                            ),
                            label: '充值 ¥270',
                          ),
                          hbox(h: 1, bg: Color(0xFFEFEFF1)),
                          hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hcol(
                                  [
                                    Text(
                                      '短信签名',
                                      style: hts(14, Color(0xFF18181B), lh: 20),
                                    ),
                                    Text(
                                      '显示在短信开头，需运营商审核',
                                      style: hts(12, Color(0xFF71717A), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              Text(
                                '【驰光汽车】',
                                style: hts(
                                  14,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 20,
                                ),
                              ),
                              hbox(
                                bg: Color(0xFFDDF6E7),
                                radius: BorderRadius.circular(9),
                                pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  '已通过',
                                  style: hts(
                                    11,
                                    Color(0xFF2B7745),
                                    w: FontWeight.w600,
                                    lh: 18,
                                  ),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 12,
                          ),
                          hbox(h: 1, bg: Color(0xFFEFEFF1)),
                          hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hcol(
                                  [
                                    Text(
                                      '余量不足提醒',
                                      style: hts(14, Color(0xFF18181B), lh: 20),
                                    ),
                                    Text(
                                      '低于 200 条时通知店长',
                                      style: hts(12, Color(0xFF71717A), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              HSwitch(initial: true),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 12,
                          ),
                          hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hcol(
                                  [
                                    Text(
                                      '夜间免打扰',
                                      style: hts(14, Color(0xFF18181B), lh: 20),
                                    ),
                                    Text(
                                      '22:00–08:00 不发送短信，次日早晨补发',
                                      style: hts(12, Color(0xFF71717A), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              HSwitch(initial: true),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 12,
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
      overlays: [],
    );
  }
}
