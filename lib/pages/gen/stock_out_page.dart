import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class StockOutPage extends StatelessWidget {
  const StockOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 1240,
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
                        '商品出库',
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
                      Text(
                        '出库类型',
                        style: hts(
                          14,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 20,
                        ),
                      ),
                      HSelHolder(
                        groups: [
                          ({0}, false),
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
                                      '施工领用',
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
                                      '施工领用',
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
                                      '损耗报废',
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
                                      '损耗报废',
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
                                      '退回供应商',
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
                                      '退回供应商',
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
                                      '内部使用',
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
                                      '内部使用',
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
                    gap: 14,
                  ),
                ),
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '关联信息',
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
                            minH: 54,
                            pad: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: hrow(
                              [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '关联工单',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                Text(
                                  '沪A·8K29M 镀晶养护',
                                  style: hts(15, Color(0xFF18181B), lh: 22),
                                ),
                                hsvg(Svgs.s9, w: 16, h: 16),
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
                                    '领用技师',
                                    style: hts(14, Color(0xFF52525B), lh: 20),
                                  ),
                                ),
                                Text(
                                  '老周',
                                  style: hts(15, Color(0xFF18181B), lh: 22),
                                ),
                                hsvg(Svgs.s9, w: 16, h: 16),
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
                hcol(
                  [
                    hbox(
                      pad: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                        '出库明细',
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
                      pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: hcol(
                        [
                          hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hcol(
                                  [
                                    Text(
                                      'TPU 隐形车衣 7.5mil',
                                      style: hts(
                                        15,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                        lh: 22,
                                      ),
                                    ),
                                    Text(
                                      '出库后 1.5 卷，低于安全库存',
                                      style: hts(12, Color(0xFFA43433), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              hrow(
                                [
                                  hTap(
                                    context,
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(16),
                                      child: hrow(
                                        [hsvg(Svgs.s7, w: 14, h: 14)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 25,
                                    child: hbox(
                                      minW: 36,
                                      child: Text(
                                        '0.5',
                                        style: hts(
                                          15,
                                          Color(0xFF18181B),
                                          w: FontWeight.w600,
                                          lh: 22,
                                          tab: true,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  hTap(
                                    context,
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(16),
                                      child: hrow(
                                        [hsvg(Svgs.s8, w: 14, h: 14)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 4,
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 10,
                          ),
                          hbox(h: 1, bg: Color(0xFFEFEFF1)),
                          hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hcol(
                                  [
                                    Text(
                                      '9H 陶瓷镀晶液 50ml',
                                      style: hts(
                                        15,
                                        Color(0xFF18181B),
                                        w: FontWeight.w600,
                                        lh: 22,
                                      ),
                                    ),
                                    Text(
                                      '库存 6 瓶 → 出库后 5 瓶',
                                      style: hts(12, Color(0xFF71717A), lh: 16),
                                    ),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.stretch,
                                  gap: 2,
                                ),
                              ),
                              hrow(
                                [
                                  hTap(
                                    context,
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(16),
                                      child: hrow(
                                        [hsvg(Svgs.s7, w: 14, h: 14)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 9,
                                    child: hbox(
                                      minW: 36,
                                      child: Text(
                                        '1',
                                        style: hts(
                                          15,
                                          Color(0xFF18181B),
                                          w: FontWeight.w600,
                                          lh: 22,
                                          tab: true,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  hTap(
                                    context,
                                    hbox(
                                      w: 32,
                                      h: 32,
                                      bg: Color(0xFFF4F4F5),
                                      radius: BorderRadius.circular(16),
                                      child: hrow(
                                        [hsvg(Svgs.s8, w: 14, h: 14)],
                                        main: MainAxisAlignment.center,
                                        cross: CrossAxisAlignment.center,
                                        gap: 0,
                                      ),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.start,
                                cross: CrossAxisAlignment.center,
                                gap: 4,
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.center,
                            gap: 10,
                          ),
                          hTap(
                            context,
                            hbox(
                              h: 42,
                              bg: Color(0xFFE1F0FE),
                              radius: BorderRadius.circular(21),
                              child: hrow(
                                [
                                  hsvg(Svgs.s133, w: 16, h: 16),
                                  Flexible(
                                    flex: 56,
                                    child: Text(
                                      '添加商品',
                                      style: hts(
                                        14,
                                        Color(0xFF1E63AE),
                                        w: FontWeight.w600,
                                        lh: 20,
                                      ),
                                    ),
                                  ),
                                ],
                                main: MainAxisAlignment.center,
                                cross: CrossAxisAlignment.center,
                                gap: 6,
                              ),
                            ),
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
                  child: hrow(
                    [
                      hbox(
                        w: 32,
                        h: 32,
                        bg: Color(0xFFFDEFD6),
                        radius: BorderRadius.circular(10),
                        child: hrow(
                          [hsvg(Svgs.s135, w: 18, h: 18)],
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
                              '本次领用成本',
                              style: hts(
                                14,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
                                lh: 20,
                              ),
                            ),
                            Text(
                              '将计入该工单的成本核算',
                              style: hts(12, Color(0xFF71717A), lh: 16),
                            ),
                          ],
                          main: MainAxisAlignment.start,
                          cross: CrossAxisAlignment.stretch,
                          gap: 1,
                        ),
                      ),
                      Text(
                        '¥1,358.00',
                        style: hts(
                          20,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 26,
                        ),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.center,
                    gap: 12,
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
                          hint: '如：边角料损耗、重新施工补领',
                        ),
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 8,
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
                    to: 'Inventory',
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
                          '确认出库',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Inventory',
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
