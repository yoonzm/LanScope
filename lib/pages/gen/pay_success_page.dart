import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class PaySuccessPage extends StatelessWidget {
  const PaySuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1060,
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
                          [hsvg(Svgs.s10, w: 20, h: 20)],
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: hbox(
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
                                    [hsvg(Svgs.s12, w: 36, h: 36)],
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
                            [
                              Positioned(
                                left: -32,
                                top: -32,
                                child: hsvg(Svgs.s11, w: 160, h: 160),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '收款成功',
                        style: hts(
                          17,
                          Color(0xFF2B7745),
                          w: FontWeight.w600,
                          lh: 24,
                        ),
                      ),
                      Text(
                        '¥1,422.00',
                        style: hts(
                          40,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 48,
                          ls: -1,
                        ),
                      ),
                      Text(
                        '沪A·8K826 · 王建国 · 储值支付 · 14:32',
                        style: hts(13, Color(0xFF71717A), lh: 18),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.center,
                    gap: 6,
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
                                '消费项目',
                                style: hts(14, Color(0xFF71717A), lh: 20),
                              ),
                            ),
                            Text(
                              '镀晶养护 · 内饰精洗',
                              style: hts(
                                14,
                                Color(0xFF18181B),
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
                      hbox(h: 1, bg: Color(0xFFEFEFF1)),
                      hbox(
                        minH: 36,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '优惠',
                                style: hts(14, Color(0xFF71717A), lh: 20),
                              ),
                            ),
                            Text(
                              '黑金 9 折 −¥158.00',
                              style: hts(
                                14,
                                Color(0xFF18181B),
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
                      hbox(h: 1, bg: Color(0xFFEFEFF1)),
                      hbox(
                        minH: 36,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '储值扣款',
                                style: hts(14, Color(0xFF71717A), lh: 20),
                              ),
                            ),
                            Text(
                              '¥1,422.00',
                              style: hts(
                                14,
                                Color(0xFF18181B),
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
                      hbox(h: 1, bg: Color(0xFFEFEFF1)),
                      hbox(
                        minH: 36,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '当前余额',
                                style: hts(14, Color(0xFF71717A), lh: 20),
                              ),
                            ),
                            Text(
                              '¥2,258.00',
                              style: hts(
                                14,
                                Color(0xFF18181B),
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
                      hbox(h: 1, bg: Color(0xFFEFEFF1)),
                      hbox(
                        minH: 36,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '获得积分',
                                style: hts(14, Color(0xFF71717A), lh: 20),
                              ),
                            ),
                            Text(
                              '+1,422',
                              style: hts(
                                14,
                                Color(0xFF18181B),
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
                      hrow(
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
                          Expanded(
                            flex: 1,
                            child: Text(
                              '通知会员',
                              style: hts(
                                16,
                                Color(0xFF18181B),
                                w: FontWeight.w600,
                                lh: 22,
                              ),
                            ),
                          ),
                          hTap(
                            context,
                            Text(
                              '通知设置',
                              style: hts(13, Color(0xFF0485F7), lh: 18),
                            ),
                            to: 'NotifySettings',
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          style: hts(13, Color(0xFF52525B), lh: 18),
                          children: [
                            TextSpan(
                              text: '王建国 · 138 **** 0912 ',
                              style: hts(13, Color(0xFF52525B), lh: 18),
                            ),
                            TextSpan(
                              text: '· 已关注公众号',
                              style: hts(13, Color(0xFF2B7745), lh: 18),
                            ),
                          ],
                        ),
                      ),
                      HSelHolder(
                        groups: [
                          ({0}, true),
                        ],
                        builder: (context, g1) => hstack(
                          hcol(
                            [
                              HSel(
                                ctrl: g1[0],
                                index: 0,
                                on: hbox(
                                  bg: Color(0xFFE1F0FE),
                                  radius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Color(0xFF0485F7),
                                    width: 1.5,
                                  ),
                                  pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                                  child: hrow(
                                    [
                                      hbox(
                                        w: 36,
                                        h: 36,
                                        bg: Color(0xFFDDF6E7),
                                        radius: BorderRadius.circular(12),
                                        child: hrow(
                                          [hsvg(Svgs.s101, w: 20, h: 20)],
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
                                              '微信通知',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w600,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '模板：消费通知 · 免费',
                                              style: hts(
                                                12,
                                                Color(0xFF52525B),
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
                                        w: 22,
                                        h: 22,
                                        bg: Color(0xFF0485F7),
                                        radius: BorderRadius.circular(11),
                                        child: hrow(
                                          [hsvg(Svgs.s102, w: 14, h: 14)],
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
                                off: hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(18),
                                  pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                                  child: hrow(
                                    [
                                      hbox(
                                        w: 36,
                                        h: 36,
                                        bg: Color(0xFFDDF6E7),
                                        radius: BorderRadius.circular(12),
                                        child: hrow(
                                          [hsvg(Svgs.s101, w: 20, h: 20)],
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
                                              '微信通知',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w600,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '模板：消费通知 · 免费',
                                              style: hts(
                                                12,
                                                Color(0xFF52525B),
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
                                        w: 22,
                                        h: 22,
                                        bg: Color(0xFF0485F7),
                                        radius: BorderRadius.circular(11),
                                        child: hrow(
                                          [hsvg(Svgs.s102, w: 14, h: 14)],
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
                              HSel(
                                ctrl: g1[0],
                                index: 1,
                                on: hbox(
                                  bg: Color(0xFFE1F0FE),
                                  radius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Color(0xFF0485F7),
                                    width: 1.5,
                                  ),
                                  pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                                  child: hrow(
                                    [
                                      hbox(
                                        w: 36,
                                        h: 36,
                                        bg: Color(0xFFE1F0FE),
                                        radius: BorderRadius.circular(12),
                                        child: hrow(
                                          [hsvg(Svgs.s103, w: 20, h: 20)],
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
                                              '短信通知',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w600,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '86 字 · 2 条 · 约 ¥0.12',
                                              style: hts(
                                                12,
                                                Color(0xFF52525B),
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
                                off: hbox(
                                  bg: Color(0xFFF4F4F5),
                                  radius: BorderRadius.circular(18),
                                  pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                                  child: hrow(
                                    [
                                      hbox(
                                        w: 36,
                                        h: 36,
                                        bg: Color(0xFFE1F0FE),
                                        radius: BorderRadius.circular(12),
                                        child: hrow(
                                          [hsvg(Svgs.s103, w: 20, h: 20)],
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
                                              '短信通知',
                                              style: hts(
                                                15,
                                                Color(0xFF18181B),
                                                w: FontWeight.w600,
                                                lh: 22,
                                              ),
                                            ),
                                            Text(
                                              '86 字 · 2 条 · 约 ¥0.12',
                                              style: hts(
                                                12,
                                                Color(0xFF52525B),
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
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 8,
                          ),
                          [
                            Positioned(
                              width: 1,
                              height: 1,
                              child: hbox(
                                w: 1,
                                h: 1,
                                clip: true,
                                child: Text(
                                  '发送渠道',
                                  style: hts(16, Color(0xFF18181B)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      hrow(
                        [
                          Expanded(
                            flex: 10,
                            child: hTap(
                              context,
                              hbox(
                                h: 46,
                                bg: Color(0xFFEEEEF0),
                                radius: BorderRadius.circular(23),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '本次不通知',
                                    style: hts(
                                      15,
                                      Color(0xFF18181B),
                                      w: FontWeight.w500,
                                      lh: 22,
                                    ),
                                  ),
                                ),
                              ),
                              label: '本次不通知',
                            ),
                          ),
                          Expanded(
                            flex: 14,
                            child: hTap(
                              context,
                              hbox(
                                h: 46,
                                bg: Color(0xFF0485F7),
                                radius: BorderRadius.circular(23),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '发送通知',
                                    style: hts(
                                      15,
                                      Color(0xFFFFFFFF),
                                      w: FontWeight.w600,
                                      lh: 22,
                                    ),
                                  ),
                                ),
                              ),
                              label: '发送通知',
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 10,
                        intrinsic: true,
                      ),
                      Text(
                        '按"优先微信，失败转短信"策略，已默认选中微信',
                        style: hts(12, Color(0xFF71717A), lh: 16),
                        textAlign: TextAlign.center,
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
            child: hrow(
              [
                Expanded(
                  flex: 1,
                  child: hTap(
                    context,
                    hbox(
                      h: 50,
                      bg: Color(0xFFEEEEF0),
                      radius: BorderRadius.circular(25),
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '继续开单',
                          style: hts(
                            15,
                            Color(0xFF18181B),
                            w: FontWeight.w500,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Order',
                  ),
                ),
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
                          '完成',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Main',
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
