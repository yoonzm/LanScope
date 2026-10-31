import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class BindInvitePage extends StatelessWidget {
  const BindInvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1220,
      fixedHeight: false,
      flow: hcol(
        [
          hstack(
            hcol(
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
                                            color: Color.fromRGBO(
                                              23,
                                              201,
                                              100,
                                              0.35,
                                            ),
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
                              '¥880.00',
                              style: hts(
                                40,
                                Color(0xFF18181B),
                                w: FontWeight.w600,
                                lh: 48,
                                ls: -1,
                              ),
                            ),
                            Text(
                              '沪B·2C519 · 李女士 · 微信支付 · 14:41',
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
                                    '全车精洗 · 打蜡',
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
                                      '实收金额',
                                      style: hts(14, Color(0xFF71717A), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '¥880.00',
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
                                      '获得积分',
                                      style: hts(14, Color(0xFF71717A), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '+880',
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
                                  bg: Color(0xFFFDEFD6),
                                  radius: BorderRadius.circular(10),
                                  child: hrow(
                                    [hsvg(Svgs.s17, w: 18, h: 18)],
                                    main: MainAxisAlignment.center,
                                    cross: CrossAxisAlignment.center,
                                    gap: 0,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '绑定微信，收消费通知',
                                    style: hts(
                                      16,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 22,
                                    ),
                                  ),
                                ),
                                hbox(
                                  bg: Color(0xFFFDEFD6),
                                  radius: BorderRadius.circular(9),
                                  pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    '未绑定',
                                    style: hts(
                                      11,
                                      Color(0xFF855F2E),
                                      w: FontWeight.w600,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.center,
                              gap: 10,
                            ),
                            Text(
                              '李女士 · 139 **** 5530 还没有绑定微信，本次通知只能走短信。让 TA 现在扫码绑定，之后全部免费微信通知。',
                              style: hts(13, Color(0xFF52525B), lh: 20),
                            ),
                            hrow(
                              [
                                hbox(
                                  bg: Color(0xFFFFFFFF),
                                  radius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Color(0xFFE4E4E7),
                                    width: 1,
                                  ),
                                  pad: EdgeInsets.fromLTRB(14, 14, 14, 14),
                                  child: hrow(
                                    [hsvg(Svgs.s18, w: 132, h: 132)],
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
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: hbox(
                                            w: 24,
                                            h: 24,
                                            bg: Color(0xFF18181B),
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
                                        ),
                                        Text(
                                          '扫码关注公众号',
                                          style: hts(
                                            12,
                                            Color(0xFF52525B),
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
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: hbox(
                                            w: 24,
                                            h: 24,
                                            bg: Color(0xFF18181B),
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
                                        ),
                                        Text(
                                          '授权手机号',
                                          style: hts(
                                            12,
                                            Color(0xFF52525B),
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
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: hbox(
                                            w: 24,
                                            h: 24,
                                            bg: Color(0xFF18181B),
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
                                        ),
                                        Text(
                                          '自动绑定并补发通知',
                                          style: hts(
                                            12,
                                            Color(0xFF52525B),
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
                            hTap(
                              context,
                              hbox(
                                h: 46,
                                bg: Color(0xFF0485F7),
                                radius: BorderRadius.circular(23),
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  widthFactor: 1,
                                  child: Text(
                                    '发送绑定邀请短信',
                                    style: hts(
                                      15,
                                      Color(0xFFFFFFFF),
                                      w: FontWeight.w600,
                                      lh: 22,
                                    ),
                                  ),
                                ),
                              ),
                              to: 'BindInvite',
                            ),
                            hrow(
                              [
                                Expanded(
                                  flex: 1,
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
                                          '本次改发短信通知',
                                          style: hts(
                                            13,
                                            Color(0xFF18181B),
                                            w: FontWeight.w500,
                                            lh: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    label: '本次改发短信通知',
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
                                            Color(0xFF52525B),
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
            [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
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
          ),
        ],
        main: MainAxisAlignment.start,
        cross: CrossAxisAlignment.stretch,
        gap: 0,
      ),
      overlays: [
        Positioned.fill(
          child: hTap(
            context,
            hbox(bg: Color.fromRGBO(0, 0, 0, 0.5)),
            back: true,
          ),
        ),
        Positioned(
          left: 0,
          top: 380,
          right: 0,
          child: hbox(
            bg: Color(0xFFFFFFFF),
            radius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
            ),
            shadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                offset: Offset(0, -14),
                blurRadius: 28,
                spreadRadius: 0,
              ),
            ],
            pad: EdgeInsets.fromLTRB(20, 10, 20, bottomInset(context)),
            child: hcol(
              [
                Align(
                  alignment: Alignment.topCenter,
                  child: hbox(
                    w: 40,
                    h: 5,
                    bg: Color(0xFFD4D4D8),
                    radius: BorderRadius.circular(3),
                  ),
                ),
                hrow(
                  [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '发送绑定邀请',
                        style: hts(
                          20,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 28,
                        ),
                      ),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 0,
                ),
                hbox(
                  bg: Color(0xFFF4F4F5),
                  radius: BorderRadius.circular(18),
                  pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                  child: hrow(
                    [
                      hbox(
                        w: 40,
                        h: 40,
                        bg: Color(0xFFE1F0FE),
                        radius: BorderRadius.circular(20),
                        align: Alignment(0, 0),
                        child: Text(
                          '李',
                          style: hts(16, Color(0xFF1E63AE), w: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: hcol(
                          [
                            Text(
                              '李女士',
                              style: hts(
                                15,
                                Color(0xFF18181B),
                                w: FontWeight.w600,
                                lh: 22,
                              ),
                            ),
                            Text(
                              '139 **** 5530',
                              style: hts(12, Color(0xFF71717A), lh: 16),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.stretch,
                          gap: 0,
                        ),
                      ),
                      hbox(
                        bg: Color(0xFFE1F0FE),
                        radius: BorderRadius.circular(9),
                        pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                          '短信',
                          style: hts(
                            11,
                            Color(0xFF1E63AE),
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
                ),
                hcol(
                  [
                    Text(
                      '短信预览',
                      style: hts(
                        13,
                        Color(0xFF18181B),
                        w: FontWeight.w600,
                        lh: 18,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: hbox(
                        bg: Color(0xFFF4F4F5),
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                        ),
                        pad: EdgeInsets.fromLTRB(14, 10, 14, 10),
                        child: Text(
                          '【驰光汽车】李女士您好，点击链接绑定微信会员，随时查看余额、次卡和消费记录：https://qm.link/Ab3x 退订回T',
                          style: hts(14, Color(0xFF18181B), lh: 21),
                        ),
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
                      '· 链接 7 天内有效，会员点开并验证手机号即完成绑定',
                      style: hts(12, Color(0xFF71717A), lh: 18),
                    ),
                    Text(
                      '· 本条按 1 条短信计费，约 ¥0.06',
                      style: hts(12, Color(0xFF71717A), lh: 18),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
                  gap: 4,
                ),
                hrow(
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
                              '取消',
                              style: hts(
                                15,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
                                lh: 22,
                              ),
                            ),
                          ),
                        ),
                        to: 'PayUnbound',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: hTap(
                        context,
                        hbox(
                          h: 50,
                          bg: Color(0xFF0485F7),
                          radius: BorderRadius.circular(25),
                          child: Align(
                            alignment: Alignment(0, 0),
                            widthFactor: 1,
                            child: Text(
                              '发送邀请',
                              style: hts(
                                15,
                                Color(0xFFFFFFFF),
                                w: FontWeight.w600,
                                lh: 22,
                              ),
                            ),
                          ),
                        ),
                        to: 'PayUnbound',
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
          ),
        ),
      ],
    );
  }
}
