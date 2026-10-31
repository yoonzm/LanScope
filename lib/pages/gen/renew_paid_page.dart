import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class RenewPaidPage extends StatelessWidget {
  const RenewPaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 844,
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
                    Expanded(flex: 1, child: SizedBox.shrink()),
                    hbox(w: 44),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
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
                        '续费成功',
                        style: hts(
                          17,
                          Color(0xFF2B7745),
                          w: FontWeight.w600,
                          lh: 24,
                        ),
                      ),
                      Text(
                        '¥3,990.00',
                        style: hts(
                          40,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 48,
                          ls: -1,
                        ),
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
                        minH: 40,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '套餐',
                                style: hts(14, Color(0xFF71717A)),
                              ),
                            ),
                            Text(
                              '专业版 · 续费 12 个月',
                              style: hts(
                                14,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
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
                        minH: 40,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '新到期日',
                                style: hts(14, Color(0xFF71717A)),
                              ),
                            ),
                            Text(
                              '2028.10.30',
                              style: hts(
                                14,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
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
                        minH: 40,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '支付方式',
                                style: hts(14, Color(0xFF71717A)),
                              ),
                            ),
                            Text(
                              '微信支付',
                              style: hts(
                                14,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
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
                        minH: 40,
                        child: hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '订单号',
                                style: hts(14, Color(0xFF71717A)),
                              ),
                            ),
                            Text(
                              'SUB202610310002',
                              style: hts(
                                14,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
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
                  pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                              [hsvg(Svgs.s108, w: 18, h: 18)],
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
                                  '需要发票？',
                                  style: hts(
                                    14,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
                                    lh: 20,
                                  ),
                                ),
                                Text(
                                  '可合并开具续费与订阅发票',
                                  style: hts(12, Color(0xFF71717A), lh: 16),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 0,
                            ),
                          ),
                          hTap(
                            context,
                            Text(
                              '申请开票',
                              style: hts(
                                13,
                                Color(0xFF1E63AE),
                                w: FontWeight.w500,
                              ),
                            ),
                            to: 'Invoices',
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 10,
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
            bg: Color.fromRGBO(255, 255, 255, 0.94),
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
                  flex: 10,
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
                          '回到首页',
                          style: hts(
                            15,
                            Color(0xFF18181B),
                            w: FontWeight.w500,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Main',
                  ),
                ),
                Expanded(
                  flex: 14,
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
                          '查看订阅',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Subscription',
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
    );
  }
}
