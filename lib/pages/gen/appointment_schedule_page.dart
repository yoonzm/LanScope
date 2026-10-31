import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class AppointmentSchedulePage extends StatelessWidget {
  const AppointmentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 992,
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
                        '预约管理',
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
                          [hsvg(Svgs.s7, w: 20, h: 20)],
                          main: MainAxisAlignment.center,
                          cross: CrossAxisAlignment.center,
                          gap: 0,
                        ),
                      ),
                      to: 'AppointmentSettings',
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
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
                  pad: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: hcol([
                    hrow(
                      [
                        Expanded(
                          flex: 1,
                          child: hTap(
                            context,
                            hbox(
                              radius: BorderRadius.circular(16),
                              pad: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: hcol(
                                [
                                  Text(
                                    '一',
                                    style: hts(11, Color(0xFF71717A), lh: 14),
                                  ),
                                  Text(
                                    '26',
                                    style: hts(
                                      17,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 24,
                                    ),
                                  ),
                                  Text(
                                    '—',
                                    style: hts(10, Color(0xFF71717A), lh: 12),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 2,
                              ),
                            ),
                            label: '一26—',
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: hTap(
                            context,
                            hbox(
                              radius: BorderRadius.circular(16),
                              pad: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: hcol(
                                [
                                  Text(
                                    '二',
                                    style: hts(11, Color(0xFF71717A), lh: 14),
                                  ),
                                  Text(
                                    '27',
                                    style: hts(
                                      17,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 24,
                                    ),
                                  ),
                                  Text(
                                    '1 单',
                                    style: hts(10, Color(0xFF71717A), lh: 12),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 2,
                              ),
                            ),
                            label: '二271 单',
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: hTap(
                            context,
                            hbox(
                              radius: BorderRadius.circular(16),
                              pad: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: hcol(
                                [
                                  Text(
                                    '三',
                                    style: hts(11, Color(0xFF71717A), lh: 14),
                                  ),
                                  Text(
                                    '28',
                                    style: hts(
                                      17,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 24,
                                    ),
                                  ),
                                  Text(
                                    '—',
                                    style: hts(10, Color(0xFF71717A), lh: 12),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 2,
                              ),
                            ),
                            label: '三28—',
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: hTap(
                            context,
                            hbox(
                              radius: BorderRadius.circular(16),
                              pad: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: hcol(
                                [
                                  Text(
                                    '四',
                                    style: hts(11, Color(0xFF71717A), lh: 14),
                                  ),
                                  Text(
                                    '29',
                                    style: hts(
                                      17,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 24,
                                    ),
                                  ),
                                  Text(
                                    '2 单',
                                    style: hts(10, Color(0xFF71717A), lh: 12),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 2,
                              ),
                            ),
                            label: '四292 单',
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: hTap(
                            context,
                            hbox(
                              radius: BorderRadius.circular(16),
                              pad: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: hcol(
                                [
                                  Text(
                                    '五',
                                    style: hts(11, Color(0xFF71717A), lh: 14),
                                  ),
                                  Text(
                                    '30',
                                    style: hts(
                                      17,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 24,
                                    ),
                                  ),
                                  Text(
                                    '3 单',
                                    style: hts(10, Color(0xFF71717A), lh: 12),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 2,
                              ),
                            ),
                            label: '五303 单',
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: hTap(
                            context,
                            hbox(
                              bg: Color(0xFF18181B),
                              radius: BorderRadius.circular(16),
                              pad: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: hcol(
                                [
                                  Text(
                                    '六',
                                    style: hts(11, Color(0xFFA1A1AA), lh: 14),
                                  ),
                                  Text(
                                    '31',
                                    style: hts(
                                      17,
                                      Color(0xFFFFFFFF),
                                      w: FontWeight.w600,
                                      lh: 24,
                                    ),
                                  ),
                                  Text(
                                    '6 单',
                                    style: hts(10, Color(0xFFA1A1AA), lh: 12),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 2,
                              ),
                            ),
                            label: '六316 单',
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: hTap(
                            context,
                            hbox(
                              radius: BorderRadius.circular(16),
                              pad: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: hcol(
                                [
                                  Text(
                                    '日',
                                    style: hts(11, Color(0xFF71717A), lh: 14),
                                  ),
                                  Text(
                                    '1',
                                    style: hts(
                                      17,
                                      Color(0xFF18181B),
                                      w: FontWeight.w600,
                                      lh: 24,
                                    ),
                                  ),
                                  Text(
                                    '2 单',
                                    style: hts(10, Color(0xFF71717A), lh: 12),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 2,
                              ),
                            ),
                            label: '日12 单',
                          ),
                        ),
                      ],
                      cross: CrossAxisAlignment.stretch,
                      gap: 2,
                      intrinsic: true,
                      min: false,
                    ),
                  ], gap: 2),
                ),
                hbox(
                  bg: Color(0xFFE9E9EB),
                  radius: BorderRadius.circular(20),
                  pad: EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: hrow(
                    [
                      Expanded(
                        flex: 1,
                        child: hTap(
                          context,
                          hbox(
                            h: 32,
                            radius: BorderRadius.circular(16),
                            child: Text(
                              '列表',
                              style: hts(
                                13,
                                Color(0xFF52525B),
                                w: FontWeight.w500,
                                lh: 32,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          to: 'Appointments',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: hbox(
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
                          child: Text(
                            '工位时间表',
                            style: hts(
                              13,
                              Color(0xFF18181B),
                              w: FontWeight.w500,
                              lh: 32,
                            ),
                            textAlign: TextAlign.center,
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
                  pad: EdgeInsets.fromLTRB(8, 14, 0, 14),
                  clip: true,
                  child: hcol(
                    [
                      hbox(
                        pad: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: hrow(
                          [
                            hbox(
                              w: 62,
                              child: Text(
                                '1 号',
                                style: hts(
                                  12,
                                  Color(0xFF52525B),
                                  w: FontWeight.w600,
                                  lh: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            hbox(
                              w: 62,
                              child: Text(
                                '2 号',
                                style: hts(
                                  12,
                                  Color(0xFF52525B),
                                  w: FontWeight.w600,
                                  lh: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            hbox(
                              w: 62,
                              child: Text(
                                '3 号',
                                style: hts(
                                  12,
                                  Color(0xFF52525B),
                                  w: FontWeight.w600,
                                  lh: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            hbox(
                              w: 62,
                              child: Text(
                                '4 号',
                                style: hts(
                                  12,
                                  Color(0xFF52525B),
                                  w: FontWeight.w600,
                                  lh: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            hbox(
                              w: 62,
                              child: Text(
                                '贴膜间',
                                style: hts(
                                  12,
                                  Color(0xFF52525B),
                                  w: FontWeight.w600,
                                  lh: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.start,
                          gap: 0,
                        ),
                      ),
                      hbox(
                        h: 484,
                        margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: hstack(
                          hcol(
                            [],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 0,
                            min: false,
                          ),
                          [
                            Positioned(
                              left: 0,
                              top: 0,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: -7,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '09:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 44,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 37,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '10:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 88,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 81,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '11:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 132,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 125,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '12:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 176,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 169,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '13:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 220,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 213,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '14:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 264,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 257,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '15:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 308,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 301,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '16:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 352,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 345,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '17:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 396,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 389,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '18:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 440,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 433,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '19:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 484,
                              right: 0,
                              height: 1,
                              child: hbox(h: 1, bg: Color(0xFFEFEFF1)),
                            ),
                            Positioned(
                              left: 0,
                              top: 477,
                              width: 34,
                              child: hbox(
                                w: 34,
                                child: Text(
                                  '20:00',
                                  style: hts(
                                    10,
                                    Color(0xFFA1A1AA),
                                    lh: 14,
                                    tab: true,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 0,
                              bottom: 0,
                              width: 1,
                              child: hbox(w: 1, bg: Color(0xFFF4F4F5)),
                            ),
                            Positioned(
                              left: 102,
                              top: 0,
                              bottom: 0,
                              width: 1,
                              child: hbox(w: 1, bg: Color(0xFFF4F4F5)),
                            ),
                            Positioned(
                              left: 164,
                              top: 0,
                              bottom: 0,
                              width: 1,
                              child: hbox(w: 1, bg: Color(0xFFF4F4F5)),
                            ),
                            Positioned(
                              left: 226,
                              top: 0,
                              bottom: 0,
                              width: 1,
                              child: hbox(w: 1, bg: Color(0xFFF4F4F5)),
                            ),
                            Positioned(
                              left: 288,
                              top: 0,
                              bottom: 0,
                              width: 1,
                              child: hbox(w: 1, bg: Color(0xFFF4F4F5)),
                            ),
                            Positioned(
                              left: 350,
                              top: 0,
                              bottom: 0,
                              width: 1,
                              child: hbox(w: 1, bg: Color(0xFFF4F4F5)),
                            ),
                            Positioned(
                              left: 42,
                              top: 24,
                              width: 58,
                              height: 40,
                              child: hTap(
                                context,
                                hbox(
                                  w: 58,
                                  h: 40,
                                  bg: Color(0xFFEEEEF0),
                                  radius: BorderRadius.circular(10),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xFFA1A1AA),
                                      width: 3,
                                    ),
                                  ),
                                  pad: EdgeInsets.fromLTRB(5, 4, 5, 4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Text(
                                        '沪B·3D82',
                                        style: hts(
                                          10,
                                          Color(0xFF52525B),
                                          w: FontWeight.w700,
                                          lh: 13,
                                        ),
                                      ),
                                      Text(
                                        '赵女士',
                                        style: hts(
                                          10,
                                          Color(0xFF52525B),
                                          lh: 13,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                    min: false,
                                  ),
                                ),
                                to: 'AppointmentDetail',
                              ),
                            ),
                            Positioned(
                              left: 42,
                              top: 398,
                              width: 58,
                              height: 62,
                              child: hTap(
                                context,
                                hbox(
                                  w: 58,
                                  h: 62,
                                  bg: Color(0xFFE1F0FE),
                                  radius: BorderRadius.circular(10),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xFF0485F7),
                                      width: 3,
                                    ),
                                  ),
                                  pad: EdgeInsets.fromLTRB(5, 4, 5, 4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Text(
                                        '沪A·6Q55',
                                        style: hts(
                                          10,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w700,
                                          lh: 13,
                                        ),
                                      ),
                                      Text(
                                        '周女士',
                                        style: hts(
                                          10,
                                          Color(0xFF1E63AE),
                                          lh: 13,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                    min: false,
                                  ),
                                ),
                                to: 'AppointmentDetail',
                              ),
                            ),
                            Positioned(
                              left: 104,
                              top: 90,
                              width: 58,
                              height: 62,
                              child: hTap(
                                context,
                                hbox(
                                  w: 58,
                                  h: 62,
                                  bg: Color(0xFFEEEEF0),
                                  radius: BorderRadius.circular(10),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xFFA1A1AA),
                                      width: 3,
                                    ),
                                  ),
                                  pad: EdgeInsets.fromLTRB(5, 4, 5, 4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Text(
                                        '沪A·7L30',
                                        style: hts(
                                          10,
                                          Color(0xFF52525B),
                                          w: FontWeight.w700,
                                          lh: 13,
                                        ),
                                      ),
                                      Text(
                                        '陈女士',
                                        style: hts(
                                          10,
                                          Color(0xFF52525B),
                                          lh: 13,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                    min: false,
                                  ),
                                ),
                                to: 'AppointmentDetail',
                              ),
                            ),
                            Positioned(
                              left: 104,
                              top: 288,
                              width: 58,
                              height: 62,
                              child: hTap(
                                context,
                                hbox(
                                  w: 58,
                                  h: 62,
                                  bg: Color(0xFFDDF6E7),
                                  radius: BorderRadius.circular(10),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xFF17C964),
                                      width: 3,
                                    ),
                                  ),
                                  pad: EdgeInsets.fromLTRB(5, 4, 5, 4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Text(
                                        '苏K·5F21',
                                        style: hts(
                                          10,
                                          Color(0xFF2B7745),
                                          w: FontWeight.w700,
                                          lh: 13,
                                        ),
                                      ),
                                      Text(
                                        '散客',
                                        style: hts(
                                          10,
                                          Color(0xFF2B7745),
                                          lh: 13,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                    min: false,
                                  ),
                                ),
                                to: 'AppointmentDetail',
                              ),
                            ),
                            Positioned(
                              left: 166,
                              top: 223.3,
                              width: 58,
                              height: 126.7,
                              child: hTap(
                                context,
                                hbox(
                                  w: 58,
                                  h: 126.7,
                                  bg: Color(0xFFFDEFD6),
                                  radius: BorderRadius.circular(10),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xFFF5A524),
                                      width: 3,
                                    ),
                                  ),
                                  pad: EdgeInsets.fromLTRB(5, 4, 5, 4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Text(
                                        '沪A·8K29',
                                        style: hts(
                                          10,
                                          Color(0xFF855F2E),
                                          w: FontWeight.w700,
                                          lh: 13,
                                        ),
                                      ),
                                      Text(
                                        '王建国',
                                        style: hts(
                                          10,
                                          Color(0xFF855F2E),
                                          lh: 13,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                    min: false,
                                  ),
                                ),
                                to: 'AppointmentDetail',
                              ),
                            ),
                            Positioned(
                              left: 228,
                              top: 332,
                              width: 58,
                              height: 40,
                              child: hTap(
                                context,
                                hbox(
                                  w: 58,
                                  h: 40,
                                  bg: Color(0xFFFFE1E2),
                                  radius: BorderRadius.circular(10),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xFFFF383C),
                                      width: 3,
                                    ),
                                  ),
                                  pad: EdgeInsets.fromLTRB(5, 4, 5, 4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Text(
                                        '沪A·2M11',
                                        style: hts(
                                          10,
                                          Color(0xFFA43433),
                                          w: FontWeight.w700,
                                          lh: 13,
                                        ),
                                      ),
                                      Text(
                                        '孙先生',
                                        style: hts(
                                          10,
                                          Color(0xFFA43433),
                                          lh: 13,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                    min: false,
                                  ),
                                ),
                                to: 'AppointmentDetail',
                              ),
                            ),
                            Positioned(
                              left: 228,
                              top: 376,
                              width: 58,
                              height: 62,
                              child: hTap(
                                context,
                                hbox(
                                  w: 58,
                                  h: 62,
                                  bg: Color(0xFFE1F0FE),
                                  radius: BorderRadius.circular(10),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xFF0485F7),
                                      width: 3,
                                    ),
                                  ),
                                  pad: EdgeInsets.fromLTRB(5, 4, 5, 4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Text(
                                        '沪C·9H31',
                                        style: hts(
                                          10,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w700,
                                          lh: 13,
                                        ),
                                      ),
                                      Text(
                                        '刘先生',
                                        style: hts(
                                          10,
                                          Color(0xFF1E63AE),
                                          lh: 13,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                    min: false,
                                  ),
                                ),
                                to: 'AppointmentDetail',
                              ),
                            ),
                            Positioned(
                              left: 290,
                              top: 2,
                              width: 58,
                              height: 480,
                              child: hTap(
                                context,
                                hbox(
                                  w: 58,
                                  h: 480,
                                  bg: Color(0xFFFDEFD6),
                                  radius: BorderRadius.circular(10),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xFFF5A524),
                                      width: 3,
                                    ),
                                  ),
                                  pad: EdgeInsets.fromLTRB(5, 4, 5, 4),
                                  clip: true,
                                  child: hcol(
                                    [
                                      Text(
                                        '沪AD·6120',
                                        style: hts(
                                          10,
                                          Color(0xFF855F2E),
                                          w: FontWeight.w700,
                                          lh: 13,
                                        ),
                                      ),
                                      Text(
                                        '隐形车衣',
                                        style: hts(
                                          10,
                                          Color(0xFF855F2E),
                                          lh: 13,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 1,
                                    min: false,
                                  ),
                                ),
                                to: 'AppointmentDetail',
                              ),
                            ),
                            Positioned(
                              left: 36,
                              top: 342.5,
                              right: 0,
                              height: 2,
                              child: hbox(h: 2, bg: Color(0xFFFF383C)),
                            ),
                            Positioned(
                              left: 32,
                              top: 338.5,
                              width: 8,
                              height: 8,
                              child: hbox(
                                w: 8,
                                h: 8,
                                bg: Color(0xFFFF383C),
                                radius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      hwrap(
                        [
                          hrow(
                            [
                              hbox(
                                w: 10,
                                h: 10,
                                bg: Color(0xFFE1F0FE),
                                radius: BorderRadius.circular(3),
                              ),
                              Flexible(
                                flex: 33,
                                child: Text(
                                  '待到店',
                                  style: hts(11, Color(0xFF52525B), lh: 14),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 5,
                          ),
                          hrow(
                            [
                              hbox(
                                w: 10,
                                h: 10,
                                bg: Color(0xFFDDF6E7),
                                radius: BorderRadius.circular(3),
                              ),
                              Flexible(
                                flex: 33,
                                child: Text(
                                  '已到店',
                                  style: hts(11, Color(0xFF52525B), lh: 14),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 5,
                          ),
                          hrow(
                            [
                              hbox(
                                w: 10,
                                h: 10,
                                bg: Color(0xFFFDEFD6),
                                radius: BorderRadius.circular(3),
                              ),
                              Flexible(
                                flex: 33,
                                child: Text(
                                  '施工中',
                                  style: hts(11, Color(0xFF52525B), lh: 14),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 5,
                          ),
                          hrow(
                            [
                              hbox(
                                w: 10,
                                h: 10,
                                bg: Color(0xFFFFE1E2),
                                radius: BorderRadius.circular(3),
                              ),
                              Flexible(
                                flex: 44,
                                child: Text(
                                  '超时未到',
                                  style: hts(11, Color(0xFF52525B), lh: 14),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 5,
                          ),
                          hrow(
                            [
                              hbox(
                                w: 10,
                                h: 10,
                                bg: Color(0xFFEEEEF0),
                                radius: BorderRadius.circular(3),
                              ),
                              Flexible(
                                flex: 33,
                                child: Text(
                                  '已完成',
                                  style: hts(11, Color(0xFF52525B), lh: 14),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 5,
                          ),
                        ],
                        gap: 0,
                        rowGap: 0,
                        cross: WrapCrossAlignment.start,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 8,
                  ),
                ),
                Text(
                  '共 6 个工位，此处显示 5 个 · 点击色块查看预约',
                  style: hts(12, Color(0xFFA1A1AA), lh: 18),
                  textAlign: TextAlign.center,
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
                      bg: Color(0xFF18181B),
                      radius: BorderRadius.circular(25),
                      child: hrow(
                        [
                          hsvg(Svgs.s8, w: 18, h: 18),
                          Flexible(
                            flex: 60,
                            child: Text(
                              '新建预约',
                              style: hts(
                                15,
                                Color(0xFFFFFFFF),
                                w: FontWeight.w600,
                                lh: 22,
                              ),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.center,
                        cross: CrossAxisAlignment.center,
                        gap: 6,
                      ),
                    ),
                    to: 'AppointmentAdd',
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
