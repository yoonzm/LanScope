import 'package:flutter/material.dart';

import '../../kit/kit.dart';

class HoldSheetPage extends StatelessWidget {
  const HoldSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 844,
      fixedHeight: false,
      flow: hcol(
        [
          hbox(
            pad: EdgeInsets.fromLTRB(20, topInset(context), 20, 0),
            child: hcol(
              [
                hrow(
                  [
                    hbox(
                      w: 44,
                      h: 44,
                      bg: Color(0xFFFFFFFF),
                      radius: BorderRadius.circular(22),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '开单收银',
                        style: hts(17, Color(0xFF18181B), w: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    hbox(
                      w: 76,
                      h: 44,
                      bg: Color(0xFFFFFFFF),
                      radius: BorderRadius.circular(22),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hbox(
                  h: 76,
                  bg: Color(0xFFFFFFFF),
                  radius: BorderRadius.circular(24),
                ),
                hbox(
                  h: 220,
                  bg: Color(0xFFFFFFFF),
                  radius: BorderRadius.circular(24),
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
        Positioned.fill(
          child: hTap(
            context,
            hbox(bg: Color.fromRGBO(0, 0, 0, 0.5)),
            back: true,
          ),
        ),
        HBottomDock(
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
                Text(
                  '挂单保存',
                  style: hts(20, Color(0xFF18181B), w: FontWeight.w600, lh: 28),
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
                        bg: Color(0xFF18181B),
                        radius: BorderRadius.circular(20),
                        align: Alignment(0, 0),
                        child: Text(
                          '王',
                          style: hts(16, Color(0xFFF5D78E), w: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: hcol(
                          [
                            Text(
                              '王建国',
                              style: hts(
                                15,
                                Color(0xFF18181B),
                                w: FontWeight.w600,
                                lh: 22,
                              ),
                            ),
                            hbox(
                              bg: Color(0xFF0B5FD6),
                              radius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Color(0xFF5B9BF0),
                                width: 1.5,
                              ),
                              pad: EdgeInsets.fromLTRB(5, 1, 5, 1),
                              child: Text(
                                '沪A·8K29M',
                                style: hts(
                                  11,
                                  Color(0xFFFFFFFF),
                                  w: FontWeight.w600,
                                  lh: 16,
                                ),
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.stretch,
                          gap: 3,
                        ),
                      ),
                      hcol(
                        [
                          Text(
                            '2 项服务',
                            style: hts(12, Color(0xFF71717A), lh: 16),
                          ),
                          Text(
                            '¥1,422.00',
                            style: hts(
                              16,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 22,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.end,
                        gap: 0,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.center,
                    gap: 12,
                  ),
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        '车辆状态',
                        style: hts(
                          14,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 20,
                        ),
                      ),
                    ),
                    HSelHolder(
                      groups: [
                        ({1}, false),
                      ],
                      builder: (context, g1) => hwrap(
                        [
                          HSel(
                            ctrl: g1[0],
                            index: 0,
                            on: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(17),
                                border: Border.all(
                                  color: Color(0xFF0485F7),
                                  width: 1.5,
                                ),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '待施工',
                                    style: hts(
                                      13,
                                      Color(0xFF1E63AE),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            off: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(17),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '待施工',
                                    style: hts(
                                      13,
                                      Color(0xFF3F3F46),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HSel(
                            ctrl: g1[0],
                            index: 1,
                            on: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(17),
                                border: Border.all(
                                  color: Color(0xFF0485F7),
                                  width: 1.5,
                                ),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '施工中',
                                    style: hts(
                                      13,
                                      Color(0xFF1E63AE),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            off: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(17),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '施工中',
                                    style: hts(
                                      13,
                                      Color(0xFF3F3F46),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HSel(
                            ctrl: g1[0],
                            index: 2,
                            on: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(17),
                                border: Border.all(
                                  color: Color(0xFF0485F7),
                                  width: 1.5,
                                ),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '待结算',
                                    style: hts(
                                      13,
                                      Color(0xFF1E63AE),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            off: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(17),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '待结算',
                                    style: hts(
                                      13,
                                      Color(0xFF3F3F46),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        gap: 8,
                        rowGap: 8,
                        cross: WrapCrossAlignment.start,
                      ),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
                  gap: 0,
                ),
                hcol(
                  [
                    Text.rich(
                      TextSpan(
                        style: hts(
                          14,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 20,
                        ),
                        children: [
                          TextSpan(
                            text: '备注 ',
                            style: hts(
                              14,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                          TextSpan(
                            text: '· 选填',
                            style: hts(14, Color(0xFF71717A), lh: 20),
                          ),
                        ],
                      ),
                    ),
                    hbox(
                      minH: 64,
                      bg: Color(0xFFF4F4F5),
                      radius: BorderRadius.circular(14),
                      pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: HInput(
                        style: hts(14, Color(0xFF18181B), lh: 20),
                        maxLines: 4,
                        value: '客户去开会，17:00 取车',
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
                      pad: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        '到点提醒我',
                        style: hts(
                          14,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 20,
                        ),
                      ),
                    ),
                    HSelHolder(
                      groups: [
                        ({3}, false),
                      ],
                      builder: (context, g2) => hwrap(
                        [
                          HSel(
                            ctrl: g2[0],
                            index: 0,
                            on: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(17),
                                border: Border.all(
                                  color: Color(0xFF0485F7),
                                  width: 1.5,
                                ),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '不提醒',
                                    style: hts(
                                      13,
                                      Color(0xFF1E63AE),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            off: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(17),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '不提醒',
                                    style: hts(
                                      13,
                                      Color(0xFF3F3F46),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HSel(
                            ctrl: g2[0],
                            index: 1,
                            on: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(17),
                                border: Border.all(
                                  color: Color(0xFF0485F7),
                                  width: 1.5,
                                ),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '30 分钟',
                                    style: hts(
                                      13,
                                      Color(0xFF1E63AE),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            off: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(17),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '30 分钟',
                                    style: hts(
                                      13,
                                      Color(0xFF3F3F46),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HSel(
                            ctrl: g2[0],
                            index: 2,
                            on: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(17),
                                border: Border.all(
                                  color: Color(0xFF0485F7),
                                  width: 1.5,
                                ),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '1 小时',
                                    style: hts(
                                      13,
                                      Color(0xFF1E63AE),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            off: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(17),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '1 小时',
                                    style: hts(
                                      13,
                                      Color(0xFF3F3F46),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HSel(
                            ctrl: g2[0],
                            index: 3,
                            on: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(17),
                                border: Border.all(
                                  color: Color(0xFF0485F7),
                                  width: 1.5,
                                ),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '完工时',
                                    style: hts(
                                      13,
                                      Color(0xFF1E63AE),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            off: hTap(
                              context,
                              hbox(
                                h: 34,
                                bg: Color(0xFFF4F4F5),
                                radius: BorderRadius.circular(17),
                                pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1,
                                  child: Text(
                                    '完工时',
                                    style: hts(
                                      13,
                                      Color(0xFF3F3F46),
                                      w: FontWeight.w500,
                                      lh: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        gap: 8,
                        rowGap: 8,
                        cross: WrapCrossAlignment.start,
                      ),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
                  gap: 0,
                ),
                hbox(
                  pad: EdgeInsets.fromLTRB(0, 4, 0, 0),
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
                          to: 'Order',
                        ),
                      ),
                      Expanded(
                        flex: 2,
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
                                '确认挂单',
                                style: hts(
                                  15,
                                  Color(0xFFFFFFFF),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                            ),
                          ),
                          to: 'HoldList',
                        ),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 10,
                    intrinsic: true,
                  ),
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
