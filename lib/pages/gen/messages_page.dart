import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 845,
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
                        '消息中心',
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
                            '全部已读',
                            style: hts(
                              15,
                              Color(0xFF0485F7),
                              w: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      to: 'Messages',
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
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
                              h: 32,
                              bg: Color(0xFFFFFFFF),
                              radius: BorderRadius.circular(16),
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
                                  '全部',
                                  style: hts(
                                    13,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                              ),
                            ),
                            off: hbox(
                              h: 32,
                              bg: Color(0xFFFFFFFF),
                              radius: BorderRadius.circular(16),
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '全部',
                                  style: hts(
                                    13,
                                    Color(0xFF52525B),
                                    w: FontWeight.w500,
                                    lh: 18,
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
                              h: 32,
                              radius: BorderRadius.circular(16),
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
                                  '经营',
                                  style: hts(
                                    13,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                              ),
                            ),
                            off: hbox(
                              h: 32,
                              radius: BorderRadius.circular(16),
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '经营',
                                  style: hts(
                                    13,
                                    Color(0xFF52525B),
                                    w: FontWeight.w500,
                                    lh: 18,
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
                            index: 2,
                            on: hbox(
                              h: 32,
                              radius: BorderRadius.circular(16),
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
                                  '预约',
                                  style: hts(
                                    13,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                              ),
                            ),
                            off: hbox(
                              h: 32,
                              radius: BorderRadius.circular(16),
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '预约',
                                  style: hts(
                                    13,
                                    Color(0xFF52525B),
                                    w: FontWeight.w500,
                                    lh: 18,
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
                            index: 3,
                            on: hbox(
                              h: 32,
                              radius: BorderRadius.circular(16),
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
                                  '系统',
                                  style: hts(
                                    13,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                              ),
                            ),
                            off: hbox(
                              h: 32,
                              radius: BorderRadius.circular(16),
                              child: Align(
                                alignment: Alignment.center,
                                widthFactor: 1,
                                child: Text(
                                  '系统',
                                  style: hts(
                                    13,
                                    Color(0xFF52525B),
                                    w: FontWeight.w500,
                                    lh: 18,
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
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFFFE1E2),
                                radius: BorderRadius.circular(14),
                                child: hrow(
                                  [hsvg(Svgs.s112, w: 20, h: 20)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  minW: 0,
                                  child: hcol(
                                    [
                                      hrow(
                                        [
                                          Text(
                                            '预约超时未到',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w600,
                                              lh: 22,
                                            ),
                                          ),
                                          hbox(
                                            w: 8,
                                            h: 8,
                                            bg: Color(0xFFFF383C),
                                            radius: BorderRadius.circular(4),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),
                                          Text(
                                            '16:47',
                                            style: hts(12, Color(0xFFA1A1AA)),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 6,
                                      ),
                                      Text(
                                        '孙先生（沪A·2M118）16:30 的预约已超时 17 分钟，建议联系客户。',
                                        style: hts(
                                          13,
                                          Color(0xFF52525B),
                                          lh: 19,
                                        ),
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
                            cross: CrossAxisAlignment.start,
                            gap: 12,
                          ),
                        ),
                        to: 'AppointmentDetail',
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                      ),
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFFDEFD6),
                                radius: BorderRadius.circular(14),
                                child: hrow(
                                  [hsvg(Svgs.s113, w: 20, h: 20)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  minW: 0,
                                  child: hcol(
                                    [
                                      hrow(
                                        [
                                          Text(
                                            '库存预警',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w600,
                                              lh: 22,
                                            ),
                                          ),
                                          hbox(
                                            w: 8,
                                            h: 8,
                                            bg: Color(0xFFFF383C),
                                            radius: BorderRadius.circular(4),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),
                                          Text(
                                            '15:20',
                                            style: hts(12, Color(0xFFA1A1AA)),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 6,
                                      ),
                                      Text(
                                        '车蜡、玻璃水等 3 件商品低于安全库存，建议补货。',
                                        style: hts(
                                          13,
                                          Color(0xFF52525B),
                                          lh: 19,
                                        ),
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
                            cross: CrossAxisAlignment.start,
                            gap: 12,
                          ),
                        ),
                        to: 'Inventory',
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                      ),
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(14),
                                child: hrow(
                                  [hsvg(Svgs.s114, w: 20, h: 20)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  minW: 0,
                                  child: hcol(
                                    [
                                      hrow(
                                        [
                                          Text(
                                            '微信通知发送失败',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w600,
                                              lh: 22,
                                            ),
                                          ),
                                          hbox(
                                            w: 8,
                                            h: 8,
                                            bg: Color(0xFFFF383C),
                                            radius: BorderRadius.circular(4),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),
                                          Text(
                                            '13:05',
                                            style: hts(12, Color(0xFFA1A1AA)),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 6,
                                      ),
                                      Text(
                                        '1 位会员未关注公众号，已自动改用短信发送。',
                                        style: hts(
                                          13,
                                          Color(0xFF52525B),
                                          lh: 19,
                                        ),
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
                            cross: CrossAxisAlignment.start,
                            gap: 12,
                          ),
                        ),
                        to: 'NotifyLog',
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                      ),
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFDDF6E7),
                                radius: BorderRadius.circular(14),
                                child: hrow(
                                  [hsvg(Svgs.s115, w: 20, h: 20)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  minW: 0,
                                  child: hcol(
                                    [
                                      hrow(
                                        [
                                          Text(
                                            '今日营业日报',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w600,
                                              lh: 22,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),
                                          Text(
                                            '09:00',
                                            style: hts(12, Color(0xFFA1A1AA)),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 6,
                                      ),
                                      Text(
                                        '今日营业额 ¥12,860，同比昨日 +12%，新增会员 5 位。',
                                        style: hts(
                                          13,
                                          Color(0xFF52525B),
                                          lh: 19,
                                        ),
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
                            cross: CrossAxisAlignment.start,
                            gap: 12,
                          ),
                        ),
                        to: 'Stats',
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                      ),
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFEEEEF0),
                                radius: BorderRadius.circular(14),
                                child: hrow(
                                  [hsvg(Svgs.s116, w: 20, h: 20)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  minW: 0,
                                  child: hcol(
                                    [
                                      hrow(
                                        [
                                          Text(
                                            '套餐即将到期提醒',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w600,
                                              lh: 22,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),
                                          Text(
                                            '昨天',
                                            style: hts(12, Color(0xFFA1A1AA)),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 6,
                                      ),
                                      Text(
                                        '专业版将在 7 天后到期，续费可保持预约与微信通知不中断。',
                                        style: hts(
                                          13,
                                          Color(0xFF52525B),
                                          lh: 19,
                                        ),
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
                            cross: CrossAxisAlignment.start,
                            gap: 12,
                          ),
                        ),
                        to: 'Renew',
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                      ),
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 14, 16, 14),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFDDF6E7),
                                radius: BorderRadius.circular(14),
                                child: hrow(
                                  [hsvg(Svgs.s117, w: 20, h: 20)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  minW: 0,
                                  child: hcol(
                                    [
                                      hrow(
                                        [
                                          Text(
                                            '会员绑定微信',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w600,
                                              lh: 22,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),
                                          Text(
                                            '昨天',
                                            style: hts(12, Color(0xFFA1A1AA)),
                                          ),
                                        ],
                                        main: MainAxisAlignment.start,
                                        cross: CrossAxisAlignment.center,
                                        gap: 6,
                                      ),
                                      Text(
                                        '王建国已成功绑定微信，可接收消费与充值通知。',
                                        style: hts(
                                          13,
                                          Color(0xFF52525B),
                                          lh: 19,
                                        ),
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
                            cross: CrossAxisAlignment.start,
                            gap: 12,
                          ),
                        ),
                        to: 'MemberDetail',
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
