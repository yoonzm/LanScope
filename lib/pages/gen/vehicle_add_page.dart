import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class VehicleAddPage extends StatelessWidget {
  const VehicleAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 940,
      fixedHeight: false,
      flow: hcol(
        [
          hbox(
            pad: EdgeInsets.fromLTRB(20, topInset(context), 20, 32),
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
                          [hsvg(Svgs.s28, w: 20, h: 20)],
                          main: MainAxisAlignment.center,
                          cross: CrossAxisAlignment.center,
                          gap: 0,
                        ),
                      ),
                      to: 'MemberDetail',
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '添加车辆',
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
                        bg: Color(0xFF0485F7),
                        radius: BorderRadius.circular(22),
                        pad: EdgeInsets.fromLTRB(18, 0, 18, 0),
                        child: Align(
                          alignment: Alignment(-1, 0),
                          widthFactor: 1,
                          child: Text(
                            '保存',
                            style: hts(
                              14,
                              Color(0xFFFFFFFF),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                        ),
                      ),
                      to: 'MemberDetail',
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hTap(
                  context,
                  hbox(
                    h: 150,
                    bg: Color(0xFFFFFFFF),
                    radius: BorderRadius.circular(24),
                    border: Border.all(color: Color(0xFFA1A1AA), width: 1.5),
                    child: hstack(
                      hcol(
                        [
                          Align(
                            alignment: Alignment.topLeft,
                            child: hbox(
                              w: 48,
                              h: 48,
                              bg: Color(0xFF18181B),
                              radius: BorderRadius.circular(24),
                              child: hrow(
                                [hsvg(Svgs.s147, w: 22, h: 22)],
                                main: MainAxisAlignment.center,
                                cross: CrossAxisAlignment.center,
                                gap: 0,
                              ),
                            ),
                          ),
                          Text(
                            '拍摄行驶证，自动填写',
                            style: hts(
                              14,
                              Color(0xFF18181B),
                              w: FontWeight.w500,
                              lh: 20,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.center,
                        cross: CrossAxisAlignment.center,
                        gap: 10,
                        min: false,
                      ),
                      [
                        Positioned(
                          left: 14,
                          top: 14,
                          right: 14,
                          bottom: 14,
                          child: hbox(
                            bg: Color(0xFFF4F4F5),
                            radius: BorderRadius.circular(14),
                          ),
                        ),
                      ],
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
                  pad: EdgeInsets.fromLTRB(0, 16, 0, 4),
                  child: hcol(
                    [
                      hbox(
                        bg: Color(0xFFEEEEF0),
                        radius: BorderRadius.circular(18),
                        pad: EdgeInsets.fromLTRB(4, 4, 4, 4),
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: HSelHolder(
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
                                  on: hTap(
                                    context,
                                    hbox(
                                      h: 32,
                                      bg: Color(0xFFFFFFFF),
                                      radius: BorderRadius.circular(16),
                                      shadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.08),
                                          offset: Offset(0, 1),
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                      child: Align(
                                        alignment: Alignment.center,
                                        widthFactor: 1,
                                        child: Text(
                                          '燃油车 · 蓝牌',
                                          style: hts(
                                            13,
                                            Color(0xFF18181B),
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
                                      h: 32,
                                      radius: BorderRadius.circular(16),
                                      child: Align(
                                        alignment: Alignment.center,
                                        widthFactor: 1,
                                        child: Text(
                                          '燃油车 · 蓝牌',
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
                              ),
                              Expanded(
                                flex: 1,
                                child: HSel(
                                  ctrl: g1[0],
                                  index: 1,
                                  on: hTap(
                                    context,
                                    hbox(
                                      h: 32,
                                      bg: Color(0xFFFFFFFF),
                                      radius: BorderRadius.circular(16),
                                      shadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.08),
                                          offset: Offset(0, 1),
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                      child: Align(
                                        alignment: Alignment.center,
                                        widthFactor: 1,
                                        child: Text(
                                          '新能源 · 绿牌',
                                          style: hts(
                                            13,
                                            Color(0xFF18181B),
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
                                      h: 32,
                                      radius: BorderRadius.circular(16),
                                      child: Align(
                                        alignment: Alignment.center,
                                        widthFactor: 1,
                                        child: Text(
                                          '新能源 · 绿牌',
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
                        pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: hcol([
                          hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 46,
                                  bg: Color(0xFF1F9D55),
                                  radius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '沪',
                                      style: hts(
                                        18,
                                        Color(0xFFFFFFFF),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 46,
                                  bg: Color(0xFFE8F7EE),
                                  radius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      'A',
                                      style: hts(
                                        18,
                                        Color(0xFF14532D),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 46,
                                  bg: Color(0xFFE8F7EE),
                                  radius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      'F',
                                      style: hts(
                                        18,
                                        Color(0xFF14532D),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 46,
                                  bg: Color(0xFFE8F7EE),
                                  radius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '0',
                                      style: hts(
                                        18,
                                        Color(0xFF14532D),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 46,
                                  bg: Color(0xFFE8F7EE),
                                  radius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '9',
                                      style: hts(
                                        18,
                                        Color(0xFF14532D),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 46,
                                  bg: Color(0xFFE8F7EE),
                                  radius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '3',
                                      style: hts(
                                        18,
                                        Color(0xFF14532D),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 46,
                                  bg: Color(0xFFE8F7EE),
                                  radius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '1',
                                      style: hts(
                                        18,
                                        Color(0xFF14532D),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 46,
                                  bg: Color(0xFFE8F7EE),
                                  radius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    widthFactor: 1,
                                    child: Text(
                                      '6',
                                      style: hts(
                                        18,
                                        Color(0xFF14532D),
                                        w: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            cross: CrossAxisAlignment.stretch,
                            gap: 5,
                            intrinsic: true,
                            min: false,
                          ),
                        ], gap: 5),
                      ),
                      hcol(
                        [
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
                                      '品牌车型',
                                      style: hts(14, Color(0xFF52525B), lh: 20),
                                    ),
                                  ),
                                  Text(
                                    '理想 L7 · 灰',
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                  ),
                                  hsvg(Svgs.s9, w: 16, h: 16),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 12,
                              ),
                            ),
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
                                hbox(
                                  w: 64,
                                  child: Text(
                                    '车架号',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                Expanded(
                                  child: HInput(
                                    style: hts(
                                      15,
                                      Color(0xFF18181B),
                                      lh: 22,
                                      ls: 0.3,
                                    ),
                                    value: '[17 位 VIN]',
                                    align: TextAlign.right,
                                  ),
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
                            minH: 54,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '当前里程',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                Expanded(
                                  child: hbox(
                                    w: 80,
                                    child: HInput(
                                      style: hts(
                                        15,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                        lh: 22,
                                      ),
                                      value: '18,600',
                                      keyboard: TextInputType.number,
                                      align: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Text(
                                  'km',
                                  style: hts(14, Color(0xFF71717A), lh: 20),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.center,
                              gap: 8,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 0,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 12,
                  ),
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '到期提醒 · 自动加入回访',
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
                            minH: 58,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '车险到期',
                                        style: hts(
                                          15,
                                          Color(0xFF18181B),
                                          lh: 22,
                                        ),
                                      ),
                                      Text(
                                        '2027.03.12 · 提前 30 天提醒',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 0,
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
                          hbox(
                            minH: 58,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '镀晶养护',
                                        style: hts(
                                          15,
                                          Color(0xFF18181B),
                                          lh: 22,
                                        ),
                                      ),
                                      Text(
                                        '施工后每 3 个月提醒复养',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 0,
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
                          hbox(
                            minH: 58,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: hcol(
                                    [
                                      Text(
                                        '年检到期',
                                        style: hts(
                                          15,
                                          Color(0xFF18181B),
                                          lh: 22,
                                        ),
                                      ),
                                      Text(
                                        '未设置',
                                        style: hts(
                                          12,
                                          Color(0xFF71717A),
                                          lh: 16,
                                        ),
                                      ),
                                    ],
                                    main: MainAxisAlignment.start,
                                    cross: CrossAxisAlignment.stretch,
                                    gap: 0,
                                  ),
                                ),
                                HSwitch(initial: false),
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
