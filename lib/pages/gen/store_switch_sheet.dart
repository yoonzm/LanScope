import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class StoreSwitchSheet extends StatelessWidget {
  const StoreSwitchSheet({super.key});

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
            '切换门店',
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
                                '驰光汽车美容 · 徐汇店',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '营业中 · 今日 ¥12,860',
                                style: hts(12, Color(0xFF71717A), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
                          ),
                        ),
                        hbox(
                          w: 20,
                          h: 20,
                          bg: Color.fromRGBO(23, 201, 100, 0.133),
                          radius: BorderRadius.circular(10),
                          child: hrow(
                            [hsvg(Svgs.s11, w: 12, h: 12)],
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
                                '驰光汽车美容 · 徐汇店',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '营业中 · 今日 ¥12,860',
                                style: hts(12, Color(0xFF71717A), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
                          ),
                        ),
                        hbox(
                          w: 20,
                          h: 20,
                          bg: Color.fromRGBO(23, 201, 100, 0.133),
                          radius: BorderRadius.circular(10),
                          child: hrow(
                            [hsvg(Svgs.s11, w: 12, h: 12)],
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
                                '驰光汽车美容 · 浦东店',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '营业中 · 今日 ¥8,420',
                                style: hts(12, Color(0xFF71717A), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
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
                                '驰光汽车美容 · 浦东店',
                                style: hts(
                                  15,
                                  Color(0xFF18181B),
                                  w: FontWeight.w600,
                                  lh: 22,
                                ),
                              ),
                              Text(
                                '营业中 · 今日 ¥8,420',
                                style: hts(12, Color(0xFF71717A), lh: 16),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 1,
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
          hTap(
            context,
            hbox(
              radius: BorderRadius.circular(18),
              dashed: true,
              dashColor: Color(0xFFD4D4D8),
              dashWidth: 2,
              pad: EdgeInsets.fromLTRB(14, 12, 14, 12),
              child: hrow(
                [
                  hsvg(Svgs.s178, w: 20, h: 20),
                  Expanded(
                    flex: 1,
                    child: hcol(
                      [
                        Text(
                          '新增门店',
                          style: hts(15, Color(0xFF1E63AE), w: FontWeight.w600),
                        ),
                        Text(
                          '专业版最多 3 家，还可添加 1 家',
                          style: hts(12, Color(0xFF71717A)),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.stretch,
                      gap: 0,
                    ),
                  ),
                ],
                main: MainAxisAlignment.start,
                cross: CrossAxisAlignment.center,
                gap: 12,
              ),
            ),
            to: 'StoreEdit',
          ),
        ],
        main: MainAxisAlignment.start,
        cross: CrossAxisAlignment.stretch,
        gap: 14,
      ),
    );
  }
}
