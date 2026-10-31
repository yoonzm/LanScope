import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 959,
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
                        '套餐与订阅',
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
                        hrow(
                          [
                            Text(
                              '专业版',
                              style: hts(
                                20,
                                Color(0xFFFAFAFA),
                                w: FontWeight.w600,
                                lh: 28,
                              ),
                            ),
                            hbox(
                              bg: Color(0xFFF5D78E),
                              radius: BorderRadius.circular(9),
                              pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text(
                                '年付',
                                style: hts(
                                  11,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 18,
                                ),
                                softWrap: false,
                                maxLines: 1,
                              ),
                            ),
                            Expanded(flex: 1, child: SizedBox.shrink()),
                            hbox(
                              bg: Color(0xFFDDF6E7),
                              radius: BorderRadius.circular(9),
                              pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text(
                                '使用中',
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
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.center,
                          gap: 8,
                        ),
                        hrow(
                          [
                            Flexible(
                              flex: 70,
                              child: Text(
                                '365',
                                style: hts(
                                  40,
                                  Color(0xFFFAFAFA),
                                  w: FontWeight.w600,
                                  lh: 44,
                                  ls: -1,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 150,
                              child: Text(
                                '天后到期 · 2027.10.30',
                                style: hts(14, Color(0xFFA1A1AA)),
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.baseline,
                          gap: 6,
                        ),
                        hbox(
                          h: 6,
                          bg: Color(0xFF27272A),
                          radius: BorderRadius.circular(3),
                          child: hcol(
                            [
                              hbox(
                                h: 6,
                                bg: Color(0xFFF5D78E),
                                radius: BorderRadius.circular(3),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 0,
                            min: false,
                          ),
                        ),
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  h: 44,
                                  bg: Color(0xFFF5D78E),
                                  radius: BorderRadius.circular(22),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '续费',
                                      style: hts(
                                        15,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                to: 'Renew',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hTap(
                                context,
                                hbox(
                                  h: 44,
                                  bg: Color(0xFF27272A),
                                  radius: BorderRadius.circular(22),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '升级套餐',
                                      style: hts(
                                        15,
                                        Color(0xFFFAFAFA),
                                        w: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                to: 'Plans',
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
                        '用量 · 本订阅周期',
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
                          hcol(
                            [
                              hrow(
                                [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '员工账号',
                                      style: hts(14, Color(0xFF52525B)),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      style: hts(
                                        14,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '5',
                                          style: hts(
                                            14,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' / 10',
                                          style: hts(14, Color(0xFFA1A1AA)),
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
                                h: 6,
                                bg: Color(0xFFEEEEF0),
                                radius: BorderRadius.circular(3),
                                clip: true,
                                child: hcol(
                                  [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: hfrac(
                                        0.5,
                                        hbox(
                                          h: 6,
                                          bg: Color(0xFF0485F7),
                                          radius: BorderRadius.circular(3),
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
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 8,
                          ),
                          hcol(
                            [
                              hrow(
                                [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '门店数量',
                                      style: hts(14, Color(0xFF52525B)),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      style: hts(
                                        14,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '1',
                                          style: hts(
                                            14,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' / 3',
                                          style: hts(14, Color(0xFFA1A1AA)),
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
                                h: 6,
                                bg: Color(0xFFEEEEF0),
                                radius: BorderRadius.circular(3),
                                clip: true,
                                child: hcol(
                                  [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: hfrac(
                                        0.33,
                                        hbox(
                                          h: 6,
                                          bg: Color(0xFF0485F7),
                                          radius: BorderRadius.circular(3),
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
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 8,
                          ),
                          hcol(
                            [
                              hrow(
                                [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '本月套餐内短信',
                                      style: hts(14, Color(0xFF52525B)),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      style: hts(
                                        14,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '86',
                                          style: hts(
                                            14,
                                            Color(0xFF18181B),
                                            w: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' / 1,000',
                                          style: hts(14, Color(0xFFA1A1AA)),
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
                                h: 6,
                                bg: Color(0xFFEEEEF0),
                                radius: BorderRadius.circular(3),
                                clip: true,
                                child: hcol(
                                  [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: hfrac(
                                        0.08,
                                        hbox(
                                          h: 6,
                                          bg: Color(0xFF17C964),
                                          radius: BorderRadius.circular(3),
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
                  gap: 8,
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '订阅管理',
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
                                        '自动续费',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '到期前 3 天微信扣款 ¥3,990',
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
                                      '支付方式',
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '微信支付',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                  hsvg(Svgs.s9, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            label: '支付方式微信支付',
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
                                      '账单与发票',
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '1 笔订单',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                  hsvg(Svgs.s9, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
                            to: 'Invoices',
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
                                        '到期提醒',
                                        style: hts(
                                          14,
                                          Color(0xFF18181B),
                                          lh: 20,
                                        ),
                                      ),
                                      Text(
                                        '提前 30、7、3 天通知店长',
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
                  Text(
                    '查看全部套餐与功能对比',
                    style: hts(
                      14,
                      Color(0xFF1E63AE),
                      w: FontWeight.w500,
                      lh: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  to: 'Plans',
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
