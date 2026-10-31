import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class PlanExpiredPage extends StatelessWidget {
  const PlanExpiredPage({super.key});

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
                    Expanded(
                      flex: 1,
                      child: Text(
                        '套餐已到期',
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
                  pad: EdgeInsets.fromLTRB(20, 24, 20, 24),
                  clip: true,
                  child: hstack(
                    hcol(
                      [
                        Align(
                          alignment: Alignment.topLeft,
                          child: hbox(
                            w: 52,
                            h: 52,
                            bg: Color(0xFFFDEFD6),
                            radius: BorderRadius.circular(26),
                            child: hrow(
                              [hsvg(Svgs.s106, w: 26, h: 26)],
                              main: MainAxisAlignment.center,
                              cross: CrossAxisAlignment.center,
                              gap: 0,
                            ),
                          ),
                        ),
                        Text(
                          '试用已结束',
                          style: hts(
                            22,
                            Color(0xFFFAFAFA),
                            w: FontWeight.w600,
                            lh: 30,
                          ),
                        ),
                        Text(
                          '专业版试用于 2026.11.14 到期，当前为只读模式。订阅后立即恢复，数据保留至 2026.12.14。',
                          style: hts(14, Color(0xFFA1A1AA), lh: 20),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.stretch,
                      gap: 12,
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
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '当前可用功能',
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
                            minH: 50,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '查看会员、订单、库存与报表',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                Text(
                                  '可用',
                                  style: hts(15, Color(0xFF2B7745), lh: 22),
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
                            minH: 50,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '导出全部经营数据',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                Text(
                                  '可用',
                                  style: hts(15, Color(0xFF2B7745), lh: 22),
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
                            minH: 50,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '开单收银 · 会员充值',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                Text(
                                  '已暂停',
                                  style: hts(15, Color(0xFFA43433), lh: 22),
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
                            minH: 50,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '商品入库 · 预约 · 微信通知',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                Text(
                                  '已暂停',
                                  style: hts(15, Color(0xFFA43433), lh: 22),
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
                      hrow(
                        [
                          hbox(
                            w: 36,
                            h: 36,
                            bg: Color(0xFFDDF6E7),
                            radius: BorderRadius.circular(12),
                            child: hrow(
                              [hsvg(Svgs.s107, w: 18, h: 18)],
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
                                  '不确定选哪个版本？',
                                  style: hts(
                                    15,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
                                    lh: 22,
                                  ),
                                ),
                                Text(
                                  '联系客户经理 · 工作日 9:00–18:00',
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
                              '联系',
                              style: hts(
                                13,
                                Color(0xFF1E63AE),
                                w: FontWeight.w600,
                              ),
                            ),
                            label: '拨打电话',
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 12,
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
                  flex: 1,
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
                          '选择套餐并订阅',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Plans',
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
