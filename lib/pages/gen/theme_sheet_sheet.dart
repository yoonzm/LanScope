import 'package:flutter/material.dart';

import '../../kit/kit.dart';

class ThemeSheetSheet extends StatelessWidget {
  const ThemeSheetSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return hbox(
      bg: Color(0xFFFFFFFF),
      radius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
        bottomRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
      ),
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
            '外观',
            style: hts(20, Color(0xFF18181B), w: FontWeight.w600, lh: 28),
          ),
          HSelHolder(
            groups: [
              ({0}, false),
            ],
            builder: (context, g1) => hcol(
              [
                HSel(
                  ctrl: g1[0],
                  index: 0,
                  on: hbox(
                    bg: Color(0xFFE1F0FE),
                    radius: BorderRadius.circular(18),
                    border: Border.all(color: Color(0xFF0485F7), width: 1.5),
                    pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    child: hrow(
                      [
                        Expanded(
                          flex: 1,
                          child: hcol(
                            [
                              Text(
                                '跟随系统',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '根据手机设置自动切换',
                                style: hts(12, Color(0xFF71717A), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
                          ),
                        ),
                        hbox(
                          w: 44,
                          h: 44,
                          grad: LinearGradient(
                            begin: Alignment(-0.707, -0.707),
                            end: Alignment(0.707, 0.707),
                            colors: [Color(0xFFFFFFFF), Color(0xFF18181B)],
                            stops: [0.5, 0.5],
                          ),
                          radius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFE4E4E7),
                            width: 1,
                          ),
                          child: hrow(
                            [
                              hbox(
                                w: 20,
                                h: 8,
                                bg: Color(0xFF0485F7),
                                radius: BorderRadius.circular(4),
                              ),
                            ],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 10,
                    ),
                  ),
                  off: hbox(
                    bg: Color(0xFFE1F0FE),
                    radius: BorderRadius.circular(18),
                    pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    child: hrow(
                      [
                        Expanded(
                          flex: 1,
                          child: hcol(
                            [
                              Text(
                                '跟随系统',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '根据手机设置自动切换',
                                style: hts(12, Color(0xFF71717A), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
                          ),
                        ),
                        hbox(
                          w: 44,
                          h: 44,
                          grad: LinearGradient(
                            begin: Alignment(-0.707, -0.707),
                            end: Alignment(0.707, 0.707),
                            colors: [Color(0xFFFFFFFF), Color(0xFF18181B)],
                            stops: [0.5, 0.5],
                          ),
                          radius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFE4E4E7),
                            width: 1,
                          ),
                          child: hrow(
                            [
                              hbox(
                                w: 20,
                                h: 8,
                                bg: Color(0xFF0485F7),
                                radius: BorderRadius.circular(4),
                              ),
                            ],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 10,
                    ),
                  ),
                ),
                HSel(
                  ctrl: g1[0],
                  index: 1,
                  on: hbox(
                    bg: Color(0xFFF4F4F5),
                    radius: BorderRadius.circular(18),
                    border: Border.all(color: Color(0xFF0485F7), width: 1.5),
                    pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    child: hrow(
                      [
                        Expanded(
                          flex: 1,
                          child: hcol(
                            [
                              Text(
                                '浅色',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              SizedBox.shrink(),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
                          ),
                        ),
                        hbox(
                          w: 44,
                          h: 44,
                          bg: Color(0xFFF4F4F5),
                          radius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFE4E4E7),
                            width: 1,
                          ),
                          child: hrow(
                            [
                              hbox(
                                w: 20,
                                h: 8,
                                bg: Color(0xFF18181B),
                                radius: BorderRadius.circular(4),
                              ),
                            ],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 10,
                    ),
                  ),
                  off: hbox(
                    bg: Color(0xFFF4F4F5),
                    radius: BorderRadius.circular(18),
                    pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    child: hrow(
                      [
                        Expanded(
                          flex: 1,
                          child: hcol(
                            [
                              Text(
                                '浅色',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              SizedBox.shrink(),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
                          ),
                        ),
                        hbox(
                          w: 44,
                          h: 44,
                          bg: Color(0xFFF4F4F5),
                          radius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFE4E4E7),
                            width: 1,
                          ),
                          child: hrow(
                            [
                              hbox(
                                w: 20,
                                h: 8,
                                bg: Color(0xFF18181B),
                                radius: BorderRadius.circular(4),
                              ),
                            ],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 10,
                    ),
                  ),
                ),
                HSel(
                  ctrl: g1[0],
                  index: 2,
                  on: hbox(
                    bg: Color(0xFFF4F4F5),
                    radius: BorderRadius.circular(18),
                    border: Border.all(color: Color(0xFF0485F7), width: 1.5),
                    pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    child: hrow(
                      [
                        Expanded(
                          flex: 1,
                          child: hcol(
                            [
                              Text(
                                '深色',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '适合夜间或光线较暗的环境',
                                style: hts(12, Color(0xFF71717A), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
                          ),
                        ),
                        hbox(
                          w: 44,
                          h: 44,
                          bg: Color(0xFF18181B),
                          radius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFE4E4E7),
                            width: 1,
                          ),
                          child: hrow(
                            [
                              hbox(
                                w: 20,
                                h: 8,
                                bg: Color(0xFFFAFAFA),
                                radius: BorderRadius.circular(4),
                              ),
                            ],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 10,
                    ),
                  ),
                  off: hbox(
                    bg: Color(0xFFF4F4F5),
                    radius: BorderRadius.circular(18),
                    pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
                    child: hrow(
                      [
                        Expanded(
                          flex: 1,
                          child: hcol(
                            [
                              Text(
                                '深色',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '适合夜间或光线较暗的环境',
                                style: hts(12, Color(0xFF71717A), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
                          ),
                        ),
                        hbox(
                          w: 44,
                          h: 44,
                          bg: Color(0xFF18181B),
                          radius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFE4E4E7),
                            width: 1,
                          ),
                          child: hrow(
                            [
                              hbox(
                                w: 20,
                                h: 8,
                                bg: Color(0xFFFAFAFA),
                                radius: BorderRadius.circular(4),
                              ),
                            ],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
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
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.stretch,
              gap: 8,
            ),
          ),
          hrow(
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
                  to: 'Settings',
                ),
              ),
              Expanded(
                flex: 16,
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
                        '应用',
                        style: hts(
                          15,
                          Color(0xFFFFFFFF),
                          w: FontWeight.w600,
                          lh: 22,
                        ),
                      ),
                    ),
                  ),
                  to: 'Settings',
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
    );
  }
}
