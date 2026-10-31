import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({super.key});

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
                        '员工与权限',
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
                        w: 44,
                        h: 44,
                        bg: Color(0xFF18181B),
                        radius: BorderRadius.circular(22),
                        child: hrow(
                          [hsvg(Svgs.s33, w: 20, h: 20)],
                          main: MainAxisAlignment.center,
                          cross: CrossAxisAlignment.center,
                          gap: 0,
                        ),
                      ),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hcol([
                  hrow(
                    [
                      Expanded(
                        flex: 1,
                        child: hTap(
                          context,
                          hbox(
                            bg: Color(0xFFFFFFFF),
                            radius: BorderRadius.circular(18),
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
                            pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                            child: hcol(
                              [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: hbox(
                                    w: 8,
                                    h: 8,
                                    bg: Color(0xFFF5A524),
                                    radius: BorderRadius.circular(4),
                                  ),
                                ),
                                Text(
                                  '店长',
                                  style: hts(13, Color(0xFF52525B), lh: 18),
                                ),
                                Text(
                                  '1',
                                  style: hts(
                                    20,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
                                    lh: 26,
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 6,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: hTap(
                          context,
                          hbox(
                            bg: Color(0xFFFFFFFF),
                            radius: BorderRadius.circular(18),
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
                            pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                            child: hcol(
                              [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: hbox(
                                    w: 8,
                                    h: 8,
                                    bg: Color(0xFF17C964),
                                    radius: BorderRadius.circular(4),
                                  ),
                                ),
                                Text(
                                  '前台收银',
                                  style: hts(13, Color(0xFF52525B), lh: 18),
                                ),
                                Text(
                                  '2',
                                  style: hts(
                                    20,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
                                    lh: 26,
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 6,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: hTap(
                          context,
                          hbox(
                            bg: Color(0xFF18181B),
                            radius: BorderRadius.circular(18),
                            pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                            child: hcol(
                              [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: hbox(
                                    w: 8,
                                    h: 8,
                                    bg: Color(0xFF0485F7),
                                    radius: BorderRadius.circular(4),
                                  ),
                                ),
                                Text(
                                  '施工技师',
                                  style: hts(13, Color(0xFFA1A1AA), lh: 18),
                                ),
                                Text(
                                  '5',
                                  style: hts(
                                    20,
                                    Color(0xFFFAFAFA),
                                    w: FontWeight.w600,
                                    lh: 26,
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.stretch,
                              gap: 6,
                            ),
                          ),
                        ),
                      ),
                    ],
                    cross: CrossAxisAlignment.stretch,
                    gap: 8,
                    intrinsic: true,
                    min: false,
                  ),
                ], gap: 8),
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
                          pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
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
                                  style: hts(
                                    15,
                                    Color(0xFF1E63AE),
                                    w: FontWeight.w600,
                                  ),
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
                                          w: FontWeight.w500,
                                          lh: 22,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '李国强 ',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '· 镀晶 / 抛光',
                                            style: hts(
                                              12,
                                              Color(0xFF71717A),
                                              lh: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '本月 118 台次',
                                      style: hts(12, Color(0xFF71717A), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              hbox(
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(10),
                                pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: hrow(
                                  [
                                    hbox(
                                      w: 6,
                                      h: 6,
                                      bg: Color(0xFF0485F7),
                                      radius: BorderRadius.circular(3),
                                    ),
                                    Flexible(
                                      flex: 36,
                                      child: Text(
                                        '施工中',
                                        style: hts(
                                          12,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w500,
                                          lh: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 5,
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 12,
                          ),
                        ),
                        to: 'StaffDetail',
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                      ),
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFFDEFD6),
                                radius: BorderRadius.circular(20),
                                align: Alignment(0, 0),
                                child: Text(
                                  '张',
                                  style: hts(
                                    15,
                                    Color(0xFF855F2E),
                                    w: FontWeight.w600,
                                  ),
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
                                          w: FontWeight.w500,
                                          lh: 22,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '张伟 ',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '· 贴膜',
                                            style: hts(
                                              12,
                                              Color(0xFF71717A),
                                              lh: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '本月 46 台次',
                                      style: hts(12, Color(0xFF71717A), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              hbox(
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(10),
                                pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: hrow(
                                  [
                                    hbox(
                                      w: 6,
                                      h: 6,
                                      bg: Color(0xFF0485F7),
                                      radius: BorderRadius.circular(3),
                                    ),
                                    Flexible(
                                      flex: 36,
                                      child: Text(
                                        '施工中',
                                        style: hts(
                                          12,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w500,
                                          lh: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 5,
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 12,
                          ),
                        ),
                        to: 'StaffDetail',
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                      ),
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFDDF6E7),
                                radius: BorderRadius.circular(20),
                                align: Alignment(0, 0),
                                child: Text(
                                  '王',
                                  style: hts(
                                    15,
                                    Color(0xFF2B7745),
                                    w: FontWeight.w600,
                                  ),
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
                                          w: FontWeight.w500,
                                          lh: 22,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '王磊 ',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '· 洗车 / 内饰',
                                            style: hts(
                                              12,
                                              Color(0xFF71717A),
                                              lh: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '本月 203 台次',
                                      style: hts(12, Color(0xFF71717A), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              hbox(
                                bg: Color(0xFFDDF6E7),
                                radius: BorderRadius.circular(10),
                                pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: hrow(
                                  [
                                    hbox(
                                      w: 6,
                                      h: 6,
                                      bg: Color(0xFF17C964),
                                      radius: BorderRadius.circular(3),
                                    ),
                                    Flexible(
                                      flex: 24,
                                      child: Text(
                                        '空闲',
                                        style: hts(
                                          12,
                                          Color(0xFF2B7745),
                                          w: FontWeight.w500,
                                          lh: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 5,
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 12,
                          ),
                        ),
                        to: 'StaffDetail',
                      ),
                      hbox(
                        h: 1,
                        bg: Color(0xFFEFEFF1),
                        margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                      ),
                      hTap(
                        context,
                        hbox(
                          pad: EdgeInsets.fromLTRB(16, 12, 16, 12),
                          child: hrow(
                            [
                              hbox(
                                w: 40,
                                h: 40,
                                bg: Color(0xFFEEEEF0),
                                radius: BorderRadius.circular(20),
                                align: Alignment(0, 0),
                                child: Text(
                                  '刘',
                                  style: hts(
                                    15,
                                    Color(0xFF3F3F46),
                                    w: FontWeight.w600,
                                  ),
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
                                          w: FontWeight.w500,
                                          lh: 22,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '刘洋 ',
                                            style: hts(
                                              15,
                                              Color(0xFF18181B),
                                              w: FontWeight.w500,
                                              lh: 22,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '· 洗车',
                                            style: hts(
                                              12,
                                              Color(0xFF71717A),
                                              lh: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '本月 176 台次',
                                      style: hts(12, Color(0xFF71717A), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              hbox(
                                bg: Color(0xFFEEEEF0),
                                radius: BorderRadius.circular(10),
                                pad: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  '今日休息',
                                  style: hts(
                                    12,
                                    Color(0xFF52525B),
                                    w: FontWeight.w500,
                                    lh: 20,
                                  ),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 12,
                          ),
                        ),
                        to: 'StaffDetail',
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
                          Expanded(
                            flex: 1,
                            child: Text(
                              '技师可以',
                              style: hts(
                                15,
                                Color(0xFF18181B),
                                w: FontWeight.w600,
                                lh: 22,
                              ),
                            ),
                          ),
                          hTap(
                            context,
                            Text(
                              '编辑权限',
                              style: hts(
                                13,
                                Color(0xFF1E63AE),
                                w: FontWeight.w500,
                                lh: 18,
                              ),
                            ),
                            to: 'RolePermission',
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 0,
                      ),
                      hcol([
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hrow(
                                [
                                  hbox(
                                    w: 20,
                                    h: 20,
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(10),
                                    child: hrow(
                                      [hsvg(Svgs.s128, w: 12, h: 12)],
                                      main: MainAxisAlignment.center,
                                      cross: CrossAxisAlignment.center,
                                      gap: 0,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 104,
                                    child: Text(
                                      '查看派给我的工单',
                                      style: hts(13, Color(0xFF18181B), lh: 18),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 8,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hrow(
                                [
                                  hbox(
                                    w: 20,
                                    h: 20,
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(10),
                                    child: hrow(
                                      [hsvg(Svgs.s128, w: 12, h: 12)],
                                      main: MainAxisAlignment.center,
                                      cross: CrossAxisAlignment.center,
                                      gap: 0,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 78,
                                    child: Text(
                                      '更新施工进度',
                                      style: hts(13, Color(0xFF18181B), lh: 18),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 8,
                              ),
                            ),
                          ],
                          cross: CrossAxisAlignment.stretch,
                          gap: 0,
                          intrinsic: true,
                          min: false,
                        ),
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hrow(
                                [
                                  hbox(
                                    w: 20,
                                    h: 20,
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(10),
                                    child: hrow(
                                      [hsvg(Svgs.s128, w: 12, h: 12)],
                                      main: MainAxisAlignment.center,
                                      cross: CrossAxisAlignment.center,
                                      gap: 0,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 52,
                                    child: Text(
                                      '领用耗材',
                                      style: hts(13, Color(0xFF18181B), lh: 18),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 8,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hrow(
                                [
                                  hbox(
                                    w: 20,
                                    h: 20,
                                    bg: Color(0xFFDDF6E7),
                                    radius: BorderRadius.circular(10),
                                    child: hrow(
                                      [hsvg(Svgs.s128, w: 12, h: 12)],
                                      main: MainAxisAlignment.center,
                                      cross: CrossAxisAlignment.center,
                                      gap: 0,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 78,
                                    child: Text(
                                      '查看个人业绩',
                                      style: hts(13, Color(0xFF18181B), lh: 18),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 8,
                              ),
                            ),
                          ],
                          cross: CrossAxisAlignment.stretch,
                          gap: 0,
                          intrinsic: true,
                          min: false,
                        ),
                        hrow(
                          [
                            Expanded(
                              flex: 1,
                              child: hrow(
                                [
                                  hbox(
                                    w: 20,
                                    h: 20,
                                    bg: Color(0xFFEEEEF0),
                                    radius: BorderRadius.circular(10),
                                    child: hrow(
                                      [hsvg(Svgs.s129, w: 12, h: 12)],
                                      main: MainAxisAlignment.center,
                                      cross: CrossAxisAlignment.center,
                                      gap: 0,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 91,
                                    child: Text(
                                      '查看门店营业额',
                                      style: hts(13, Color(0xFF71717A), lh: 18),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 8,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: hrow(
                                [
                                  hbox(
                                    w: 20,
                                    h: 20,
                                    bg: Color(0xFFEEEEF0),
                                    radius: BorderRadius.circular(10),
                                    child: hrow(
                                      [hsvg(Svgs.s129, w: 12, h: 12)],
                                      main: MainAxisAlignment.center,
                                      cross: CrossAxisAlignment.center,
                                      gap: 0,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 91,
                                    child: Text(
                                      '会员充值与退款',
                                      style: hts(13, Color(0xFF71717A), lh: 18),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 8,
                              ),
                            ),
                          ],
                          cross: CrossAxisAlignment.stretch,
                          gap: 0,
                          intrinsic: true,
                          min: false,
                        ),
                      ], gap: 0),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 12,
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
