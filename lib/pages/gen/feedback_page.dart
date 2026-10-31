import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

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
                        '意见反馈',
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
                      hcol(
                        [
                          Text(
                            '反馈类型',
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
                                  on: hbox(
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
                                        '功能建议',
                                        style: hts(
                                          13,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w500,
                                          lh: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  off: hbox(
                                    h: 34,
                                    bg: Color(0xFFE1F0FE),
                                    radius: BorderRadius.circular(17),
                                    pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '功能建议',
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
                                HSel(
                                  ctrl: g1[0],
                                  index: 1,
                                  on: hbox(
                                    h: 34,
                                    bg: Color(0xFFF4F4F5),
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
                                        '问题报告',
                                        style: hts(
                                          13,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w500,
                                          lh: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  off: hbox(
                                    h: 34,
                                    bg: Color(0xFFF4F4F5),
                                    radius: BorderRadius.circular(17),
                                    pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '问题报告',
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
                                HSel(
                                  ctrl: g1[0],
                                  index: 2,
                                  on: hbox(
                                    h: 34,
                                    bg: Color(0xFFF4F4F5),
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
                                        '账号与付费',
                                        style: hts(
                                          13,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w500,
                                          lh: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  off: hbox(
                                    h: 34,
                                    bg: Color(0xFFF4F4F5),
                                    radius: BorderRadius.circular(17),
                                    pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '账号与付费',
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
                                HSel(
                                  ctrl: g1[0],
                                  index: 3,
                                  on: hbox(
                                    h: 34,
                                    bg: Color(0xFFF4F4F5),
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
                                        '其他',
                                        style: hts(
                                          13,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w500,
                                          lh: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  off: hbox(
                                    h: 34,
                                    bg: Color(0xFFF4F4F5),
                                    radius: BorderRadius.circular(17),
                                    pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '其他',
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
                              ],
                              gap: 8,
                              rowGap: 8,
                              cross: WrapCrossAlignment.start,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 8,
                      ),
                      hcol(
                        [
                          Text(
                            '详细描述',
                            style: hts(
                              14,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 20,
                            ),
                          ),
                          hbox(
                            minH: 130,
                            bg: Color(0xFFF4F4F5),
                            radius: BorderRadius.circular(14),
                            pad: EdgeInsets.fromLTRB(12, 10, 12, 10),
                            child: HInput(
                              style: hts(14, Color(0xFF18181B), lh: 22),
                              maxLines: 4,
                              hint: '请描述您遇到的问题或建议，越具体越好',
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 8,
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
                                  text: '截图 ',
                                  style: hts(
                                    14,
                                    Color(0xFF18181B),
                                    w: FontWeight.w600,
                                    lh: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: '· 选填，最多 3 张',
                                  style: hts(14, Color(0xFF71717A), lh: 20),
                                ),
                              ],
                            ),
                          ),
                          hrow(
                            [
                              hbox(
                                w: 76,
                                h: 76,
                                bg: Color(0xFFFAFAFA),
                                radius: BorderRadius.circular(16),
                                dashed: true,
                                dashColor: Color(0xFFD4D4D8),
                                dashWidth: 2,
                                child: hrow(
                                  [hsvg(Svgs.s76, w: 22, h: 22)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                              hbox(
                                w: 76,
                                h: 76,
                                bg: Color(0xFFFAFAFA),
                                radius: BorderRadius.circular(16),
                                dashed: true,
                                dashColor: Color(0xFFD4D4D8),
                                dashWidth: 2,
                                child: hrow(
                                  [hsvg(Svgs.s76, w: 22, h: 22)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
                                ),
                              ),
                              hbox(
                                w: 76,
                                h: 76,
                                bg: Color(0xFFFAFAFA),
                                radius: BorderRadius.circular(16),
                                dashed: true,
                                dashColor: Color(0xFFD4D4D8),
                                dashWidth: 2,
                                child: hrow(
                                  [hsvg(Svgs.s76, w: 22, h: 22)],
                                  main: MainAxisAlignment.center,
                                  cross: CrossAxisAlignment.center,
                                  gap: 0,
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
                        gap: 8,
                      ),
                      hcol(
                        [
                          Text(
                            '联系方式',
                            style: hts(
                              13,
                              Color(0xFF18181B),
                              w: FontWeight.w500,
                              lh: 18,
                            ),
                          ),
                          hbox(
                            minH: 48,
                            bg: Color(0xFFF4F4F5),
                            radius: BorderRadius.circular(14),
                            pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                            child: hrow(
                              [
                                Expanded(
                                  child: HInput(
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                    hint: '手机号或邮箱（选填）',
                                    value: '139 **** 8812',
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.center,
                              gap: 10,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 16,
                  ),
                ),
                Text(
                  '我们会在 1–3 个工作日内通过站内消息回复',
                  style: hts(12, Color(0xFFA1A1AA)),
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
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '提交反馈',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'AboutApp',
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
